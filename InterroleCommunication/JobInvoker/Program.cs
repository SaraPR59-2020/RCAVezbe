using System;
using System.Collections.Generic;
using InterroleContracts;
using System.ServiceModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// ovaj proces treba da omoguci unos gornje granice intervala i poziv WCF servisa sa vrednostima intervala 
                // od 0 do n - gde je n unesena vrednost od strane korisnika
namespace JobInvoker
{
    class Program
    {
        private static IJob proxy;
        public static void Connect()
        {
            var binding = new NetTcpBinding();
            ChannelFactory<IJob> factory = new
                ChannelFactory<IJob>(binding, new EndpointAddress("net.tcp://localhost:10100/InputRequest"));
            proxy = factory.CreateChannel();
        }
        
        static void Main(string[] args)
        {
            while(true)
            {
                try
                {
                    Connect();
                    int to = 0;
                    Console.WriteLine("Enter number: ");
                    bool success = int.TryParse(Console.ReadLine(), out to);

                    if (!success)
                        continue;

                    int sum = proxy.DoCalculs(to);
                    Console.WriteLine($"Sum from 1 do {to} is: {sum}\n");
                }
                catch (Exception e)
                {
                    Console.WriteLine("Error starting WCF service!" + e.Message);
                }
            }
        }
    }
}
