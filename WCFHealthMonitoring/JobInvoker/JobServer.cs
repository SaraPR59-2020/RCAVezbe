using System;
using System.Collections.Generic;
using System.ServiceModel;
using Contracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//metdoe za otvaranje i yatvaranje konekcije servisa
namespace WCFServer
{
    class JobServer
    {
        private ServiceHost serviceHost;
        public void JobServerStart()
        {
            Start();
        }
        public void Start()
        {
            serviceHost = new ServiceHost(typeof(WCFHealthMonitoring));
            NetTcpBinding binding = new NetTcpBinding();
            serviceHost.AddDefaultEndpoints(typeof(IHealthMonitoring), binding, new Uri("net.tcp://localhost:6000/HealthMonitoring"));
            serviceHost.Open();
            Console.WriteLine("Server ready and waiting for requests.");
        }
        public void Stop()
        {
            serviceHost.Close();
            Console.WriteLine("Server stopped.");
        }


    }
}
