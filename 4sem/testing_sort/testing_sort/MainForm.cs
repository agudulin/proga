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
using System.Collections;

namespace testing_sort
{
    public partial class MainForm : Form
    {
        private int[] array = new int[100001]; // Our array to load a set of numbers from the file
        private ArrayList arrayList = new ArrayList();
        private bool isHistoryClear = true;
        private bool isHistoryClear_list = true;

        public MainForm()
        {
            InitializeComponent();
            sortingTypesList.SelectedIndex = 0;
            sortingTypesList_list.SelectedIndex = 0;
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

            // Clean array
            for (int i = 0; i < array.Length; ++i)
            {
                array[i] = 0;
            }

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
            swatch.Reset();
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
                    quickSort(arrayToSort, 0, array[0] - 1);
                    swatch.Stop();

                    printArray(arrayToSort, 0, "Отсортированный");
                    appendTextToTheHistory(String.Format("   Время сортировки: {0}", swatch.Elapsed.ToString()));
                    break;
                case 1:
                    appendTextToTheHistory("   ** ShellSort **");
                    printArray(array, 1);

                    arrayToSort = new int[array[0]];
                    for (Int64 i = 0; i < array[0]; ++i)
                    {
                        arrayToSort[i] = array[i + 1];
                    }

                    swatch.Start();
                    shellSort(arrayToSort);
                    swatch.Stop();
                    printArray(arrayToSort, 0, "Отсортированный");
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
            for (int i = start; i < 10 + start; ++i)
            {
                arrayString += array[i].ToString() + ", ";
            }
            appendTextToTheHistory(String.Format("   {0}: [{1}...]", tip, arrayString));
        }

        /**
         * Print arrayList
         */
        private void printArray_list(ArrayList array, int start = 0, String tip = "Исходный")
        {
            String arrayString = "";
            for (int i = start; i < 10 + start; ++i)
            {
                arrayString += array[i].ToString() + ", ";
            }
            appendTextToTheHistory_list(String.Format("   {0}: [{1}...]", tip, arrayString));
        }

