using System.Threading;
using System;

namespace threaddemo
{
    class Program
    {
        static void Main(string[] args)
        {
            new Program().Start();
        }
        
        private bool canStop = false;
        public bool CanStop { get => canStop; }

        private void Stoper()
        {
            Thread.Sleep(5 * 1000);
            canStop = true;
        }

        void Start()
        {
            Console.Write("Enter number of threads: ");
            int threadsCount = int.Parse(Console.ReadLine());
            for (int i = 0; i < threadsCount; i++)
            {
                string a = i.ToString();
                new Thread(() => Calculator(a)).Start();
            }

            new Thread(Stoper).Start();
        }

        void Calculator(string id)
        {
            long count = 0;
            long sum = 0;
            do
            {
                sum ++;
                count += 6;
            } while (!canStop);
            Console.WriteLine($"id: {id}, sum: {sum}, count: {count}");
        }
    }
}
