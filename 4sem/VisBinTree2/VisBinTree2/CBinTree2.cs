// CBinTree2.cs     Кузьменко В.Г. (модификация Гудулин А.О. март 2013 г.)
// Определение класса CBinTree1, содержащего указатель на
//   корень дерева и процедуру добавления нового элемента
//   в дерево.
// Добавлена возможность рисования стрелок на конце дуг и
// возможность удаления любого узла дерева с сохранением
// структуры дерева поиска.

using System.Drawing;
using System;
using System.Drawing.Drawing2D;
using System.Collections;
using System.Linq;

namespace VisBinTree2
{
    class CBinTree2
    {
        public CNode1 head; // указатель на корень дерева
        private int d, r, x0, y0;
        // Перо для рисования дуги дерева:
        public Pen EdgePen = new Pen(Color.Brown, 2);
        public Pen MarkedEdgePen = new Pen(Color.Red, 4);

        public CBinTree2()
        {
            d = 30; r = d / 2; x0 = 100; y0 = 10;
            head = null;
            EdgesArray = new ArrayList();
        }

        public int X0
        {
            get { return x0; }
            set { x0 = value; }
        }

        public int Y0
        {
            get { return y0; }
            set { y0 = value; }
        }

        public ArrayList EdgesArray;

        // Формирование стрелки на конце дуги дерева: 
        public void SetArrowCaps()
        {
            GraphicsPath hPath = new GraphicsPath();

            // Create the outline for our custom end cap.
            hPath.AddLine(new Point(-2, -r / 4), new Point(0, 0));
            hPath.AddLine(new Point(0, 0), new Point(2, -r / 4));

            // Construct the hook-shaped end cap.
            CustomLineCap ArrowCap = new CustomLineCap(null, hPath);

            // Create a pen and set end custom start and end
            // caps to the hook cap.
            EdgePen = new Pen(Color.Brown, 2);
            EdgePen.CustomEndCap = ArrowCap;
        }

        /// <summary>
        /// Процедура добавления нового элемента x в дерево
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        public bool Add(int x)
        {
            if (head == null)
            {
                head = new CNode1(x);
                return true;
            }
            return head.Add(ref this.head, x);
        }

        public int countNodes(CNode1 t)
        {
            return (t == null) ? 0 : 1 + countNodes(t.left) + countNodes(t.right);
        }

        public void putNodes(int x0, int x, int y, CNode1 t, Graphics g)
        {
            int leftNodes, x1, y1;
            float l, dx, dy;
            if (t != null)
            {
                leftNodes = countNodes(t.left);
                x1 = x0 + d * leftNodes + r; y1 = y + 3 * r;
                if (x != 0)
                {
                    dx = x - x1; dy = y1 - y;
                    l = (float)Math.Sqrt(dx * dx + dy * dy);
                    dx = r * dx / l;
                    dy = r * dy / l;

                    Pen pen = t.isEdgeMarked ? MarkedEdgePen : EdgePen;
                    g.DrawLine(pen, x - dx, y + dy, x1 + dx, y1 - dy);

                    Point _p1 = new Point((int)(x - dx), (int)(y + dy));
                    Point _p2 = new Point((int)(x1 + dx), (int)(y1 - dy));
                    Pair<Point, Point> edge = new Pair<Point, Point>(_p1, _p2);
                    Pair<int, Pair<Point, Point>> mapValueEdge = new Pair<int, Pair<Point, Point>>((int)t.value, edge);
                    EdgesArray.Add(mapValueEdge);
                }
                g.DrawEllipse(new Pen(Color.Brown, 2), x1 - r, y1 - r, d, d);
                g.DrawString(t.value.ToString(), new Font("Arial", r), Brushes.Blue, x1 - 13 * r / 14, y1 - 23 * r / 30);
                putNodes(x0, x1, y1, t.left, g);
                putNodes(x1 + r, x1, y1, t.right, g);
            }
        }

        private void DelNode(ref CNode1 t)
        {
            if (t.left == null) t = t.right;
            else
                if (t.right == null) t = t.left;
                else
                {
                    CNode1 tt;
                    tt = t.right;
                    while (tt.left != null) tt = tt.left;
                    tt.left = t.left;
                    t = t.right;
                }
        }

        public bool SearchAndDelNode(int x, ref CNode1 tprev)
        {
            CNode1 tcur = tprev;
            if (tcur != null)
            {
                if (tcur.value == x) { DelNode(ref tprev); return true; }
                else
                    if (x < tcur.value) return SearchAndDelNode(x, ref tprev.left);
                    else return SearchAndDelNode(x, ref tprev.right);
            }
            else return false;
        }

        public bool SearchAndMarkEdge(int x, ref CNode1 tprev)
        {
            CNode1 tcur = tprev;
            if (tcur != null)
            {
                if (tcur.value == x) {
                    tcur.isEdgeMarked = !tcur.isEdgeMarked;
                    return true;
                }
                else
                    if (x < tcur.value) return SearchAndMarkEdge(x, ref tprev.left);
                    else return SearchAndMarkEdge(x, ref tprev.right);
            }
            else return false;
        }
    }

    /**
     * You can collect a pair of any objects
     */
    public class Pair<T, U>
    {
        public Pair()
        {
        }

        public Pair(T first, U second)
        {
            this.First = first;
            this.Second = second;
        }

        public T First { get; set; }
        public U Second { get; set; }
    };
}
