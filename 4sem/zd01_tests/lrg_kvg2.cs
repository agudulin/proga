// lrg_kvg2.cs        Кузьменко В.Г., март 2009 г.
// Тестирование операций длинной арифметики 2.
//

using System;
using System.Collections.Generic;
using System.Text;

namespace lrg_kvg
{
    class lrg_kvg2 {
      static void Main(string[] args){
        Console.WriteLine("***  Тестирование операций длинной арифметики.");
        Console.WriteLine("***      ");   
        Console.WriteLine("***  Выполнение программы:");
        Console.WriteLine("***      Large_kv a=new Large_kv(\"1234567890123\");");
        Console.WriteLine("***      Large_kv b=new Large_kv(a);");   
        Console.WriteLine("***      Large_kv c=new Large_kv(\"0\");");     
        Console.WriteLine("***      for(int i=10000;i>1;i--) {");     
        Console.WriteLine("***        c=c+a*b; b=b-1;");      
        Console.WriteLine("***      }");     
        Console.WriteLine("***      ");     

        Large_kv a=new Large_kv("1234567890123");
        Large_kv b=new Large_kv(a);
        Large_kv c=new Large_kv("0");
        DateTime dt1=DateTime.Now,dt2;
        long t1=dt1.Ticks,t2;
        for(int i=10000;i>1;i--) {
          c=c+a*b; b=b-1;
        }
        dt2=DateTime.Now;
        t2=dt2.Ticks;
        Console.WriteLine("{0,15} тиков !",(t2-t1));
        Console.WriteLine("c={0}",c.ToStr());
        Console.WriteLine("Закончили вычисления! Нажмите любую клавишу!");
        Console.ReadKey();
      }
    }
}
