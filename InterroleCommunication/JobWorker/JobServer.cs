using System;
using System.Collections.Generic;
using System.ServiceModel;
using InterroleContracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.ServiceRuntime;
using System.Diagnostics;

//kreirat wcf server (jobServer) u okviru koje ce biti metode za otvaranje i zatvaranje konekcije servisa
namespace JobWorker
{
    class JobServer
    {
        //koristiti netTcpBinding a za dobijanje krajnje IP adrese trenutnog procesa iskoristiti klasu RoleEnvironment
        private ServiceHost serviceHost;
        private String externalEndpointName = "InputRequest";

        public JobServer()
        {
            RoleInstanceEndpoint inputEndpoint = RoleEnvironment.CurrentRoleInstance.InstanceEndpoints[externalEndpointName];
            string endpoint = String.Format("net.tcp://{0}/{1}", inputEndpoint.IPEndpoint, externalEndpointName);
            serviceHost = new ServiceHost(typeof(JobServiceProvider));
            NetTcpBinding binding = new NetTcpBinding();

            serviceHost.AddServiceEndpoint(typeof(IJob), binding, endpoint);

        }
        public void Open()
        {
            try
            {
                serviceHost.Open();
                Trace.TraceInformation(String.Format("Host for {0} endpoint type opened successfully at {1}", externalEndpointName, DateTime.Now));
            }
            catch (Exception e)
            {
                Trace.TraceInformation("Host open error for {0} endpoint type. Error message is: {1}", externalEndpointName, e.Message);

            }
        }
        public void Close()
        {
            try
            {
                serviceHost.Close();
                Trace.TraceInformation(String.Format("Host for {0} endpoint type closed successfully at {1}", externalEndpointName, DateTime.Now));
            }
            catch (Exception e)
            {
                Trace.TraceInformation("Host close error for {0} endpoint type. Error message is: {1}", externalEndpointName, e.Message);

            }
        }
    }
}
