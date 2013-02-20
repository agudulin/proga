using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace buildNumbersSet
{
    class Program
    {
        /*
         * Save Set to file
         * First 4 bytes - count of items in file
         * Every new 4 bytes - an integer item
         */
        public void SaveToFile(string filename, int count, int[] setOfItems)
        {
            
        }

        static void Main(string[] args)
        {
            Console.Write("> Введите количество файлов: ");
            int n = 0;
            Int32.TryParse(Console.ReadLine(), out n);

            int[] setOfItems = new int[n];
            Random rnd = new Random();

            Dictionary<int, bool> tmpHash = new Dictionary<int, bool>();
            for (int i = 0; i < n * 2; ++i) {
                tmpHash[i] = false;
            }

            // Get a set of numbers
            int j = 0;
            while(j < n)
            {
                int randomNumber = rnd.Next(0, n * 2);
                if (!tmpHash[randomNumber]) {
                    Console.WriteLine(randomNumber.ToString());
                    setOfItems[j++] = randomNumber;
                    tmpHash[randomNumber] = true;
                }
            }
            Console.WriteLine("... набор данных готов!");

            // Saving to the file
            Console.Write("> Введите имя файла: ");
            String filename = "w:\\Zd02\\";
            filename += Console.ReadLine();
            int count = n;

            byte[] buffer = new byte[4];
            try
            {

                using (System.IO.FileStream fs = new System.IO.FileStream(filename,
                                                                          System.IO.FileMode.Create,
                                                                          System.IO.FileAccess.Write))
                {
                    buffer = BitConverter.GetBytes(count);
                    fs.Write(buffer, 0, buffer.Length);
                    for (int i = 0; i < count; ++i)
                    {
                        buffer = BitConverter.GetBytes(setOfItems[i]);
                        fs.Write(buffer, 0, buffer.Length);
                    }
                    fs.Close();
                }
                Console.WriteLine(String.Format("... файл сохранен как {0}!", filename));
            }
            catch (System.Exception ex)
            {
                Console.WriteLine("... Error! " + ex.ToString());
            }

            Console.ReadLine();

        }

    }

}
