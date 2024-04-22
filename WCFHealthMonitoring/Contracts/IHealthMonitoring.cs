using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contracts
{
    [ServiceContract]
    public interface IHealthMonitoring
    {
        [OperationContract]
        void IAmAlive();
    }
}