        /**
         * QuickSort algo
         */
        private static void quickSort(int[] array, int low, int high)
        {
            int l = low;
            int r = high;
            int medianItem = array[(low + high) / 2];
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
         * QuickSort algo for ArrayList class
         */
        private static void quickSort(ArrayList array, int low, int high)
        {
            int l = low;
            int r = high;
            int medianItem = (int)array[(low + high) / 2];
            do
            {
                while ((int)array[l] < medianItem) ++l;
                while ((int)array[r] > medianItem) --r;
                if (l <= r)
                {
                    int tmp = (int)array[l];
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
         * ShellSort algo for ArrayList class
         */
        private void shellSort(ArrayList vector)
        {
            int step = vector.Count / 2;
            while (step > 0)
            {
                int i, j;
                for (i = step; i < vector.Count; i++)
                {
                    int value = (int)vector[i];
                    for (j = i - step; (j >= 0) && ((int)vector[j] > value); j -= step)
                        vector[j + step] = vector[j];
                    vector[j + step] = value;
                }
                step /= 2;
            }
        }

        /**
         * ShellSort algo
         */
        private void shellSort(int[] vector)
        {
            int step = vector.Length / 2;
            while (step > 0)
            {
                int i, j;
                for (i = step; i < vector.Length; i++)
                {
                    int value = vector[i];
                    for (j = i - step; (j >= 0) && (vector[j] > value); j -= step)
                        vector[j + step] = vector[j];
                    vector[j + step] = value;
                }
                step /= 2;
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
            saveToFile.Enabled = true;


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
                else if (line.StartsWith("Error"))
                {
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
            saveToFile.Enabled = false;
        }

        private void aboutMenuButton_Click(object sender, EventArgs e)
        {
            AboutForm aboutForm = new AboutForm();
            aboutForm.Show();
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        /****************************
         * ArrayList Implementation *
         ****************************/

        private void chooseButton_list_Click(object sender, EventArgs e)
        {
            Stream stream = null;
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.InitialDirectory = ".";
            openFileDialog.Filter = "set files (*.set)|*.set|All files (*.*)|*.*";
            openFileDialog.FilterIndex = 2;
            openFileDialog.RestoreDirectory = true;

            // Clean array
            arrayList.Clear();

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                arrayNameToChooseTextBox_list.Text = openFileDialog.SafeFileName;
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
                                arrayList.Add(item);

                                numBytesRead += n;
                                numBytesToRead -= n;
                            }
                            appendTextToTheHistory_list(String.Format("-- Данные из файла \"{0}\" успешно загружены в массив!\n-- Количество элементов: {1}, Контрольная сумма: {2}", arrayNameToChooseTextBox_list.Text, arrayList[0], checkSum));
                            // printArray_list(arrayList);
                        }
                    }

                    // Enable submit button
                    int sortingType = sortingTypesList_list.SelectedIndex;
                    switch (sortingType)
                    {
                        case -1:
                            submitButton_list.Enabled = false;
                            break;
                        default:
                            submitButton_list.Enabled = true;
                            break;
                    }
                }
                catch (Exception ex)
                {
                    appendTextToTheHistory_list("Error! Не удается прочесть файл с диска.");// Текст ошибки: " + ex.ToString());
                }
            }
        }
        /**
         * Add some brief info to the textarea at the bottom
         * 
         */
        private void appendTextToTheHistory_list(String textToAdd, bool addNewLine = true)
        {
            if (!isHistoryClear_list)
            {
                if (addNewLine)
                {
                    historyTextBox_list.AppendText("\n");
                }
            }
            historyTextBox_list.AppendText(textToAdd);
            isHistoryClear_list = false;
            clearHistoryButton_list.Enabled = true;
            saveToFile_list.Enabled = true;

            // Paint System string into Blue color
            int startIndex = 0;
            foreach (String line in historyTextBox_list.Lines)
            {
                if (line.StartsWith("--"))
                {
                    // MessageBox.Show(line);
                    historyTextBox_list.Select(startIndex, line.Length);
                    historyTextBox_list.SelectionColor = Color.Blue;
                }
                else if (line.StartsWith("Error"))
                {
                    historyTextBox_list.Select(startIndex, line.Length);
                    historyTextBox_list.SelectionColor = Color.Red;
                }
                else if (line.StartsWith("   "))
                {
                    String leftSide = line.Split(':')[0];
                    if (leftSide.Length > 0)
                    {
                        historyTextBox_list.Select(startIndex, leftSide.Length);
                        historyTextBox_list.SelectionFont = new Font(historyTextBox_list.Font, FontStyle.Bold);
                    }
                }
                startIndex += line.Length + 1;
            }
        }

        private void submitButton_list_Click(object sender, EventArgs e)
        {
            int sortingType = sortingTypesList_list.SelectedIndex;
            Stopwatch swatch = new Stopwatch();
            swatch.Reset();
            switch (sortingType)
            {
                case 0:
                    appendTextToTheHistory_list("   ** QuickSort **");
                    printArray_list(arrayList, 1);

                    ArrayList arrayToSort = new ArrayList();
                    for (int i = 0; i < (int)arrayList[0]; ++i)
                    {
                        arrayToSort.Add(arrayList[i + 1]);
                    }

                    swatch.Start();
                    quickSort(arrayToSort, 0, arrayToSort.Count - 1);
                    swatch.Stop();

                    printArray_list(arrayToSort, 0, "Отсортированный");
                    appendTextToTheHistory_list(String.Format("   Время сортировки: {0}", swatch.Elapsed.ToString()));
                    break;
                case 1:
                    appendTextToTheHistory_list("   ** ShellSort **");
                    printArray_list(arrayList, 1);

                    arrayToSort = new ArrayList();
                    for (int i = 0; i < (int)arrayList[0]; ++i)
                    {
                        arrayToSort.Add(arrayList[i + 1]);
                    }

                    swatch.Start();
                    shellSort(arrayToSort);
                    swatch.Stop();
                    printArray_list(arrayToSort, 0, "Отсортированный");
                    appendTextToTheHistory_list(String.Format("   Время сортировки: {0}", swatch.Elapsed.ToString()));
                    break;
                case 2:
                    appendTextToTheHistory_list("   ** ArrayList.Sort **");
                    printArray_list(arrayList, 1);

                    arrayToSort = new ArrayList();
                    for (int i = 0; i < (int)arrayList[0]; ++i)
                    {
                        arrayToSort.Add(arrayList[i + 1]);
                    }

                    swatch.Start();
                    arrayToSort.Sort();
                    swatch.Stop();
                    printArray_list(arrayToSort, 0, "Отсортированный");
                    appendTextToTheHistory_list(String.Format("   Время сортировки: {0}", swatch.Elapsed.ToString()));
                    break;
                default:
                    break;
            }
        }

        private void clearHistoryButton_list_Click(object sender, EventArgs e)
        {
            historyTextBox_list.Clear();
            isHistoryClear_list = true;
            clearHistoryButton_list.Enabled = false;
            saveToFile.Enabled = false;
        }

        private void saveToFile_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();

            saveFileDialog.DefaultExt = "*.rtf";
            saveFileDialog.Filter = "RTF Files|*.rtf";

            if (saveFileDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK && saveFileDialog.FileName.Length > 0)
            {
                // Save the contents of the RichTextBox into the file
                historyTextBox.SaveFile(saveFileDialog.FileName);
            }
        }

        private void saveToFile_list_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();

            saveFileDialog.DefaultExt = "*.rtf";
            saveFileDialog.Filter = "RTF Files|*.rtf";

            if (saveFileDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK && saveFileDialog.FileName.Length > 0)
            {
                // Save the contents of the RichTextBox into the file
                historyTextBox_list.SaveFile(saveFileDialog.FileName);
            }
        }
    }
}
