using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace zd04_m
{
    /*
     * Set of unique integers
     */
    class UniqueIntegersSet : IntegersSet
    {
        /*
         * Constructors
         */
        public UniqueIntegersSet()
        {
        }

        public UniqueIntegersSet(int item)
            : this()
        {
            AddItem(item);
        }

        public UniqueIntegersSet(int[] items)
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
         * Override operator + to combine two sets
         */
        public static UniqueIntegersSet operator +(UniqueIntegersSet uiSet1, UniqueIntegersSet uiSet2)
        {
            UniqueIntegersSet uiSetUnion = new UniqueIntegersSet();

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
        public static UniqueIntegersSet operator *(UniqueIntegersSet uiSet1, UniqueIntegersSet uiSet2)
        {
            UniqueIntegersSet uiSetIntersection = new UniqueIntegersSet();
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
