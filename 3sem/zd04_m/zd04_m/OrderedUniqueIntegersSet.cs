using System;
using System.Collections.Generic;
using System.Text;

namespace zd04_m
{
	/*
     * Set of unique integers
     */
	class OrderedUniqueIntegersSet : IntegersSet
	{
		/*
         * Constructors
         */
		public OrderedUniqueIntegersSet()
		{
		}
		
		public OrderedUniqueIntegersSet(int item)
			: this()
		{
			AddItem(item);
		}
		
		public OrderedUniqueIntegersSet(int[] items)
			: this()
		{
			foreach (int item in items)
			{
				AddItem(item);
			}
		}
		/*
         */

		/*
		 * Add item to the set ascending
		 */
		public override void AddItemToSet (int item)
		{
			if (this.setOfItems.Count == 0) {
				this.setOfItems.Add (item);
			} else {
				bool isAdded = false;
				for (int i = 0; i < this.setOfItems.Count; ++i) {
					if (this.setOfItems [i] > item) {
						this.setOfItems.Insert (i, item);
						isAdded = true;
						break;
					}
				}
				if (false == isAdded) {
					this.setOfItems.Add (item);
				}
			}
		}

		/*
         * Override operator + to combine two sets
         */
		public static OrderedUniqueIntegersSet operator +(OrderedUniqueIntegersSet uiSet1, OrderedUniqueIntegersSet uiSet2)
		{
			OrderedUniqueIntegersSet uiSetUnion = new OrderedUniqueIntegersSet();
			
			foreach (int item in uiSet1.setOfItems)
			{
				uiSetUnion.AddItem(item);
			}
			foreach (int item in uiSet2.setOfItems)
			{
				uiSetUnion.AddItem(item);
			}
			return uiSetUnion;
		}
		
		/*
         * Override operator * to get intersection of two sets
         */
		public static OrderedUniqueIntegersSet operator *(OrderedUniqueIntegersSet uiSet1, OrderedUniqueIntegersSet uiSet2)
		{
			OrderedUniqueIntegersSet uiSetIntersection = new OrderedUniqueIntegersSet();
			foreach (int item in uiSet2.setOfItems)
			{
				if (uiSet1.Contains(item))
				{
					uiSetIntersection.AddItem(item);
				}
			}
			return uiSetIntersection;
		}
	}
}
