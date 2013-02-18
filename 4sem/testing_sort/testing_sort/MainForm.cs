using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;

namespace testing_sort
{
    public partial class MainForm : Form
    {
        private int[] array = new int[100001]; // Our array to load a set of numbers from the file
        private bool isHistoryClear = true;

        public MainForm()
        {
            InitializeComponent();
            sortingTypesList.SelectedIndex = 0;
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
        }

        private void chooseButton_Click(object sender, EventArgs e)
        {
            Stream stream = null;
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.InitialDirectory = ".";
            openFileDialog.Filter = "set files (*.set)|*.set|All files (*.*)|*.*";
            openFileDialog.FilterIndex = 2;
            openFileDialog.RestoreDirectory = true;

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                arrayNameToChooseTextBox.Text = openFileDialog.SafeFileName;
                try
                {
                    // Reading binary file into array
                    if ((stream = openFileDialog.OpenFile()) != null)
                    {
                        using (stream)
                        {
                            // Now read stream into a byte buffer.
                            byte[] bytes = new byte[stream.Length];
                            int numBytesToRead = (int)stream.Length;
                            int numBytesRead = 0;
                            Int64 i = 0; // array current index

                            Int64 checkSum = 0;
                            while (numBytesToRead > 0)
                            {
                                int n = stream.Read(bytes, numBytesRead, 4);
                                // The end of the file is reached.
                                if (n == 0)
                                {
                                    break;
                                }

                                int item = BitConverter.ToInt32(bytes, numBytesRead);
                                // MessageBox.Show(item.ToString());
                                checkSum += item;
                                array[i++] = item;

                                numBytesRead += n;
                                numBytesToRead -= n;
                            }
                            appendTextToTheHistory(String.Format("-- Данные из файла \"{0}\" успешно загружены в массив!\n-- Количество элементов: {1}, Контрольная сумма: {2}", arrayNameToChooseTextBox.Text, array[0], checkSum));
                        }
                    }

                    // Enable submit button
                    int sortingType = sortingTypesList.SelectedIndex;
                    switch (sortingType)
                    {
                        case -1:
                            submitButton.Enabled = false;
                            break;
                        default:
                            submitButton.Enabled = true;
                            break;
                    }
                }
                catch (Exception ex)
                {
                    appendTextToTheHistory("Error! Не удается прочесть файл с диска.");// Текст ошибки: " + ex.ToString());
                }
            }
        }

        private void submitButton_Click(object sender, EventArgs e)
        {
            int sortingType = sortingTypesList.SelectedIndex;
            Stopwatch swatch = new Stopwatch();
            switch (sortingType)
            {
                case 0:
                    appendTextToTheHistory("   ** QuickSort **");
                    printArray(array, 1);

                    int[] arrayToSort = new int[array[0]];
                    for (Int64 i = 0; i < array[0]; ++i)
                    {
                        arrayToSort[i] = array[i + 1];
                    }

                    swatch.Start();
                    quickSort(arrayToSort, 0, array[0]-1);
                    swatch.Stop();

                    printArray(arrayToSort, 0, "Отсортированный");
                    appendTextToTheHistory(String.Format("   Время сортировки: {0}", swatch.Elapsed.ToString()));
                    break;
                case 1:
                    appendTextToTheHistory("   ** RadixSort **");
                    printArray(array, 1);

                    int[] testArray = new int[10];
                    testArray[0] = 40;
                    testArray[1] = 10;
                    testArray[2] = 20;
                    testArray[3] = 80;
                    testArray[4] = 100;
                    testArray[5] = 11;
                    testArray[6] = 1;
                    testArray[7] = 24;
                    testArray[8] = 12;
                    testArray[9] = 4;


                    arrayToSort = new int[array[0]];
                    for (Int64 i = 0; i < array[0]; ++i)
                    {
                        arrayToSort[i] = array[i + 1];
                    }

                    printArray(testArray);
                    swatch.Start();
                    quickSort(testArray, 0, array[0] - 1);
                    swatch.Stop();
                    printArray(testArray, 0, "Отсортированный");
                    appendTextToTheHistory(String.Format("   Время сортировки: {0}", swatch.Elapsed.ToString()));
                    break;
                default:
                    break;
            }
        }

        /**
         * Print array
         */
        private void printArray(int[] array, int start = 0, String tip = "Исходный")
        {
            String arrayString = "";
            for (int i = start; i < 10+start; ++i)
            {
                arrayString += array[i].ToString() + ", ";
            }
            appendTextToTheHistory(String.Format("   {0}: [{1}...]", tip, arrayString));
        }

        /**
         * QuickSort algo
         */
        private static void quickSort(int[] array, int low, int high)
        {
            int l = low;
            int r = high;
            int medianItem = array[(low+high)/2];
            do
            {
                while (array[l] < medianItem) ++l;
                while (array[r] > medianItem) --r;
                if (l <= r)
                {
                    int tmp = array[l];
                    array[l++] = array[r];
                    array[r--] = tmp;
                }
            } while (l < r);
            if (low < r)
            {
                quickSort(array, low, r);
            }
            if (l < high)
            {
                quickSort(array, l, high);
            }
        }

        /**
         * Add some brief info to the textarea at the bottom
         * 
         */
        private void appendTextToTheHistory(String textToAdd, bool addNewLine = true)
        {
            if (!isHistoryClear)
            {
                if (addNewLine)
                {
                    historyTextBox.AppendText("\n");
                }
            }
            historyTextBox.AppendText(textToAdd);
            isHistoryClear = false;
            clearHistoryButton.Enabled = true;

            // Paint System string into Blue color
            int startIndex = 0;
            foreach (String line in historyTextBox.Lines)
            {
                if (line.StartsWith("--"))
                {
                    // MessageBox.Show(line);
                    historyTextBox.Select(startIndex, line.Length);
                    historyTextBox.SelectionColor = Color.Blue;
                }
                else if (line.StartsWith("Error")) {
                    historyTextBox.Select(startIndex, line.Length);
                    historyTextBox.SelectionColor = Color.Red;
                }
                else if (line.StartsWith("   "))
                {
                    String leftSide = line.Split(':')[0];
                    if (leftSide.Length > 0)
                    {
                        historyTextBox.Select(startIndex, leftSide.Length);
                        historyTextBox.SelectionFont = new Font(historyTextBox.Font, FontStyle.Bold);
                    }
                    
                }
                startIndex += line.Length + 1;
            }
        }

        private void clearHistoryButton_Click(object sender, EventArgs e)
        {
            historyTextBox.Clear();
            isHistoryClear = true;
            clearHistoryButton.Enabled = false;
        }

        private void aboutMenuButton_Click(object sender, EventArgs e)
        {
            AboutForm aboutForm = new AboutForm();
            aboutForm.Show();
        }
    }
}
