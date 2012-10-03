namespace ordered_unique_int_set
{
    partial class mainForm
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.label7 = new System.Windows.Forms.Label();
            this.sizeOfSet = new System.Windows.Forms.NumericUpDown();
            this.sizeOfSet1 = new System.Windows.Forms.NumericUpDown();
            this.label8 = new System.Windows.Forms.Label();
            this.createButton = new System.Windows.Forms.Button();
            this.createButton1 = new System.Windows.Forms.Button();
            this.label9 = new System.Windows.Forms.Label();
            this.pathToSave = new System.Windows.Forms.TextBox();
            this.saveToFileButton = new System.Windows.Forms.Button();
            this.loadFromFileButton = new System.Windows.Forms.Button();
            this.pathToLoad = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.tbToPrint = new System.Windows.Forms.RichTextBox();
            this.tbIntersection = new System.Windows.Forms.RichTextBox();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.logger = new System.Windows.Forms.ToolStripStatusLabel();
            this.tbToPrint1 = new System.Windows.Forms.RichTextBox();
            this.saveToFileButton1 = new System.Windows.Forms.Button();
            this.pathToSave1 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.loadFromFileButton1 = new System.Windows.Forms.Button();
            this.pathToLoad1 = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.getIntersectionButton = new System.Windows.Forms.Button();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.getUnionButton = new System.Windows.Forms.Button();
            this.tbUnion = new System.Windows.Forms.RichTextBox();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sizeOfSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sizeOfSet1)).BeginInit();
            this.statusStrip1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(660, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(52, 20);
            this.aboutToolStripMenuItem.Text = "About";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(65, 26);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(30, 13);
            this.label7.TabIndex = 7;
            this.label7.Text = "Size:";
            // 
            // sizeOfSet
            // 
            this.sizeOfSet.Location = new System.Drawing.Point(99, 24);
            this.sizeOfSet.Maximum = new decimal(new int[] {
            200000,
            0,
            0,
            0});
            this.sizeOfSet.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.sizeOfSet.Name = "sizeOfSet";
            this.sizeOfSet.Size = new System.Drawing.Size(120, 20);
            this.sizeOfSet.TabIndex = 9;
            this.sizeOfSet.Value = new decimal(new int[] {
            10,
            0,
            0,
            0});
            // 
            // sizeOfSet1
            // 
            this.sizeOfSet1.Location = new System.Drawing.Point(99, 20);
            this.sizeOfSet1.Maximum = new decimal(new int[] {
            200000,
            0,
            0,
            0});
            this.sizeOfSet1.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.sizeOfSet1.Name = "sizeOfSet1";
            this.sizeOfSet1.Size = new System.Drawing.Size(120, 20);
            this.sizeOfSet1.TabIndex = 10;
            this.sizeOfSet1.Value = new decimal(new int[] {
            10,
            0,
            0,
            0});
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(63, 22);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(30, 13);
            this.label8.TabIndex = 11;
            this.label8.Text = "Size:";
            // 
            // createButton
            // 
            this.createButton.Location = new System.Drawing.Point(225, 22);
            this.createButton.Name = "createButton";
            this.createButton.Size = new System.Drawing.Size(75, 23);
            this.createButton.TabIndex = 12;
            this.createButton.Text = "Create";
            this.createButton.UseVisualStyleBackColor = true;
            this.createButton.Click += new System.EventHandler(this.createButton_Click);
            // 
            // createButton1
            // 
            this.createButton1.Location = new System.Drawing.Point(225, 17);
            this.createButton1.Name = "createButton1";
            this.createButton1.Size = new System.Drawing.Size(75, 23);
            this.createButton1.TabIndex = 13;
            this.createButton1.Text = "Create";
            this.createButton1.UseVisualStyleBackColor = true;
            this.createButton1.Click += new System.EventHandler(this.createButton1_Click);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(27, 57);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(70, 13);
            this.label9.TabIndex = 14;
            this.label9.Text = "Save To File:";
            // 
            // pathToSave
            // 
            this.pathToSave.Location = new System.Drawing.Point(99, 54);
            this.pathToSave.Name = "pathToSave";
            this.pathToSave.Size = new System.Drawing.Size(120, 20);
            this.pathToSave.TabIndex = 15;
            // 
            // saveToFileButton
            // 
            this.saveToFileButton.Location = new System.Drawing.Point(225, 52);
            this.saveToFileButton.Name = "saveToFileButton";
            this.saveToFileButton.Size = new System.Drawing.Size(75, 23);
            this.saveToFileButton.TabIndex = 16;
            this.saveToFileButton.Text = "Save";
            this.saveToFileButton.UseVisualStyleBackColor = true;
            this.saveToFileButton.Click += new System.EventHandler(this.saveToFileButton_Click);
            // 
            // loadFromFileButton
            // 
            this.loadFromFileButton.Location = new System.Drawing.Point(225, 19);
            this.loadFromFileButton.Name = "loadFromFileButton";
            this.loadFromFileButton.Size = new System.Drawing.Size(75, 23);
            this.loadFromFileButton.TabIndex = 19;
            this.loadFromFileButton.Text = "Load";
            this.loadFromFileButton.UseVisualStyleBackColor = true;
            this.loadFromFileButton.Click += new System.EventHandler(this.loadFromFileButton_Click);
            // 
            // pathToLoad
            // 
            this.pathToLoad.Location = new System.Drawing.Point(99, 21);
            this.pathToLoad.Name = "pathToLoad";
            this.pathToLoad.Size = new System.Drawing.Size(120, 20);
            this.pathToLoad.TabIndex = 18;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(44, 24);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(51, 13);
            this.label10.TabIndex = 17;
            this.label10.Text = "File Path:";
            // 
            // tbToPrint
            // 
            this.tbToPrint.Location = new System.Drawing.Point(16, 221);
            this.tbToPrint.Name = "tbToPrint";
            this.tbToPrint.Size = new System.Drawing.Size(309, 48);
            this.tbToPrint.TabIndex = 20;
            this.tbToPrint.Text = "";
            // 
            // tbIntersection
            // 
            this.tbIntersection.Location = new System.Drawing.Point(6, 19);
            this.tbIntersection.Name = "tbIntersection";
            this.tbIntersection.Size = new System.Drawing.Size(294, 76);
            this.tbIntersection.TabIndex = 21;
            this.tbIntersection.Text = "";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.logger});
            this.statusStrip1.Location = new System.Drawing.Point(0, 447);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(660, 22);
            this.statusStrip1.TabIndex = 24;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // logger
            // 
            this.logger.Name = "logger";
            this.logger.Size = new System.Drawing.Size(121, 17);
            this.logger.Text = "Application is loaded.";
            // 
            // tbToPrint1
            // 
            this.tbToPrint1.Location = new System.Drawing.Point(336, 221);
            this.tbToPrint1.Name = "tbToPrint1";
            this.tbToPrint1.Size = new System.Drawing.Size(309, 48);
            this.tbToPrint1.TabIndex = 25;
            this.tbToPrint1.Text = "";
            // 
            // saveToFileButton1
            // 
            this.saveToFileButton1.Location = new System.Drawing.Point(225, 48);
            this.saveToFileButton1.Name = "saveToFileButton1";
            this.saveToFileButton1.Size = new System.Drawing.Size(75, 23);
            this.saveToFileButton1.TabIndex = 28;
            this.saveToFileButton1.Text = "Save";
            this.saveToFileButton1.UseVisualStyleBackColor = true;
            this.saveToFileButton1.Click += new System.EventHandler(this.saveToFileButton1_Click);
            // 
            // pathToSave1
            // 
            this.pathToSave1.Location = new System.Drawing.Point(99, 50);
            this.pathToSave1.Name = "pathToSave1";
            this.pathToSave1.Size = new System.Drawing.Size(120, 20);
            this.pathToSave1.TabIndex = 27;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(27, 53);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(70, 13);
            this.label6.TabIndex = 26;
            this.label6.Text = "Save To File:";
            // 
            // loadFromFileButton1
            // 
            this.loadFromFileButton1.Location = new System.Drawing.Point(223, 19);
            this.loadFromFileButton1.Name = "loadFromFileButton1";
            this.loadFromFileButton1.Size = new System.Drawing.Size(75, 23);
            this.loadFromFileButton1.TabIndex = 32;
            this.loadFromFileButton1.Text = "Load";
            this.loadFromFileButton1.UseVisualStyleBackColor = true;
            this.loadFromFileButton1.Click += new System.EventHandler(this.loadFromFileButton1_Click);
            // 
            // pathToLoad1
            // 
            this.pathToLoad1.Location = new System.Drawing.Point(97, 21);
            this.pathToLoad1.Name = "pathToLoad1";
            this.pathToLoad1.Size = new System.Drawing.Size(120, 20);
            this.pathToLoad1.TabIndex = 31;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(42, 24);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(51, 13);
            this.label11.TabIndex = 30;
            this.label11.Text = "File Path:";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.createButton);
            this.groupBox1.Controls.Add(this.pathToSave);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.sizeOfSet);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.saveToFileButton);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox1.Location = new System.Drawing.Point(16, 43);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(309, 87);
            this.groupBox1.TabIndex = 33;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Get Set_1 From Random Array";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.loadFromFileButton);
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.pathToLoad);
            this.groupBox2.Location = new System.Drawing.Point(16, 145);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(309, 65);
            this.groupBox2.TabIndex = 34;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Load Set_1 From File";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.loadFromFileButton1);
            this.groupBox3.Controls.Add(this.label11);
            this.groupBox3.Controls.Add(this.pathToLoad1);
            this.groupBox3.Location = new System.Drawing.Point(336, 145);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(309, 65);
            this.groupBox3.TabIndex = 35;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Load Set_2 From File";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.label6);
            this.groupBox4.Controls.Add(this.sizeOfSet1);
            this.groupBox4.Controls.Add(this.label8);
            this.groupBox4.Controls.Add(this.saveToFileButton1);
            this.groupBox4.Controls.Add(this.createButton1);
            this.groupBox4.Controls.Add(this.pathToSave1);
            this.groupBox4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox4.Location = new System.Drawing.Point(336, 43);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(309, 87);
            this.groupBox4.TabIndex = 34;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Get Set_2 From Random Array";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.getIntersectionButton);
            this.groupBox5.Controls.Add(this.tbIntersection);
            this.groupBox5.Location = new System.Drawing.Point(16, 299);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(309, 134);
            this.groupBox5.TabIndex = 36;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Intersection Of Two Sets";
            // 
            // getIntersectionButton
            // 
            this.getIntersectionButton.Location = new System.Drawing.Point(225, 101);
            this.getIntersectionButton.Name = "getIntersectionButton";
            this.getIntersectionButton.Size = new System.Drawing.Size(75, 23);
            this.getIntersectionButton.TabIndex = 22;
            this.getIntersectionButton.Text = "Go";
            this.getIntersectionButton.UseVisualStyleBackColor = true;
            this.getIntersectionButton.Click += new System.EventHandler(this.getIntersectionButton_Click);
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.getUnionButton);
            this.groupBox6.Controls.Add(this.tbUnion);
            this.groupBox6.Location = new System.Drawing.Point(336, 299);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(309, 134);
            this.groupBox6.TabIndex = 37;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Union Of Two Sets";
            // 
            // getUnionButton
            // 
            this.getUnionButton.Location = new System.Drawing.Point(225, 101);
            this.getUnionButton.Name = "getUnionButton";
            this.getUnionButton.Size = new System.Drawing.Size(75, 23);
            this.getUnionButton.TabIndex = 22;
            this.getUnionButton.Text = "Go";
            this.getUnionButton.UseVisualStyleBackColor = true;
            this.getUnionButton.Click += new System.EventHandler(this.getUnionButton_Click);
            // 
            // tbUnion
            // 
            this.tbUnion.Location = new System.Drawing.Point(6, 19);
            this.tbUnion.Name = "tbUnion";
            this.tbUnion.Size = new System.Drawing.Size(294, 76);
            this.tbUnion.TabIndex = 21;
            this.tbUnion.Text = "";
            // 
            // mainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(660, 469);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.tbToPrint1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.tbToPrint);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "mainForm";
            this.Text = "OrderedIntegersSet Class Test Application";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sizeOfSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sizeOfSet1)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox6.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.NumericUpDown sizeOfSet;
        private System.Windows.Forms.NumericUpDown sizeOfSet1;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button createButton;
        private System.Windows.Forms.Button createButton1;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox pathToSave;
        private System.Windows.Forms.Button saveToFileButton;
        private System.Windows.Forms.Button loadFromFileButton;
        private System.Windows.Forms.TextBox pathToLoad;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.RichTextBox tbToPrint;
        private System.Windows.Forms.RichTextBox tbIntersection;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel logger;
        private System.Windows.Forms.RichTextBox tbToPrint1;
        private System.Windows.Forms.Button saveToFileButton1;
        private System.Windows.Forms.TextBox pathToSave1;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button loadFromFileButton1;
        private System.Windows.Forms.TextBox pathToLoad1;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Button getIntersectionButton;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.Button getUnionButton;
        private System.Windows.Forms.RichTextBox tbUnion;
    }
}

