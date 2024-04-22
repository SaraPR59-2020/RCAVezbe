using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterroleContracts
{
    [ServiceContract]
    public interface IJob
    {
        [OperationContract]
        int DoCalculs(int to);
    }
}
