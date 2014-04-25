using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbFactory.Common
{
    public interface IDbAccess<TConnection> : IDisposable
    {
        #region Async Methods
        Task<IEnumerable<dynamic>> ReadRecordsAsync(string storedProcedure, params object[] args);

        Task<IEnumerable<dynamic>> ReadRecordsAsync(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<Dictionary<int, List<dynamic>>> ReadResultsAsync(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<int> InsertAsync(string storedProcedure, params object[] args);

        Task<int> UpdateAsync(string storedProcedure, params object[] args);

        Task<int> DeleteAsync(string storedProcedure, params object[] args);

        Task<int> RecordCountAsync(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<DataSet> ReadDataSetAsync(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<DataTable> ReadDataTableAsync(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<IEnumerable<dynamic>> QueryRecordsAsync(string SQLorSP, params object[] args);

        Task<IEnumerable<dynamic>> PagedTableAsync(string table, string primaryKey, string where = "", string orderBy = "", string columns = "*", int pageSize = 20, int currentPage = 1, params object[] args);

        Task<T> ScalarAsync<T>(string sql, params object[] args);

        Task<object> ExecuteNonQueryAsync(string sql, params object[] args);
        #endregion

        #region Sync Methods
        IEnumerable<dynamic> ReadRecords(string storedProcedure, params object[] args);

        IEnumerable<dynamic> ReadRecords(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Dictionary<int, List<dynamic>> ReadResults(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        int Insert(string storedProcedure, params object[] args);

        int Update(string storedProcedure, params object[] args);

        int Delete(string storedProcedure, params object[] args);

        int RecordCount(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        DataSet ReadDataSet(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        DataTable ReadDataTable(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        IEnumerable<dynamic> QueryRecords(string SQLorSP, params object[] args);

        IEnumerable<dynamic> PagedTable(string table, string primaryKey, string where = "", string orderBy = "", string columns = "*", int pageSize = 20, int currentPage = 1, params object[] args);

        T Scalar<T>(string sql, params object[] args);

        object ExecuteNonQuery(string sql, params object[] args);
        #endregion
    }
}