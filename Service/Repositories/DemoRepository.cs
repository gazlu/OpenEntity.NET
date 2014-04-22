using DbFactory.Massive;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public partial interface IDemoRepository : Common.IRepository
    {
        IEnumerable<dynamic> GetDemoRecord();
    }

    public partial class DemoRepository : Common.Repository, IDemoRepository
    {
        public IEnumerable<dynamic> GetDemoRecord()
        {
            using (DbFactory.ISqlDbAccess dbAccess = new DbFactory.SqlDbAccess("ServiceConnection"))
            {
                return dbAccess.ReadRecords("XyzStoredProcedure", 1, "2", new DateTime());
            }
        }
    }
}
