using System;
using System.Collections.Generic;
using InterroleContracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobWorker
{
    class JobServiceProvider : IJob
    {
        public int DoCalculs(int to)
        {
            if (to < 0)
                return 0;
            return (to * (to + 1) / 2);
        }
    }
}
