using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Extensions;
using System.Collections.Specialized;
using DbFactory;
using System.Configuration;

namespace Service.Common
{
    public class Repository : IRepository
    {
        protected string ConnectionString = string.Empty;
        protected string TableName = string.Empty;
        protected virtual string PrimaryKeyField { get; set; }
        public IList<string> Errors = new List<string>();

        /// <summary>
        /// Reads first connection string from App.config/Web.config
        /// </summary>
        /// <param name="tableName">Name of the table</param>
        /// <param name="primaryKeyField">Primary Key Fiekd Name</param>
        public Repository(string tableName, string primaryKeyField = "id")
        {
            this.ConnectionString = ConfigurationManager.ConnectionStrings[0].ConnectionString;
            this.TableName = tableName;
            this.PrimaryKeyField = primaryKeyField;
        }

        /// <summary>
        /// Create repository with explicit config value of connection string
        /// </summary>
        /// <param name="tableName">Name of the table</param>
        /// <param name="connectionString">Connection String name from app.config</param>
        /// <param name="primaryKeyField">Primary Key Fiekd Name</param>
        public Repository(string tableName, string connectionString, string primaryKeyField = "id")
        {
            this.ConnectionString = connectionString;
            this.TableName = tableName;
            this.PrimaryKeyField = primaryKeyField;
        }

        public virtual bool HasPrimaryKey(object o)
        {
            return o.ToDictionary().ContainsKey(PrimaryKeyField);
        }

        public bool IsValid(dynamic item)
        {
            Errors.Clear();
            Validate(item);
            return Errors.Count == 0;
        }

        /// <summary>
        /// create record by passing on POCO
        /// </summary>
        /// <param name="o">POCO</param>
        /// <returns></returns>
        public int Insert(object o)
        {
            var expandoObject = o.ToExpando();
            if (!IsValid(expandoObject))
            {
                throw new InvalidOperationException("Can't insert: " + String.Join("; ", Errors.ToArray()));
            }
            using (ISqlDbAccess dbAccess = new SqlDbAccess(this.ConnectionString, DbFactory.Common.Enums.ConnectStringType.ConfigurationFile))
            {
                string sql = string.Empty;
                List<object> parameters = new List<object>();
                var settings = (IDictionary<string, object>)expandoObject;
                var sbKeys = new StringBuilder();
                var sbVals = new StringBuilder();
                var stub = "INSERT INTO {0} ({1}) \r\n VALUES ({2})";
                int counter = 0;
                foreach (var item in settings)
                {
                    sbKeys.AppendFormat("{0},", item.Key);
                    sbVals.AppendFormat("@{0},", counter.ToString());
                    parameters.Add(item.Value);
                    counter++;
                }
                if (counter > 0)
                {
                    var keys = sbKeys.ToString().TrimEnd(',');
                    var vals = sbVals.ToString().TrimEnd(',');
                    sql = string.Format(stub, this.TableName, keys, vals);
                }
                else throw new InvalidOperationException("Can't parse this object to the database - there are no properties set");
                object result = dbAccess.ExecuteNonQuery(sql, parameters.ToArray()).Result;

                return dbAccess.Scalar("SELECT SCOPE_IDENTITY()").Result;
            }
        }

        public int Insert(NameValueCollection collection)
        {
            return this.Insert((object)collection);
        }

        /// <summary>
        /// update record by passing on POCO
        /// </summary>
        /// <param name="o">POCO</param>
        /// <param name="key">primary key value</param>
        /// <returns></returns>
        public int Update(object o, object key)
        {
            var expandoObject = o.ToExpando();
            if (!IsValid(expandoObject))
            {
                throw new InvalidOperationException("Can't insert: " + String.Join("; ", Errors.ToArray()));
            }
            using (ISqlDbAccess dbAccess = new SqlDbAccess(this.ConnectionString, DbFactory.Common.Enums.ConnectStringType.ConfigurationFile))
            {
                string sql = string.Empty;
                List<object> parameters = new List<object>();
                var settings = (IDictionary<string, object>)expandoObject;
                var sbKeys = new StringBuilder();
                var stub = "UPDATE {0} SET {1} WHERE {2} = @{3}";
                var args = new List<object>();
                int counter = 0;
                foreach (var item in settings)
                {
                    var val = item.Value;
                    if (!item.Key.Equals(PrimaryKeyField, StringComparison.OrdinalIgnoreCase) && item.Value != null)
                    {
                        parameters.Add(val);
                        sbKeys.AppendFormat("{0} = @{1}, \r\n", item.Key, counter.ToString());
                        counter++;
                    }
                }
                if (counter > 0)
                {
                    //add the primary key
                    parameters.Add(key);
                    //strip the last commas
                    var keys = sbKeys.ToString().Substring(0, sbKeys.Length - 4);
                    sql = string.Format(stub, TableName, keys, PrimaryKeyField, counter);
                }
                else throw new InvalidOperationException("No parsable object was sent in - could not divine any name/value pairs");
                return (int)dbAccess.ExecuteNonQuery(sql, parameters.ToArray()).Result;
            }
        }

