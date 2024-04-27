using System;
using System.Collections.Generic;
using InterroleContracts;
using System.ServiceModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace JobWorker
{
    class JobServiceProvider : IJob
    {
        NetTcpBinding binding = new NetTcpBinding();
        private string internalEndpointName = "Internalrequest";
        public int DoCalculs(int to)
        {
            Trace.WriteLine(String.Format("DoCalculus method called - interval [1,{0}]", to.ToString()), "Information");

            List<EndpointAddress> internalEndpoints =
            RoleEnvironment.Roles[RoleEnvironment.CurrentRoleInstance.Role.Name].Instances.Where(instance => instance.Id != RoleEnvironment.CurrentRoleInstance.Id).Select(process => new
                EndpointAddress(String.Format("net.tcp://{0}/{1}",
                    process.InstanceEndpoints[internalEndpointName].IPEndpoint.ToString(), internalEndpointName))).ToList();
            int totalSum = 0;
            #region algorithm for dividing interval to equidistant subintervals
            int brotherInstances = internalEndpoints.Count;
            int result = to / brotherInstances;
            int remainder = to % brotherInstances;
            int lastParam = 0, currentBeginning = 0;
            Task<int>[] tasks = new Task<int>[brotherInstances];
            for (int i = 0; i < brotherInstances; i++)
            {
                currentBeginning = lastParam;
                lastParam += result;
                if (remainder > 0)
                {
                    lastParam++;
                    remainder--;
                }
                Trace.WriteLine(String.Format("Calling node at: {0}",
                internalEndpoints[i].ToString()), "Information");
                int index = i;
                int openInterval = currentBeginning + 1;
                int closeInterval = lastParam;
                Task<int> calculatePartialSum = new Task<int>(() =>
                {
                    IJobPartial proxy = new ChannelFactory<IJobPartial>(binding,
                    internalEndpoints[index]).CreateChannel();
                    return proxy.DoSum(openInterval, closeInterval);
                });
                calculatePartialSum.Start();
                tasks[index] = calculatePartialSum;
            }
            #endregion
            Task.WaitAll(tasks);
            foreach (Task<int> task in tasks)
            {
                totalSum += task.Result;
            }
            return totalSum;
        }
    }
}
