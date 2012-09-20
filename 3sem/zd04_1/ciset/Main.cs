using System;
using System.Collections.Generic;

class MainClass
{
	public static void Main (string[] args)
	{
		TestUniqueIntegersSet test = new TestUniqueIntegersSet();
		test.Start();
	}
}

class IntegersSet
{
	public List<int> setOfItems = new List<int>();
	private HashSet<int> hash = new HashSet<int>();

	/*
	 * Add integer to the set
	 */
	public bool AddItem (int item)
	{
		if (item < 0 || item > 800000) {
			#if DEBUG
			Console.WriteLine ("<WARNING> can't add an item {0}. It should be in [0, 800000]", item);
			#endif
			return false;
		}
		if (setOfItems.Count == 200000) {
			#if DEBUG
			Console.WriteLine ("<WARNING> can't add an item {0}. Set is full of numbers", item);
			#endif
			return false;
		}
		if (this.hash.Add (item)) {
			this.setOfItems.Add (item);
			#if DEBUG
			Console.WriteLine ("<SUCCESS> item {0} was successfully added", item);
			#endif
			return true;
		} else {
			#if DEBUG
			Console.WriteLine ("<WARNING> can't add an item {0}. It is already exists", item);
			#endif
			return false;
		}
	}
	
	/*
	 * Add array of integers to the set
	 */
	public bool AddItem (int[] items)
	{
		foreach (int item in items) {
			AddItem(item);
		}
		return true;
	}

	/*
	 * Check if set contains an item
	 */
	public bool Contains(int item)
	{
		return this.hash.Contains(item);
	}

	/*
	 * Override method to print the set as a string
	 */
	public override string ToString()
	{
		string output = "[";
		for (int i = 0; i < this.setOfItems.Count; ++i)
		{
			string format = (i == this.setOfItems.Count-1) ? "{0}" : "{0}, ";
			output += String.Format (format, this.setOfItems[i]);
		}
		return output + "]";
	}
}

/*
 * Set of unique integers
 */
class UniqueIntegersSet : IntegersSet
{
	/*
	 * Constructors
	 */
	public UniqueIntegersSet ()
	{
	}

	public UniqueIntegersSet (int item): this()
	{
		AddItem(item);
	}

	public UniqueIntegersSet (int[] items): this()
	{
		foreach (int item in items) {
			AddItem(item);
		}
	}
	/*
	 */

	/*
	 * Override operator + to combine two sets
	 */
	public static UniqueIntegersSet operator + (UniqueIntegersSet uiSet1, UniqueIntegersSet uiSet2)
	{
		UniqueIntegersSet uiSetUnion = new UniqueIntegersSet();

		foreach (int item in uiSet1.setOfItems) {
			uiSetUnion.AddItem(item);
		}
		foreach (int item in uiSet2.setOfItems){
			uiSetUnion.AddItem(item);
		}
		return uiSetUnion;
	}

	/*
	 * Override operator * to get intersection of two sets
	 */
	public static UniqueIntegersSet operator *(UniqueIntegersSet uiSet1, UniqueIntegersSet uiSet2)
	{
		UniqueIntegersSet uiSetIntersection = new UniqueIntegersSet();
		foreach (int item in uiSet2.setOfItems){
			if (uiSet1.Contains(item)){
				uiSetIntersection.AddItem(item);
			}
		}
		return uiSetIntersection;
	}
}

/*
 * Test for UniqueIntegersSet class
 */
class TestUniqueIntegersSet
{
	static Random r = new Random();

	public TestUniqueIntegersSet ()
	{
	}

	public void Start ()
	{
		Console.WriteLine ("zd04_ga.cs\t\t Гудулин А.О. 16.09.2012");
		Console.WriteLine ("Класс для представления множества неповторяющихся целых чисел.");
		Console.WriteLine (" Элементы множества - целые числа в диапазоне от 0 до 800000.");
		Console.WriteLine ("     Максимальный размер множества = 200000 элементов.");
		Console.WriteLine ();

		while (true) {
			PrintMenu ();
			Console.WriteLine ("\n\nEnter - назад в меню");
			Console.ReadLine ();
			Console.Clear ();
		}
	}

