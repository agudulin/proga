using System;
using System.Collections.Generic;
using System.Text;

namespace ordered_unique_int_set
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
        public override void AddItemToSet(int item)
        {
            int index = this.setOfItems.BinarySearch(item);
            if (index < 0)
            {
                setOfItems.Insert(~index, item);
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