        public int Update(NameValueCollection collection, object key)
        {
            return this.Update((object)collection, key);
        }

        public dynamic Single(string where, params object[] args)
        {
            using (ISqlDbAccess dbAccess = new SqlDbAccess(this.ConnectionString, DbFactory.Common.Enums.ConnectStringType.ConfigurationFile))
            {
                var sql = string.Format("SELECT * FROM {0} WHERE {1}", this.TableName, where);
                return dbAccess.QueryRecords(sql, null).Result.FirstOrDefault();
            }
        }

        public dynamic Single(object key, string columns = "*")
        {
            using (ISqlDbAccess dbAccess = new SqlDbAccess(this.ConnectionString, DbFactory.Common.Enums.ConnectStringType.ConfigurationFile))
            {
                var sql = string.Format("SELECT {0} FROM {1} WHERE {2} = @0", columns, this.TableName, PrimaryKeyField);
                return dbAccess.QueryRecords(sql, null).Result.FirstOrDefault();
            }
        }

        public IEnumerable<dynamic> All(string where = "", string orderBy = "", int limit = 0, string columns = "*", params object[] args)
        {
            using (ISqlDbAccess dbAccess = new SqlDbAccess(this.ConnectionString, DbFactory.Common.Enums.ConnectStringType.ConfigurationFile))
            {
                string sql = limit > 0 ? "SELECT TOP " + limit + " {0} FROM {1} " : "SELECT {0} FROM {1} ";
                if (!string.IsNullOrEmpty(where))
                    sql += where.Trim().StartsWith("where", StringComparison.OrdinalIgnoreCase) ? where : "WHERE " + where;
                if (!String.IsNullOrEmpty(orderBy))
                    sql += orderBy.Trim().StartsWith("order by", StringComparison.OrdinalIgnoreCase) ? orderBy : " ORDER BY " + orderBy;
                return dbAccess.QueryRecords(string.Format(sql, columns, this.TableName), null).Result;
            }
        }

        public IEnumerable<dynamic> Paged(string where = "", string orderBy = "", string columns = "*", int pageSize = 20, int currentPage = 1, params object[] args)
        {
            using (ISqlDbAccess dbAccess = new SqlDbAccess(this.ConnectionString, DbFactory.Common.Enums.ConnectStringType.ConfigurationFile))
            {
                return dbAccess.PagedTable(this.TableName, this.PrimaryKeyField, where, orderBy, columns, pageSize, currentPage, args).Result;
            }
        }

        public int Count()
        {
            using (ISqlDbAccess dbAccess = new SqlDbAccess(this.ConnectionString, DbFactory.Common.Enums.ConnectStringType.ConfigurationFile))
            {
                return dbAccess.Scalar("SELECT COUNT(*) FROM " + this.TableName, null).Result;
            }
        }

        public int Count(string where, params object[] args)
        {
            using (ISqlDbAccess dbAccess = new SqlDbAccess(this.ConnectionString, DbFactory.Common.Enums.ConnectStringType.ConfigurationFile))
            {
                var sql = string.Format("SELECT COUNT(1) FROM {0} WHERE {1}", this.TableName, where);
                return dbAccess.Scalar(sql, args).Result;
            }
        }

        #region Trigger Methods
        public void Validate(dynamic item)
        {
            //throw new NotImplementedException();
        }

        public void Inserted(dynamic item)
        {
            throw new NotImplementedException();
        }

        public void Updated(dynamic item)
        {
            throw new NotImplementedException();
        }

        public void Deleted(dynamic item)
        {
            throw new NotImplementedException();
        }

        public bool BeforeDelete(dynamic item)
        {
            throw new NotImplementedException();
        }

        public bool BeforeSave(dynamic item)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Private Methods
        #endregion
    }
}
