using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbFactory
{
    public interface ISqlDbAccess : Common.IDbAccess<SqlConnection>
    {
    }

    public class SqlDbAccess : Common.DbAccess<SqlConnection, SqlCommand>, ISqlDbAccess
    {
        public SqlDbAccess(string connectionStringConfig, Common.Enums.ConnectStringType connectionStringType = Common.Enums.ConnectStringType.ConfigurationFile)
            : base(connectionStringConfig, connectionStringType)
        {
        }

        public SqlDbAccess(SqlConnection connection)
            : base(connection)
        {
        }
    }
}
