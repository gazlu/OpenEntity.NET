using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Common
{
    /// <summary>
    /// Base Repository for table
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IRepository
    {
        #region Table Methods
        int Insert(object o);
        int Insert(NameValueCollection collection);
        int Update(object o, object key);
        int Update(NameValueCollection collection, object key);
        dynamic Single(string where, params object[] args);
        dynamic Single(object key, string columns = "*");
        IEnumerable<dynamic> All(
                string where = "", 
                string orderBy = "", 
                int limit = 0, string 
                columns = "*", 
                params object[] args
            );
        IEnumerable<dynamic> Paged(
                string where = "", 
                string orderBy = "", 
                string columns = "*", 
                int pageSize = 20, 
                int currentPage = 1, 
                params object[] args
            );
        int Count();
        int Count(string where, params object[] args);
        #endregion

        #region SP Methods
        IEnumerable<dynamic> ReadRecords(string storedProcedure, params object[] args);

        IEnumerable<dynamic> ReadRecords(string storedProcedure, CommandType commandType = CommandType.StoredProcedure, params object[] args);

        Dictionary<int, List<dynamic>> ReadResults(string storedProcedure, CommandType commandType = CommandType.StoredProcedure, params object[] args);

        int Insert(string storedProcedure, params object[] args);

        int Update(string storedProcedure, params object[] args);

        int Delete(string storedProcedure, params object[] args);

        DataSet ReadDataSet(string storedProcedure, CommandType commandType = CommandType.StoredProcedure, params object[] args);

        DataTable ReadDataTable(string storedProcedure, CommandType commandType = CommandType.StoredProcedure, params object[] args);
        #endregion

        #region Trigger Methods
        void Validate(dynamic item);
        void Inserted(dynamic item);
        void Updated(dynamic item);
        void Deleted(dynamic item);
        bool BeforeDelete(dynamic item);
        bool BeforeSave(dynamic item);
        #endregion
    }
}
