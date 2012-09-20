using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace zd04_m
{
	class MainClass
	{
		public static void Main(string[] args)
		{
			TestUniqueIntegersSet test = new TestUniqueIntegersSet();
			test.Start();
		}
	}
	
	/*
     * Test for UniqueIntegersSet class
     */
	class TestUniqueIntegersSet
	{
		static Random r = new Random();
		
		public TestUniqueIntegersSet()
		{
		}
		
		public void Start()
		{
			Console.WriteLine("zd04m_ga.cs\t\t Гудулин А.О. 19.09.2012");
			Console.WriteLine("Тестирование процедур пересечения (объединения) целочисленных множеств.");
			Console.WriteLine();
			
			while (true)
			{
				PrintMenu();
				Console.WriteLine("\n\nEnter - назад в меню");
				Console.ReadLine();
				Console.Clear();
			}
		}
		
		public static void PrintMenu()
		{
			Console.WriteLine("1. Пересечение множеств");
			Console.WriteLine("2. Объединение множеств");
			Console.WriteLine("3. Выход");
			
			Console.Write("\nВведите [1-3]: ");
			int i;
			if (!int.TryParse(Console.ReadLine(), out i))
			{
				ExitTestSystem(0);
			}
			
			Console.Clear();
			
			Console.WriteLine("Получаем множество x из файла (введите имя файла): ");
			string fileName = Console.ReadLine();
			UniqueIntegersSet uiset1 = new UniqueIntegersSet();
			uiset1.ReadFromFile(fileName);
			
			Console.WriteLine("Получаем множество y из файла (введите имя файла): ");
			fileName = Console.ReadLine();
			UniqueIntegersSet uiset2 = new UniqueIntegersSet();
			uiset2.ReadFromFile(fileName);
			
			switch (i)
			{
			case 1: 
				Console.WriteLine("-- Пересечение множеств --\n");
				Console.WriteLine("Set1: {0}", uiset1);
				Console.WriteLine("Set2: {0}", uiset2);
				Stopwatch stopwatch = new Stopwatch();
				stopwatch.Start();
				Console.WriteLine("\nПересечение: {0}", uiset1 * uiset2);
				stopwatch.Stop();
				Console.WriteLine("Время на пересечение: {0}ms", stopwatch.ElapsedMilliseconds);
				break;
			case 2:
				Console.WriteLine("-- Объединение множеств --\n");
				Console.WriteLine("Set1: {0}", uiset1);
				Console.WriteLine("Set2: {0}", uiset2);
				stopwatch = new Stopwatch();
				stopwatch.Start();
				Console.WriteLine("\nОбъединение: {0}", uiset1 + uiset2);
				stopwatch.Stop();
				Console.WriteLine("Время на объединение: {0}ms", stopwatch.ElapsedMilliseconds);
				break;
			case 3:
				ExitTestSystem(0);
				break;
				
			default:
				Console.WriteLine("Вы ввели неверный код. Вернитесь назад и попробуйте еще раз ;)");
				break;
			}
		}
		
		public static int[] RandomArray(int count, int endItem, int startItem = 0)
		{
			int[] array = new int[count];
			for (int i = 0; i < count; ++i)
			{
				array[i] = startItem + r.Next(endItem - startItem);
			}
			return array;
		}
		
		private static void ExitTestSystem(int returnCode)
		{
			Console.WriteLine("Всего хорошего! Жмите Enter для выхода.");
			//		Console.ReadLine();
			Environment.Exit(returnCode);
		}
	}
}