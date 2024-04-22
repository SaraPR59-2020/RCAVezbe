using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WCFServer
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                new JobServer();
                Console.WriteLine("WCF Serivce is running...");
            }
            catch (Exception e)
            {
                Console.WriteLine("Error starting WCF servicer!" + e.Message);
            }

            Console.WriteLine("Enter anyting to leave...");
            Console.ReadLine();
        }
    }
}
