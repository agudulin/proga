using System;
using System.Collections.Generic;
using System.Text;

namespace zd04_m
{
	public class IntegersSet
	{
		public List<int> setOfItems = new List<int>();
		private HashSet<int> hash = new HashSet<int>();
		public ulong controlSum = 0;

		/*
		 * Add integer to the set
		 * You can override this method
		 */
		public virtual void AddItemToSet (int item)
		{
			this.setOfItems.Add(item);
		}
		
		/*
         * Add integer to the set
         */
		public bool AddItem(int item)
		{
			if (item < 0 || item > 800000)
			{
				return false;
			}
			if (setOfItems.Count == 200000)
			{
				return false;
			}
			if (this.hash.Add(item))
			{
				AddItemToSet(item);
				this.controlSum += (ulong)item;
				return true;
			}
			else
			{
				return false;
			}
		}
		
		/*
         * Add array of integers to the set
         */
		public bool AddItem(int[] items)
		{
			foreach (int item in items)
			{
				AddItem(item);
				this.controlSum += (ulong)item;
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
			string defaultString = String.Format("{0} count: {1}, sum: {2} {3}", "{", this.setOfItems.Count, this.controlSum, "}");
			if (this.setOfItems.Count > 30)
			{
				return defaultString;
			}
			else
			{
				string output = defaultString + " [";
				for (int i = 0; i < this.setOfItems.Count; ++i)
				{
					string format = (i == this.setOfItems.Count - 1) ? "{0}" : "{0}, ";
					output += String.Format(format, this.setOfItems[i]);
				}
				
				return output + "]";
			}
		}
		
		/*
         * Reading from .set file
         * First 4 bytes - count of items in file
         * Every new 4 bytes - an integer item
         */
		public void ReadFromFile(string fileName)
		{
			byte[] buffer = new byte[4];
			try
			{
				int count;
				using (System.IO.FileStream fs = new System.IO.FileStream(fileName,
				                                                          System.IO.FileMode.Open,
				                                                          System.IO.FileAccess.Read))
				{
					fs.Read(buffer, 0, buffer.Length);
					count = BitConverter.ToInt32(buffer, 0);
					for (int i = 0; i < count; ++i)
					{
						fs.Read(buffer, 0, buffer.Length);
						int item = BitConverter.ToInt32(buffer, 0);
						this.AddItem(item);
					}
					fs.Close();
				}
				Console.WriteLine(">> Файл из {0} элементов прочитан.", count);
			}
			catch (System.UnauthorizedAccessException ex)
			{
				Console.WriteLine(ex.Message);
			}
		}
	}
}
