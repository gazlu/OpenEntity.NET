namespace Service
{
    public partial interface IDemoRepository : Common.IRepository
    {
    }

    public partial class DemoRepository : Common.Repository, IDemoRepository
    {
        public DemoRepository()
            : base("Demo", "ServiceConnection")
        {
        }
    }
}
