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
        Task<IEnumerable<dynamic>> ReadRecords(string storedProcedure, params object[] args);

        Task<IEnumerable<dynamic>> ReadRecords(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<Dictionary<int, List<dynamic>>> ReadResults(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<int> Insert(string storedProcedure, params object[] args);

        Task<int> Update(string storedProcedure, params object[] args);

        Task<int> Delete(string storedProcedure, params object[] args);

        Task<int> RecordCount(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<DataSet> ReadDataSet(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<DataTable> ReadDataTable(string storedProcedure, CommandType CommandType = CommandType.StoredProcedure, params object[] args);

        Task<IEnumerable<dynamic>> QueryRecords(string SQLorSP, params object[] args);

        Task<IEnumerable<dynamic>> PagedTable(string table, string primaryKey, string where = "", string orderBy = "", string columns = "*", int pageSize = 20, int currentPage = 1, params object[] args);

        Task<int> Scalar(string sql, params object[] args);

        Task<object> ExecuteNonQuery(string sql, params object[] args);
    }
}