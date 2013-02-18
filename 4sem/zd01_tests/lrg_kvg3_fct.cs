// lrg_kvg3_fct.cs    ��������� �.�., ������� 2009 �.
// ������������ ������ Large_kv ����������
// ���������� �������� ���������� n!, n<=65535.
//

using System;
using System.Collections.Generic;
using System.Text;

namespace lrg_kvg
{
    class lrg_fct {

      static ushort get_n() {
        bool ok; ushort n=0;
        do {
          ok=true;
          try {
            Console.WriteLine("  ������� n (0 -����� ����������):");
            n=Convert.ToUInt16(Console.ReadLine());
          }
          catch {
            Console.WriteLine("������! ������������ �������� n !!!");
            ok=false;
          }
        }
        while(!ok);
        return n;
      }

      static void Main(string[] args){
        Console.WriteLine("***  ������������ �������� ������� ����������.");
        Console.WriteLine("***      ");   
        Console.WriteLine("***  ���������� ���������� n! (n<=65535):");
        Console.WriteLine("***      ");     

        ushort n,i;
        bool ok;
        DateTime dt1,dt2;
        long t1,t2;

        n=get_n();
        while(n!=0) {
          Large_kv f=new Large_kv("1");
          dt1=DateTime.Now;
          t1=dt1.Ticks;
          Console.WriteLine("���� ��������� ��������� ����������:");
          for(i=2;i<=n;i++) {
            f=f*i;
          }
          dt2=DateTime.Now;
          t2=dt2.Ticks;
          Console.WriteLine("����� ���������� {0,15} ����� !",(t2-t1));
          string res=f.ToStr();
          
          Console.WriteLine("{0}! ={1}",n,res);
          Console.WriteLine(" � ���������� {0} ������",res.Length);
          n=get_n();
        }
        Console.WriteLine("��������� ����������! ������� ����� �������!");
        Console.ReadKey();
      }
    }
}