	public static void PrintMenu ()
	{
		Console.WriteLine ("1. Объединение множеств");
		Console.WriteLine ("2. Пересечение множеств");
		Console.WriteLine ("3. Проверка принадлежности элемента множеству");
		Console.WriteLine ("4. Создание объекта из массива");
		Console.WriteLine ("5. Включение элемента (или массива) в множество");
		Console.WriteLine ("6. Вывод множества на экран или в файл");
		Console.WriteLine ("7. Выход");

		Console.Write ("\nВведите [1-7]: ");
		int i;
		if (!int.TryParse (Console.ReadLine (), out i)) {
			ExitTestSystem (0);
		}

		Console.Clear();

		UniqueIntegersSet uiset1 = new UniqueIntegersSet(RandomArray(10, 30));
		UniqueIntegersSet uiset2 = new UniqueIntegersSet(RandomArray(10, 25));

		switch (i)
		{
			case 1:
				Console.WriteLine("-- Объединение множеств --\n");
				Console.WriteLine("Set1: {0}", uiset1);
				Console.WriteLine("Set2: {0}", uiset2);
				Console.WriteLine("\nОбъединение: {0}", uiset1 + uiset2);
				break;
			case 2:
				Console.WriteLine("-- Пересечение множеств --\n");
				Console.WriteLine("Set1: {0}", uiset1);
				Console.WriteLine("Set2: {0}", uiset2);
				Console.WriteLine("\nОбъединение: {0}", uiset1 * uiset2);
				break;
			case 3:
				Console.WriteLine("-- Проверка принадлежности элемента множеству --\n");

				while (true) {
					UniqueIntegersSet uiset = new UniqueIntegersSet (RandomArray(10, 40));
					Console.WriteLine("Set: {0}", uiset);
					Console.Write("Введите элемент для проверки (Enter - закончить): ");
					string inputString = Console.ReadLine ();
					int item;
					if (inputString == "") {
						break;
					}
					if (!int.TryParse(inputString, out item)) {
						Console.WriteLine("Вы ввели шнягу");
					} else {
						if (uiset.Contains(item)) {
							Console.WriteLine (">> True: {0} есть в Set.\n", item);
						} else {
							Console.WriteLine (">> False: {0} отсутствует в Set.\n", item);
						}
					}
				}

				break;
			case 4:
				Console.WriteLine ("-- Создание объекта из массива --\n");
				int[] array = RandomArray (10, 40);
				Console.Write ("Array: <");
				for (int j = 0; j < array.Length-1; ++j) {
					Console.Write ("{0}, ", array[j]);
				}
				Console.WriteLine ("{0}>", array[array.Length-1]);
				Console.WriteLine ("Set: {0}", new UniqueIntegersSet(array));
				break;
			case 5:
				Console.WriteLine ("-- Включение элемента (или массива) в множество --\n");
				UniqueIntegersSet uiset5 = new UniqueIntegersSet ();
				
				while (true) {
					Console.WriteLine ("Set: {0}\n", uiset5);
					Console.WriteLine ("Введите элемент ('10' или '1 2 4') для включения (Enter - закончить): ");
					string inputString = Console.ReadLine ();
					if (inputString == "") {
						break;
					}
					else {
						int[] splittedString = Array.ConvertAll<string, int>(inputString.Split(), int.Parse);
						uiset5.AddItem(splittedString);
					}
				}
				
				break;
			case 6:
				Console.WriteLine ("-- Вывод множества на экран или в файл --\n");
				Console.WriteLine ("Set: {0}", uiset1);
				Console.WriteLine ("Введите путь файла для записи Set: ");
				string outFileName = Console.ReadLine ();
				using (System.IO.StreamWriter file = new System.IO.StreamWriter(@"" + outFileName, false))
				{
					file.WriteLine(uiset1);
					Console.WriteLine (">> Записано!");
				}
				break;
			case 7:
				ExitTestSystem (0);
				break;

			default:
				Console.WriteLine("Вы ввели неверный код. Вернитесь назад и попробуйте еще раз ;)");
				break;
		}
	}

	public static int[] RandomArray (int count, int endItem, int startItem = 0)
	{
		int[] array = new int[count];
		for (int i = 0; i < count; ++i) {
			array[i] = startItem + r.Next (endItem-startItem);
		}
		return array;
	}

	private static void ExitTestSystem (int returnCode)
	{
		Console.WriteLine("Всего хорошего! Жмите Enter для выхода.");
//		Console.ReadLine();
		Environment.Exit(returnCode);
	}
}