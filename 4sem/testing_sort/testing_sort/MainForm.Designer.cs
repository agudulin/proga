namespace testing_sort
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.tabControl = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.saveToFile = new System.Windows.Forms.Button();
            this.clearHistoryButton = new System.Windows.Forms.Button();
            this.historyTextBox = new System.Windows.Forms.RichTextBox();
            this.submitButton = new System.Windows.Forms.Button();
            this.sortingTypesList = new System.Windows.Forms.ListBox();
            this.arrayNameToChooseTextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.saveToFile_list = new System.Windows.Forms.Button();
            this.clearHistoryButton_list = new System.Windows.Forms.Button();
            this.historyTextBox_list = new System.Windows.Forms.RichTextBox();
            this.submitButton_list = new System.Windows.Forms.Button();
            this.sortingTypesList_list = new System.Windows.Forms.ListBox();
            this.chooseButton_list = new System.Windows.Forms.Button();
            this.arrayNameToChooseTextBox_list = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.aboutMenuButton = new System.Windows.Forms.ToolStripButton();
            this.chooseButton = new System.Windows.Forms.Button();
            this.tabControl.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl
            // 
            this.tabControl.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControl.Controls.Add(this.tabPage1);
            this.tabControl.Controls.Add(this.tabPage2);
            this.tabControl.Location = new System.Drawing.Point(12, 28);
            this.tabControl.Name = "tabControl";
            this.tabControl.SelectedIndex = 0;
            this.tabControl.Size = new System.Drawing.Size(600, 386);
            this.tabControl.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.chooseButton);
            this.tabPage1.Controls.Add(this.saveToFile);
            this.tabPage1.Controls.Add(this.clearHistoryButton);
            this.tabPage1.Controls.Add(this.historyTextBox);
            this.tabPage1.Controls.Add(this.submitButton);
            this.tabPage1.Controls.Add(this.sortingTypesList);
            this.tabPage1.Controls.Add(this.arrayNameToChooseTextBox);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(592, 360);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "int[]";
            this.tabPage1.UseVisualStyleBackColor = true;
            this.tabPage1.Click += new System.EventHandler(this.tabPage1_Click);
            // 
            // saveToFile
            // 
            this.saveToFile.Enabled = false;
            this.saveToFile.Location = new System.Drawing.Point(500, 125);
            this.saveToFile.Name = "saveToFile";
            this.saveToFile.Size = new System.Drawing.Size(86, 23);
            this.saveToFile.TabIndex = 8;
            this.saveToFile.Text = "Сохранить...";
            this.saveToFile.UseVisualStyleBackColor = true;
            this.saveToFile.Click += new System.EventHandler(this.saveToFile_Click);
            // 
            // clearHistoryButton
            // 
            this.clearHistoryButton.Enabled = false;
            this.clearHistoryButton.Location = new System.Drawing.Point(383, 125);
            this.clearHistoryButton.Name = "clearHistoryButton";
            this.clearHistoryButton.Size = new System.Drawing.Size(111, 23);
            this.clearHistoryButton.TabIndex = 7;
            this.clearHistoryButton.Text = "Очистить историю";
            this.clearHistoryButton.UseVisualStyleBackColor = true;
            this.clearHistoryButton.Click += new System.EventHandler(this.clearHistoryButton_Click);
            // 
            // historyTextBox
            // 
            this.historyTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.historyTextBox.Location = new System.Drawing.Point(6, 154);
            this.historyTextBox.Name = "historyTextBox";
            this.historyTextBox.ReadOnly = true;
            this.historyTextBox.Size = new System.Drawing.Size(580, 200);
            this.historyTextBox.TabIndex = 6;
            this.historyTextBox.Text = "";
            // 
            // submitButton
            // 
            this.submitButton.Enabled = false;
            this.submitButton.Location = new System.Drawing.Point(299, 71);
            this.submitButton.Name = "submitButton";
            this.submitButton.Size = new System.Drawing.Size(86, 23);
            this.submitButton.TabIndex = 5;
            this.submitButton.Text = "Сортировать!";
            this.submitButton.UseVisualStyleBackColor = true;
            this.submitButton.Click += new System.EventHandler(this.submitButton_Click);
            // 
            // sortingTypesList
            // 
            this.sortingTypesList.FormattingEnabled = true;
            this.sortingTypesList.Items.AddRange(new object[] {
            "QuickSort",
            "ShellSort"});
            this.sortingTypesList.Location = new System.Drawing.Point(143, 64);
            this.sortingTypesList.Name = "sortingTypesList";
            this.sortingTypesList.Size = new System.Drawing.Size(150, 30);
            this.sortingTypesList.TabIndex = 4;
            // 
            // arrayNameToChooseTextBox
            // 
            this.arrayNameToChooseTextBox.Enabled = false;
            this.arrayNameToChooseTextBox.Location = new System.Drawing.Point(143, 28);
            this.arrayNameToChooseTextBox.Name = "arrayNameToChooseTextBox";
            this.arrayNameToChooseTextBox.Size = new System.Drawing.Size(150, 20);
            this.arrayNameToChooseTextBox.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 64);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(91, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Тип сортировки:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(120, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Выберите множество:";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.saveToFile_list);
            this.tabPage2.Controls.Add(this.clearHistoryButton_list);
            this.tabPage2.Controls.Add(this.historyTextBox_list);
            this.tabPage2.Controls.Add(this.submitButton_list);
            this.tabPage2.Controls.Add(this.sortingTypesList_list);
            this.tabPage2.Controls.Add(this.chooseButton_list);
            this.tabPage2.Controls.Add(this.arrayNameToChooseTextBox_list);
            this.tabPage2.Controls.Add(this.label3);
            this.tabPage2.Controls.Add(this.label4);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(592, 360);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "ArrayList";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // saveToFile_list
            // 
            this.saveToFile_list.Enabled = false;
            this.saveToFile_list.Location = new System.Drawing.Point(500, 125);
            this.saveToFile_list.Name = "saveToFile_list";
            this.saveToFile_list.Size = new System.Drawing.Size(86, 23);
            this.saveToFile_list.TabIndex = 16;
            this.saveToFile_list.Text = "Сохранить...";
            this.saveToFile_list.UseVisualStyleBackColor = true;
            this.saveToFile_list.Click += new System.EventHandler(this.saveToFile_list_Click);
            // 
            // clearHistoryButton_list
            // 
            this.clearHistoryButton_list.Enabled = false;
            this.clearHistoryButton_list.Location = new System.Drawing.Point(383, 125);
            this.clearHistoryButton_list.Name = "clearHistoryButton_list";
            this.clearHistoryButton_list.Size = new System.Drawing.Size(111, 23);
            this.clearHistoryButton_list.TabIndex = 15;
            this.clearHistoryButton_list.Text = "Очистить историю";
            this.clearHistoryButton_list.UseVisualStyleBackColor = true;
            this.clearHistoryButton_list.Click += new System.EventHandler(this.clearHistoryButton_list_Click);
            // 
            // historyTextBox_list
            // 
            this.historyTextBox_list.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.historyTextBox_list.Location = new System.Drawing.Point(6, 154);
            this.historyTextBox_list.Name = "historyTextBox_list";
            this.historyTextBox_list.ReadOnly = true;
            this.historyTextBox_list.Size = new System.Drawing.Size(580, 200);
            this.historyTextBox_list.TabIndex = 14;
            this.historyTextBox_list.Text = "";
            // 
            // submitButton_list
            // 
            this.submitButton_list.Enabled = false;
            this.submitButton_list.Location = new System.Drawing.Point(299, 84);
            this.submitButton_list.Name = "submitButton_list";
            this.submitButton_list.Size = new System.Drawing.Size(86, 23);
            this.submitButton_list.TabIndex = 13;
            this.submitButton_list.Text = "Сортировать!";
            this.submitButton_list.UseVisualStyleBackColor = true;
            this.submitButton_list.Click += new System.EventHandler(this.submitButton_list_Click);
            // 
            // sortingTypesList_list
            // 
            this.sortingTypesList_list.FormattingEnabled = true;
            this.sortingTypesList_list.Items.AddRange(new object[] {
            "QuickSort",
            "ShellSort",
            "ArrayList.Sort"});
            this.sortingTypesList_list.Location = new System.Drawing.Point(143, 64);
            this.sortingTypesList_list.Name = "sortingTypesList_list";
            this.sortingTypesList_list.Size = new System.Drawing.Size(150, 43);
            this.sortingTypesList_list.TabIndex = 12;
            // 
            // chooseButton_list
            // 
            this.chooseButton_list.Location = new System.Drawing.Point(299, 26);
            this.chooseButton_list.Name = "chooseButton_list";
            this.chooseButton_list.Size = new System.Drawing.Size(86, 23);
            this.chooseButton_list.TabIndex = 11;
            this.chooseButton_list.Text = "Выбрать...";
            this.chooseButton_list.UseVisualStyleBackColor = true;
            this.chooseButton_list.Click += new System.EventHandler(this.chooseButton_list_Click);
            // 
            // arrayNameToChooseTextBox_list
            // 
            this.arrayNameToChooseTextBox_list.Enabled = false;
            this.arrayNameToChooseTextBox_list.Location = new System.Drawing.Point(143, 28);
            this.arrayNameToChooseTextBox_list.Name = "arrayNameToChooseTextBox_list";
            this.arrayNameToChooseTextBox_list.Size = new System.Drawing.Size(150, 20);
            this.arrayNameToChooseTextBox_list.TabIndex = 10;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 64);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(91, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Тип сортировки:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 28);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(120, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "Выберите множество:";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Location = new System.Drawing.Point(0, 431);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(624, 22);
            this.statusStrip1.TabIndex = 1;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutMenuButton});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(624, 25);
            this.toolStrip1.TabIndex = 2;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // aboutMenuButton
            // 
            this.aboutMenuButton.Image = ((System.Drawing.Image)(resources.GetObject("aboutMenuButton.Image")));
            this.aboutMenuButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.aboutMenuButton.Name = "aboutMenuButton";
            this.aboutMenuButton.Size = new System.Drawing.Size(102, 22);
            this.aboutMenuButton.Text = "О программе";
            this.aboutMenuButton.Click += new System.EventHandler(this.aboutMenuButton_Click);
            // 
            // chooseButton
            // 
            this.chooseButton.Location = new System.Drawing.Point(299, 26);
            this.chooseButton.Name = "chooseButton";
            this.chooseButton.Size = new System.Drawing.Size(86, 23);
            this.chooseButton.TabIndex = 12;
            this.chooseButton.Text = "Выбрать...";
            this.chooseButton.UseVisualStyleBackColor = true;
            this.chooseButton.Click += new System.EventHandler(this.chooseButton_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(624, 453);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.tabControl);
            this.MinimumSize = new System.Drawing.Size(640, 480);
            this.Name = "MainForm";
            this.Text = "Тестирование Сортировок";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.tabControl.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton aboutMenuButton;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox sortingTypesList;
        private System.Windows.Forms.TextBox arrayNameToChooseTextBox;
        private System.Windows.Forms.Button submitButton;
        private System.Windows.Forms.RichTextBox historyTextBox;
        private System.Windows.Forms.Button clearHistoryButton;
        private System.Windows.Forms.Button clearHistoryButton_list;
        private System.Windows.Forms.RichTextBox historyTextBox_list;
        private System.Windows.Forms.Button submitButton_list;
        private System.Windows.Forms.ListBox sortingTypesList_list;
        private System.Windows.Forms.Button chooseButton_list;
        private System.Windows.Forms.TextBox arrayNameToChooseTextBox_list;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button saveToFile;
        private System.Windows.Forms.Button saveToFile_list;
        private System.Windows.Forms.Button chooseButton;
    }
}

