// Form1.cs    Кузьменко В.Г. (модификация Гудулин А.О. март 2013 г.)
// Определение класса Form1 - главное окно приложения для задания
//   элементов, добавляемых в дерево поиска и рисования бинарного
//   дерева поиска.
// Добавлена возможность рисования стрелок на конце дуг и
// возможность удаления любого узла дерева с сохранением
// структуры дерева поиска. 
//

using System;
using System.Drawing;
using System.Windows.Forms;
using System.Linq;
using System.Collections;
using System.Drawing.Drawing2D;

namespace VisBinTree2
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();
        }

        private CBinTree2 t = new CBinTree2();

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "") textBox2.Text = "Не задано добавляемое значение элемента!";
            else
            {
                try
                {
                    int x = Convert.ToInt32(textBox1.Text);
                    if ((x < 1) || (x > 99)) textBox2.Text = "Новый элемент должн быть в пределах от 1 до 99!";
                    else
                        if (t.Add(x))
                            textBox2.Text = "Новый элемент добавлен!";
                        else textBox2.Text = "Новый элемент НЕ добавлен! (Такой элемент уже есть в дереве)";
                }
                catch (FormatException)
                {
                    textBox2.Text = "Ошибка: Неверный формат введенного значения элемента!!!";
                }
            }
            panel1.Invalidate();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            Graphics g = e.Graphics;
            if (t.head != null)
            {
                t.EdgesArray.Clear();
                t.putNodes(t.X0, 0, t.Y0, t.head, g);
            }
        }

        private void оПрограммеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form2 aboutpr = new Form2();
            aboutpr.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox3.Text == "") textBox2.Text = "Не задан удаляемый элемент!";
            else
            {
                try
                {
                    int x = Convert.ToInt32(textBox3.Text);
                    if (t.SearchAndDelNode(x, ref t.head)) textBox2.Text = "Элемент удалён!";
                    else textBox2.Text = "Элемент НЕ удалён! (его нет в дереве)";
                }
                catch (FormatException)
                {
                    textBox2.Text = "Ошибка: Неверный формат введенного значения элемента!!!";
                }
            }
            panel1.Invalidate();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            textBox2.Text = "";
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            textBox2.Text = "";
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked) t.SetArrowCaps();
            else t.EdgePen = new Pen(Color.Brown, 2);
            panel1.Invalidate();
        }

        /**
         * Add a new child with Enter button
         */
        private void newNumberTextBoxKey(object sender, KeyPressEventArgs e)
        {
             if (e.KeyChar == (char)Keys.Enter)
             {
                 button1_Click(sender, e);
                 textBox1.Clear();
             }
        }

        /**
         * Check if user double clicked,
         * then check if we have an edge in the area
         * then highlight the edge
         */
        private void mainFormDoubleClick(object sender, EventArgs e)
        {
            MouseEventArgs me = e as MouseEventArgs;
            // MessageBox.Show(String.Format("Cursor postition: ({0}, {1})", me.X, me.Y));
            for (int i = 0; i < t.EdgesArray.Count; ++i )
            {
                Pair<int, Pair<Point, Point>> mapValueEdge = (Pair<int, Pair<Point, Point>>)t.EdgesArray[i];
                int value = mapValueEdge.First;
                Pair<Point, Point> point = mapValueEdge.Second;
                Point[] rect = getRectangleByTwoPoints(point.First, point.Second);

                GraphicsPath gp = new GraphicsPath();
                gp.CloseFigure();
                gp.AddLine(rect[0].X, rect[0].Y, rect[1].X, rect[1].Y);
                gp.AddLine(rect[0].X, rect[0].Y, rect[2].X, rect[2].Y);
                gp.AddLine(rect[1].X, rect[1].Y, rect[3].X, rect[3].Y);
                gp.AddLine(rect[2].X, rect[2].Y, rect[3].X, rect[3].Y);
                
                if (gp.IsVisible(me.X, me.Y))
                {
                    // MessageBox.Show("YYEEEAAAHHHH!!!");
                    t.SearchAndMarkEdge(value, ref t.head);
                    break;
                }
            }
            panel1.Invalidate();
        }

        /**
         * Get rectangle around edge (p1 --- p2) line
         */
        private Point[] getRectangleByTwoPoints(Point p1, Point p2)
        {
            int gap = 8; // px
            Point left_top = new Point(),
                  left_bottom = new Point(),
                  right_top = new Point(),
                  right_bottom = new Point();

            if ((p1.X < p2.X) && (p1.Y < p2.Y))
            {
                left_top = new Point(p1.X, p1.Y - gap);
                left_bottom = new Point(p1.X - gap, p1.Y);
                right_top = new Point(p2.X + gap, p2.Y);
                right_bottom = new Point(p2.X, p2.Y + gap);
            }
            if ((p1.X < p2.X) && (p1.Y > p2.Y))
            {
                left_top = new Point(p1.X - gap, p1.Y);
                left_bottom = new Point(p1.X, p1.Y + gap);
                right_top = new Point(p2.X, p2.Y - gap);
                right_bottom = new Point(p2.X + gap, p2.Y);
            }
            if ((p1.X > p2.X) && (p1.Y > p2.Y))
            {
                right_top = new Point(p1.X - gap, p1.Y);
                right_bottom = new Point(p1.X, p1.Y + gap);
                left_top = new Point(p2.X, p2.Y - gap);
                left_bottom = new Point(p2.X + gap, p2.Y);
                
            }
            if ((p1.X > p2.X) && (p1.Y < p2.Y))
            {
                right_top = new Point(p1.X, p1.Y - gap);
                right_bottom = new Point(p1.X - gap, p1.Y);
                left_top = new Point(p2.X + gap, p2.Y);
                left_bottom = new Point(p2.X, p2.Y + gap);
            }

            return new Point[4] { left_top, left_bottom, right_top, right_bottom };
        }

        private void delNumberTextBoxKey(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                button2_Click(sender, e);
                textBox3.Clear();
            }
        }
    }

}

