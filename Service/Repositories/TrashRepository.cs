using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Repositories
{
    public partial interface ITrashRepository : Common.IRepository
    {
    }

    public partial class TrashRepository : Common.Repository, ITrashRepository
    {
        public TrashRepository()
            : base("CommonRecycleBin")
        {
        }
    }
}
