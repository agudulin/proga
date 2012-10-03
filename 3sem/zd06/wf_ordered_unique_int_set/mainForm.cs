using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Windows.Forms;

namespace wf_ordered_unique_int_set
{
    public partial class mainForm : Form
    {
        public mainForm()
        {
            InitializeComponent();
        }

        /*
         * Show About Dialog window
         */
        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            aboutForm about = new aboutForm();
            about.ShowDialog();
        }

        /*
         * Get an array of random integers
         */
        public static int[] RandomArray(int count, int endItem, int startItem = 0)
        {
            Random r = new Random();
            List<int> uniqueArray = Enumerable.Range(0, count + 100).ToList<int>();
            int[] array = new int[count];
            for (int i = 0; i < count; i++)
            {
                int index = r.Next(uniqueArray.Count);
                array[i] = uniqueArray[index];
                uniqueArray.RemoveAt(index);
            }
            return array;
        }

        /*
         * ========================
         * Methods for the left box
         * ========================
         */

        /*
         * Create a set of random integers
         */
        private void createButton_Click(object sender, EventArgs e)
        {
            clearMessageWindows();
            int count = (int)sizeOfSet.Value;
            Global.set = new OrderedUniqueIntegersSet(RandomArray(count, 799999));
            tbToPrint.Text = Global.set.ToString();
            logger.Text = "Success! Set_1 was created.";
        }

        /*
         * Save a set to the file
         */
        private void saveToFileButton_Click(object sender, EventArgs e)
        {
            try
            {
                string path = pathToSave.Text;
                if (path == "")
                {
                    logger.Text = "Warning! Empty file name.";
                }
                else
                {
                    Global.set.SaveToFile(path);
                    logger.Text = String.Format("Success! Set_1 was saved to the file {0}", path);
                }
            }
            catch (System.Exception ex)
            {
                logger.Text = "Error! Can't save the set to file."; // + ex.ToString();
            }
        }

        private void loadFromFileButton_Click(object sender, EventArgs e)
        {
            clearMessageWindows();
            try
            {
                Global.set = new OrderedUniqueIntegersSet();
                Global.set.ReadFromFile(pathToLoad.Text);
                logger.Text = "Success! File was read.";
                // MessageBox.Show("Success!");
                tbToPrint.Text = Global.set.ToString();
            }
            catch (System.Exception ex)
            {
                logger.Text = "Error! Can't load file."; // + ex.ToString();
            }
        }

        /*
         * =========================
         * Methods for the right box
         * =========================
         */

        private void createButton1_Click(object sender, EventArgs e)
        {
            clearMessageWindows();
            int count = (int)sizeOfSet.Value;
            Global.set1 = new OrderedUniqueIntegersSet(RandomArray(count, 799999));
            tbToPrint1.Text = Global.set1.ToString();
            logger.Text = "Success! Set_2 was created.";
        }

        private void saveToFileButton1_Click(object sender, EventArgs e)
        {
            try
            {
                string path = pathToSave1.Text;
                if (path == "")
                {
                    logger.Text = "Warning! Empty file name.";
                }
                else
                {
                    Global.set1.SaveToFile(path);
                    logger.Text = String.Format("Success! Set_1 was saved to the file {0}", path);
                }
            }
            catch (System.Exception ex)
            {
                logger.Text = "Error! Can't save the set to file."; // + ex.ToString();
            }
        }

        private void loadFromFileButton1_Click(object sender, EventArgs e)
        {
            clearMessageWindows();
            try
            {
                Global.set1 = new OrderedUniqueIntegersSet();
                Global.set1.ReadFromFile(pathToLoad1.Text);
                logger.Text = "Success! File was read.";
                // MessageBox.Show("Success!");
                tbToPrint1.Text = Global.set1.ToString();
            }
            catch (System.Exception ex)
            {
                logger.Text = "Error! Can't load file."; // + ex.ToString();
            }
        }

        /*
         * ==========================
         * Methods for the bottom box
         * ==========================
         */
        private void getIntersectionButton_Click(object sender, EventArgs e)
        {
            Stopwatch sw = new Stopwatch();
            sw.Start();
            tbIntersection.Text = String.Format("{0}", Global.set * Global.set1);
            sw.Stop();
            tbIntersection.Text += String.Format("\n\n---\nTime: {0}ms", sw.ElapsedMilliseconds);
        }

        private void getUnionButton_Click(object sender, EventArgs e)
        {
            Stopwatch sw = new Stopwatch();
            sw.Start();
            tbUnion.Text = String.Format("{0}", Global.set + Global.set1);
            sw.Stop();
            tbUnion.Text += String.Format("\n\n---\nTime: {0}ms", sw.ElapsedMilliseconds);
        }

        /*
         * ======================== 
         */

        /*
         * Clear info message boxes
         */
        private void clearMessageWindows()
        {
            tbIntersection.Text = "";
            tbUnion.Text = "";
        }
    };

    /*
     * Store all global variables here
     */
    class Global
    {
        public static OrderedUniqueIntegersSet set;
        public static OrderedUniqueIntegersSet set1;
    };
}
