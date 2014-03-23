using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Extensions
{
    public static class DataExtensions
    {
        /// <summary>
        /// Extension method for adding in a bunch of parameters
        /// </summary>
        public static void AddParams(this DbCommand cmd, params object[] args)
        {
            if (args != null)
                foreach (var item in args)
                {
                    AddParam(cmd, item);
                }
        }
        /// <summary>
        /// Extension for adding single parameter
        /// </summary>
        public static void AddParam(this DbCommand cmd, object item)
        {
            var p = cmd.CreateParameter();
            p.ParameterName = string.Format("@{0}", cmd.Parameters.Count);
            if (item == null)
            {
                p.Value = DBNull.Value;
            }
            else
            {
                if (item.GetType() == typeof(Guid))
                {
                    p.Value = item.ToString();
                    p.DbType = DbType.String;
                    p.Size = 4000;
                }
                else if (item.GetType() == typeof(ExpandoObject))
                {
                    var d = (IDictionary<string, object>)item;
                    p.Value = d.Values.FirstOrDefault();
                }
                else
                {
                    p.Value = item;
                }
                if (item.GetType() == typeof(string))
                    p.Size = ((string)item).Length > 4000 ? -1 : 4000;
            }
            cmd.Parameters.Add(p);
        }
        /// <summary>
        /// Turns an IDataReader to a Dynamic list of things
        /// </summary>
        public static List<dynamic> ToExpandoList(this IDataReader rdr, bool closeReader = true)
        {
            var result = new List<dynamic>();
            while (rdr.Read())
            {
                result.Add(rdr.RecordToExpando());
            }
            if (closeReader) rdr.Close();
            return result;
        }
        /// <summary>
        /// Turns an IDataReader to a Dynamic list of things
        /// </summary>
        public static List<dynamic> ToExpandoList(this DbDataReader rdr, bool closeReader = true)
        {
            var result = new List<dynamic>();
            while (rdr.Read())
            {
                result.Add(rdr.RecordToExpando());
            }
            if (closeReader) rdr.Close();
            return result;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="rdr"></param>
        /// <returns></returns>
        public static dynamic RecordToExpando(this IDataReader rdr)
        {
            dynamic e = new ExpandoObject();
            var d = e as IDictionary<string, object>;
            for (int i = 0; i < rdr.FieldCount; i++)
                d.Add(rdr.GetName(i), DBNull.Value.Equals(rdr[i]) ? null : rdr[i]);
            return e;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="rdr"></param>
        /// <returns></returns>
        public static dynamic RecordToExpando(this DbDataReader rdr)
        {
            dynamic e = new ExpandoObject();
            var d = e as IDictionary<string, object>;
            for (int i = 0; i < rdr.FieldCount; i++)
                d.Add(rdr.GetName(i), DBNull.Value.Equals(rdr[i]) ? null : rdr[i]);
            return e;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="reader"></param>
        /// <param name="removeBlankTables"></param>
        /// <returns></returns>
        public static DataSet ToDataSet(this IDataReader reader, bool removeBlankTables = true)
        {
            DataSet dataSet = new DataSet();
            List<string> tables = new List<string>();

            for (int iTable = 0; iTable < 100; iTable++)
            {
                tables.Add("T" + (iTable + 1));
            }

            if (removeBlankTables)
            {
            }
            dataSet.Load(reader, LoadOption.OverwriteChanges, tables.ToArray());
            return dataSet;
        }
    }

    public static class DataSetExtensions
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dataSet"></param>
        /// <returns></returns>
        public static Dictionary<int, List<dynamic>> ToExpandoList(this DataSet dataSet)
        {
            var result = new Dictionary<int, List<dynamic>>();// new List<dynamic>();
            int tableIndexer = 0;
            foreach (DataTable table in dataSet.Tables)
            {
                result.Add(tableIndexer, table.ToExpando());
                tableIndexer++;
            }
            return result;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dataTable"></param>
        /// <returns></returns>
        public static List<dynamic> ToExpando(this DataTable dataTable)
        {
            var result = new List<dynamic>();
            foreach (DataRow row in dataTable.Rows)
            {
                result.Add(row.ToExpando(dataTable.Columns));
            }
            return result;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dataRow"></param>
        /// <returns></returns>
        public static dynamic ToExpando(this DataRow dataRow, DataColumnCollection dataColumns)
        {
            dynamic e = new ExpandoObject();
            var d = e as IDictionary<string, object>;

            foreach (DataColumn column in dataColumns)
            {
                d.Add(column.ColumnName, DBNull.Value.Equals(dataRow[column]) ? null : dataRow[column]);
            }
            return e;
        }
    }
}
