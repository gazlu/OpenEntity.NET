using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Repositories
{
    //Tasks
    public partial interface ITasksRepository : Common.IRepository
    {
    }

    public partial class TasksRepository : Common.Repository, ITasksRepository
    {
        public TasksRepository()
            : base("Tasks")
        {

        }
    }
}
