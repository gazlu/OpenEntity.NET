using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Extensions;
using System.Dynamic;

namespace DbFactory.Common
{
    public class DbAccess<TConnection, TCommand> : IDbAccess<TConnection>
        where TConnection : DbConnection
        where TCommand : DbCommand
    {
        protected ConnectionStringSettings connectionStringSettings = new ConnectionStringSettings();

        protected TConnection connection;

        #region Ctors
        public DbAccess(TConnection connection)
        {
            this.connection = connection;
        }

        public DbAccess(ConnectionStringSettings connectionSettings)
        {
            this.connectionStringSettings = connectionSettings;
        }

        public DbAccess(string connectString, Enums.ConnectStringType type = Enums.ConnectStringType.String)
        {
            switch (type)
            {
                case Enums.ConnectStringType.String:
                    {
                        this.connectionStringSettings.ConnectionString = connectString;
                        break;
                    }
                case Enums.ConnectStringType.ConfigurationFile:
                    {
                        this.connectionStringSettings = ConfigurationManager.ConnectionStrings[connectString];
                        break;
                    }
            }
            connection = Activator.CreateInstance<TConnection>();
            connection.ConnectionString = connectString;
        }
        #endregion

        #region Async Methods
        public virtual async Task<IEnumerable<dynamic>> ReadRecordsAsync(string storedProcedure, params object[] args)
        {
            IEnumerable<dynamic> records = null;
            records = await this.ReadRecordsAsync(storedProcedure, CommandType.StoredProcedure, args);
            return records;
        }

        public virtual async Task<IEnumerable<dynamic>> ReadRecordsAsync(string storedProcedure, System.Data.CommandType commandType = CommandType.StoredProcedure, params object[] args)
        {
            IEnumerable<dynamic> records = null;
            DbDataReader dbDataReader;
            try
            {
                using (connection)
                {
                    //Create command object for retriving records
                    DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                    TCommand command = (TCommand)factory.CreateCommand();
                    command.Connection = connection;
                    command.CommandType = commandType;
                    command.CommandText = storedProcedure;

                    command.AddParams(args);
                    command.Connection = connection;

                    if (connection.State == ConnectionState.Closed)
                        await connection.OpenAsync();

                    dbDataReader = await command.ExecuteReaderAsync();
                    records = dbDataReader.ToExpandoList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return records;
        }

        public virtual async Task<Dictionary<int, List<dynamic>>> ReadResultsAsync(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            Dictionary<int, List<dynamic>> resultSets = new Dictionary<int, List<dynamic>>();
            DataSet dataSet = new DataSet();
            dataSet = await this.ReadDataSetAsync(storedProcedure, CommandType, args);
            resultSets = dataSet.ToExpandoList();
            return resultSets;
        }

        public virtual async Task<int> InsertAsync(string storedProcedure, params object[] args)
        {
            int result = 0;
            try
            {
                using (connection)
                {
                    //Create command object for retriving records
                    DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                    TCommand command = (TCommand)factory.CreateCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = storedProcedure;

                    command.AddParams(args);
                    command.Connection = connection;

                    if (connection.State == ConnectionState.Closed)
                        await connection.OpenAsync();

                    result = await command.ExecuteNonQueryAsync();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public virtual async Task<int> UpdateAsync(string storedProcedure, params object[] args)
        {
            int result = 0;
            result = await this.InsertAsync(storedProcedure, args);
            return result;
        }

        public virtual async Task<int> DeleteAsync(string storedProcedure, params object[] args)
        {
            int result = 0;
            result = await this.InsertAsync(storedProcedure, args);
            return result;
        }

        public virtual async Task<int> RecordCountAsync(string storedProcedure, System.Data.CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            int recordCount = 0;
            try
            {
                using (connection)
                {
                    //Create command object for retriving records
                    DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                    TCommand command = (TCommand)factory.CreateCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType;
                    command.CommandText = storedProcedure;

                    command.AddParams(args);
                    command.Connection = connection;

                    if (connection.State == ConnectionState.Closed)
                        await connection.OpenAsync();

                    object resultObject = await command.ExecuteScalarAsync();
                    recordCount = int.Parse(resultObject.ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return recordCount;
        }

        public virtual async Task<System.Data.DataSet> ReadDataSetAsync(string storedProcedure, System.Data.CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            DataSet dataSet = new DataSet();
            DbDataReader dbDataReader;
            try
            {
                using (connection)
                {
                    //Create command object for retriving records
                    DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                    TCommand command = (TCommand)factory.CreateCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType;
                    command.CommandText = storedProcedure;

                    command.AddParams(args);
                    command.Connection = connection;

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    dbDataReader = await command.ExecuteReaderAsync();
                    dataSet = dbDataReader.ToDataSet();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataSet;
        }

        public virtual async Task<System.Data.DataTable> ReadDataTableAsync(string storedProcedure, System.Data.CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            DataSet dataSet = new DataSet();
            dataSet = await this.ReadDataSetAsync(storedProcedure, CommandType, args);
            return (dataSet != null && dataSet.Tables.Count > 0) ? dataSet.Tables[0] : new DataTable();
        }

        public virtual async Task<IEnumerable<dynamic>> QueryRecordsAsync(string SQLorSP, params object[] args)
        {
            using (connection)
            {
                if (connection.State == ConnectionState.Closed) await connection.OpenAsync();
                DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                TCommand command = (TCommand)factory.CreateCommand();
                command.AddParams(args);
                command.CommandText = SQLorSP;
                command.Connection = connection;
                var result = await command.ExecuteReaderAsync();
                return result.ToExpandoList();
            }
        }

        public virtual async Task<IEnumerable<dynamic>> PagedTableAsync(string table, string primaryKey, string where = "", string orderBy = "", string columns = "*", int pageSize = 20, int currentPage = 1, params object[] args)
        {
            using (connection)
            {
                dynamic result = new ExpandoObject();
                var countSQL = string.Format("SELECT COUNT(1) FROM {0}", table);
                if (String.IsNullOrEmpty(orderBy))
                    orderBy = primaryKey;

                if (!string.IsNullOrEmpty(where))
                {
                    if (!where.Trim().StartsWith("where", StringComparison.OrdinalIgnoreCase))
                    {
                        where = "WHERE " + where;
                    }
                }

                var sql = string.Format("SELECT {0} FROM (SELECT ROW_NUMBER() OVER (ORDER BY {2}) AS Row, {0} FROM {3} {4}) AS Paged ", columns, pageSize, orderBy, table, where);
                var pageStart = (currentPage - 1) * pageSize;
                sql += string.Format(" WHERE Row > {0} AND Row <={1}", pageStart, (pageStart + pageSize));
                countSQL += where;
                result.TotalRecords = await this.ScalarAsync<int>(countSQL, args);
                result.TotalPages = result.TotalRecords / pageSize;
                if (result.TotalRecords % pageSize > 0)
                    result.TotalPages += 1;
                result = await QueryRecordsAsync(string.Format(sql, columns, table), args);
                return result;
            }
        }

        public virtual async Task<T> ScalarAsync<T>(string sql, params object[] args)
        {
            using (connection)
            {
                T result;
                if (connection.State == ConnectionState.Closed) connection.Open();
                DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                using (TCommand command = (TCommand)factory.CreateCommand())
                {
                    command.AddParams(args);
                    command.CommandText = sql;
                    command.Connection = connection;
                    object resultObject = await command.ExecuteScalarAsync();
                    result = (T)Convert.ChangeType(resultObject, typeof(T));
                    return result;
                }
            }
        }

        public virtual async Task<object> ExecuteNonQueryAsync(string sql, params object[] args)
        {
            using (connection)
            {
                int result = 0;
                if (connection.State == ConnectionState.Closed) connection.Open();
                DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                using (TCommand command = (TCommand)factory.CreateCommand())
                {
                    command.AddParams(args);
                    command.CommandText = sql;
                    command.Connection = connection;
                    result = await command.ExecuteNonQueryAsync();
                    return result;
                }
            }
        }
        #endregion
        
        #region Sync Methods
        public IEnumerable<dynamic> ReadRecords(string storedProcedure, params object[] args)
        {
            IEnumerable<dynamic> records = null;
            records = this.ReadRecords(storedProcedure, CommandType.StoredProcedure, args);
            return records;
        }

        public IEnumerable<dynamic> ReadRecords(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            IEnumerable<dynamic> records = null;
            DbDataReader dbDataReader;
            try
            {
                using (connection)
                {
                    //Create command object for retriving records
                    DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                    TCommand command = (TCommand)factory.CreateCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType;
                    command.CommandText = storedProcedure;

                    command.AddParams(args);
                    command.Connection = connection;

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    dbDataReader = command.ExecuteReader();
                    records = dbDataReader.ToExpandoList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return records;
        }

        public Dictionary<int, List<dynamic>> ReadResults(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            Dictionary<int, List<dynamic>> resultSets = new Dictionary<int, List<dynamic>>();
            DataSet dataSet = new DataSet();
            dataSet = this.ReadDataSet(storedProcedure, CommandType, args);
            resultSets = dataSet.ToExpandoList();
            return resultSets;
        }

        public int Insert(string storedProcedure, params object[] args)
        {
            int result = 0;
            try
            {
                using (connection)
                {
                    //Create command object for retriving records
                    DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                    TCommand command = (TCommand)factory.CreateCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = storedProcedure;

                    command.AddParams(args);
                    command.Connection = connection;

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    result = command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int Update(string storedProcedure, params object[] args)
        {
            int result = 0;
            result = this.Insert(storedProcedure, args);
            return result;
        }

        public int Delete(string storedProcedure, params object[] args)
        {
            int result = 0;
            result = this.Insert(storedProcedure, args);
            return result;
        }

        public int RecordCount(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            int recordCount = 0;
            try
            {
                using (connection)
                {
                    //Create command object for retriving records
                    DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                    TCommand command = (TCommand)factory.CreateCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType;
                    command.CommandText = storedProcedure;

                    command.AddParams(args);
                    command.Connection = connection;

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    object resultObject = command.ExecuteScalar();
                    recordCount = int.Parse(resultObject.ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return recordCount;
        }

        public DataSet ReadDataSet(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            DataSet dataSet = new DataSet();
            DbDataReader dbDataReader;
            try
            {
                using (connection)
                {
                    //Create command object for retriving records
                    DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                    TCommand command = (TCommand)factory.CreateCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType;
                    command.CommandText = storedProcedure;

                    command.AddParams(args);
                    command.Connection = connection;

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    dbDataReader = command.ExecuteReader();
                    dataSet = dbDataReader.ToDataSet();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataSet;
        }

        public DataTable ReadDataTable(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args)
        {
            DataSet dataSet = new DataSet();
            dataSet = this.ReadDataSet(storedProcedure, CommandType, args);
            return (dataSet != null && dataSet.Tables.Count > 0) ? dataSet.Tables[0] : new DataTable();
        }

        public IEnumerable<dynamic> QueryRecords(string SQLorSP, params object[] args)
        {
            using (connection)
            {
                if (connection.State == ConnectionState.Closed) connection.Open();
                DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                TCommand command = (TCommand)factory.CreateCommand();
                command.AddParams(args);
                command.CommandText = SQLorSP;
                command.Connection = connection;
                var result = command.ExecuteReader();
                return result.ToExpandoList();
            }
        }

        public IEnumerable<dynamic> PagedTable(string table, string primaryKey, string where = "", string orderBy = "", string columns = "*", int pageSize = 20, int currentPage = 1, params object[] args)
        {
            using (connection)
            {
                dynamic result = new ExpandoObject();
                var countSQL = string.Format("SELECT COUNT(1) FROM {0}", table);
                if (String.IsNullOrEmpty(orderBy))
                    orderBy = primaryKey;

                if (!string.IsNullOrEmpty(where))
                {
                    if (!where.Trim().StartsWith("where", StringComparison.OrdinalIgnoreCase))
                    {
                        where = "WHERE " + where;
                    }
                }

                var sql = string.Format("SELECT {0} FROM (SELECT ROW_NUMBER() OVER (ORDER BY {2}) AS Row, {0} FROM {3} {4}) AS Paged ", columns, pageSize, orderBy, table, where);
                var pageStart = (currentPage - 1) * pageSize;
                sql += string.Format(" WHERE Row > {0} AND Row <={1}", pageStart, (pageStart + pageSize));
                countSQL += where;
                result.TotalRecords = this.Scalar<int>(countSQL, args);
                result.TotalPages = result.TotalRecords / pageSize;
                if (result.TotalRecords % pageSize > 0)
                    result.TotalPages += 1;
                result = QueryRecords(string.Format(sql, columns, table), args);
                return result;
            }
        }

        public T Scalar<T>(string sql, params object[] args)
        {
            using (connection)
            {
                T result;
                if (connection.State == ConnectionState.Closed) connection.Open();
                DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                using (TCommand command = (TCommand)factory.CreateCommand())
                {
                    command.AddParams(args);
                    command.CommandText = sql;
                    command.Connection = connection;
                    object resultObject = command.ExecuteScalar();
                    result = (T)Convert.ChangeType(resultObject, typeof(T));
                    return result;
                }
            }
        }

        public object ExecuteNonQuery(string sql, params object[] args)
        {
            using (connection)
            {
                int result = 0;
                if (connection.State == ConnectionState.Closed) connection.Open();
                DbProviderFactory factory = DbProviderFactories.GetFactory(connection);
                using (TCommand command = (TCommand)factory.CreateCommand())
                {
                    command.AddParams(args);
                    command.CommandText = sql;
                    command.Connection = connection;
                    result = command.ExecuteNonQuery();
                    return result;
                }
            }
        }
        #endregion

        public void Dispose()
        {
            GC.SuppressFinalize(this);
            connection.Close();
            connection.Dispose();
        }
    }
}
