// CNode1.cs     Кузьменко В.Г.,февраль 2010 г.
// Определение класса CNode1 - определение узла бинарного дерева.
//   

using System.Drawing;
using System;

namespace VisBinTree2
{
    class CNode1
    {

        public int value;
        public CNode1 left, right;
        public bool isEdgeMarked;

        public CNode1(int x)
        {
            value = x;
            left = right = null;
            isEdgeMarked = false;
        }

        public bool Add(ref CNode1 p, int x)
        {
            if (p == null)
            {
                p = new CNode1(x);
                return true;
            }
            else
                if (x == p.value) return false;
                else
                    if (x < p.value) return p.Add(ref p.left, x);
                    else return p.Add(ref p.right, x);
        }
    }
}
