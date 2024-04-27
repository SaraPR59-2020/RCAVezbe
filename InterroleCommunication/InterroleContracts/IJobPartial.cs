using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterroleContracts
{
    [ServiceContract]
    public interface IJobPartial
    {
        [OperationContract]
        int DoSum(int from, int to);
    }
}
