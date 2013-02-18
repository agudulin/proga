// lrg_kvg1.cs       Кузьменко В.Г., март 2009 г.
// Тестирование операций длинной арифметики 1.
//

using System;
using System.Collections.Generic;
using System.Text;

namespace lrg_kvg
{
    class lrg_kvg1 {
      static void Main(string[] args){
        Console.WriteLine("***  Тестирование операций длинной арифметики!");

        Console.WriteLine("*** Тестируем операции сложения и вычитания (a=0 b=0 -конец тестирования!):");
        string s1="",s2="";
        do {
          Console.WriteLine("Введите a:");
          s1=Console.ReadLine();
          Console.WriteLine("Введите b:");
          s2=Console.ReadLine();
          if((s1=="0")&&(s2=="0"))break;
          Large_kv a=new Large_kv(s1),b=new Large_kv(s2),c,d;
          c=a+b;
          d=a-b;
          Console.WriteLine("a+b={0}",c.ToStr());
          Console.WriteLine("a-b={0}",d.ToStr());
        }
        while(true);
        Console.WriteLine("*** Тестируем операцию умножения (a=0 b=0 -конец тестирования!):");
        do {
          Console.WriteLine("Введите a:");
          s1=Console.ReadLine();
          Console.WriteLine("Введите b:");
          s2=Console.ReadLine();
          if((s1=="0")&&(s2=="0")) break;
          Large_kv a=new Large_kv(s1),b=new Large_kv(s2),c,d;
          c=a*b;
          d=a*(b+1);
          Console.WriteLine("a*b    ={0}",c.ToStr());
          Console.WriteLine("a*(b+1)={0}",d.ToStr());
        }
        while(true);
        Console.WriteLine("Закончили вычисления! Нажмите любую клавишу!");
        Console.ReadKey();
      }
    }
}
