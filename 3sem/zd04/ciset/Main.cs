using System;
using System.Collections.Generic;

class MainClass
{
	public static void Main (string[] args)
	{
		int[] array1 = {3, 5, 7, 8, 10, 70, 5};
		int[] array2 = {7, 8, 11, 3, 11, 7};
		UniqueIntegersSet uiset1 = new UniqueIntegersSet(array1);
		UniqueIntegersSet uiset2 = new UniqueIntegersSet(array2);

		Console.WriteLine(uiset1);
		Console.WriteLine(uiset2);
		Console.WriteLine(uiset1 + uiset2);
		Console.WriteLine(uiset1);
		Console.WriteLine(uiset1 * uiset2);
	}
}

/*
 * Set of unique integers
 */
class UniqueIntegersSet
{
	public List<int> setOfItems = new List<int>();
	private HashSet<int> hash = new HashSet<int>();

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

	public bool Contains(int item)
	{
		return (this.hash.Contains(item)) ? true : false;
	}

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