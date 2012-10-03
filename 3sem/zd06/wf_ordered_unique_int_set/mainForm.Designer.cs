namespace wf_ordered_unique_int_set
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.sizeOfSet = new System.Windows.Forms.NumericUpDown();
            this.createButton = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.pathToSave = new System.Windows.Forms.TextBox();
            this.saveToFileButton = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.pathToLoad = new System.Windows.Forms.TextBox();
            this.loadFromFileButton = new System.Windows.Forms.Button();
            this.tbToPrint = new System.Windows.Forms.RichTextBox();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.logger = new System.Windows.Forms.ToolStripStatusLabel();
            this.tbToPrint1 = new System.Windows.Forms.RichTextBox();
            this.loadFromFileButton1 = new System.Windows.Forms.Button();
            this.pathToLoad1 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.saveToFileButton1 = new System.Windows.Forms.Button();
            this.pathToSave1 = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.createButton1 = new System.Windows.Forms.Button();
            this.sizeOfSet1 = new System.Windows.Forms.NumericUpDown();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.tbIntersection = new System.Windows.Forms.RichTextBox();
            this.shapeContainer1 = new Microsoft.VisualBasic.PowerPacks.ShapeContainer();
            this.lineShape1 = new Microsoft.VisualBasic.PowerPacks.LineShape();
            this.getIntersectionButton = new System.Windows.Forms.Button();
            this.getUnionButton = new System.Windows.Forms.Button();
            this.tbUnion = new System.Windows.Forms.RichTextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sizeOfSet)).BeginInit();
            this.statusStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sizeOfSet1)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(646, 24);
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
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(13, 48);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(125, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Make Random Set_1";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(33, 76);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Set the size:";
            // 
            // sizeOfSet
            // 
            this.sizeOfSet.Location = new System.Drawing.Point(104, 74);
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
            this.sizeOfSet.TabIndex = 3;
            this.sizeOfSet.Value = new decimal(new int[] {
            10,
            0,
            0,
            0});
            // 
            // createButton
            // 
            this.createButton.Location = new System.Drawing.Point(230, 71);
            this.createButton.Name = "createButton";
            this.createButton.Size = new System.Drawing.Size(75, 23);
            this.createButton.TabIndex = 4;
            this.createButton.Text = "Create";
            this.createButton.UseVisualStyleBackColor = true;
            this.createButton.Click += new System.EventHandler(this.createButton_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(33, 105);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(63, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Save to file:";
            // 
            // pathToSave
            // 
            this.pathToSave.Location = new System.Drawing.Point(104, 102);
            this.pathToSave.Name = "pathToSave";
            this.pathToSave.Size = new System.Drawing.Size(120, 20);
            this.pathToSave.TabIndex = 6;
            // 
            // saveToFileButton
            // 
            this.saveToFileButton.Location = new System.Drawing.Point(230, 101);
            this.saveToFileButton.Name = "saveToFileButton";
            this.saveToFileButton.Size = new System.Drawing.Size(75, 23);
            this.saveToFileButton.TabIndex = 7;
            this.saveToFileButton.Text = "Save";
            this.saveToFileButton.UseVisualStyleBackColor = true;
            this.saveToFileButton.Click += new System.EventHandler(this.saveToFileButton_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(13, 140);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(127, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "Load Set_1 From File";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(33, 166);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 13);
            this.label5.TabIndex = 9;
            this.label5.Text = "Path to file:";
            // 
            // pathToLoad
            // 
            this.pathToLoad.Location = new System.Drawing.Point(104, 163);
            this.pathToLoad.Name = "pathToLoad";
            this.pathToLoad.Size = new System.Drawing.Size(120, 20);
            this.pathToLoad.TabIndex = 10;
            // 
            // loadFromFileButton
            // 
            this.loadFromFileButton.Location = new System.Drawing.Point(230, 161);
            this.loadFromFileButton.Name = "loadFromFileButton";
            this.loadFromFileButton.Size = new System.Drawing.Size(75, 23);
            this.loadFromFileButton.TabIndex = 11;
            this.loadFromFileButton.Text = "Load";
            this.loadFromFileButton.UseVisualStyleBackColor = true;
            this.loadFromFileButton.Click += new System.EventHandler(this.loadFromFileButton_Click);
            // 
            // tbToPrint
            // 
            this.tbToPrint.Location = new System.Drawing.Point(16, 205);
            this.tbToPrint.Name = "tbToPrint";
            this.tbToPrint.Size = new System.Drawing.Size(289, 77);
            this.tbToPrint.TabIndex = 12;
            this.tbToPrint.Text = "";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.logger});
            this.statusStrip1.Location = new System.Drawing.Point(0, 453);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(646, 22);
            this.statusStrip1.TabIndex = 13;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // logger
            // 
            this.logger.Name = "logger";
            this.logger.Size = new System.Drawing.Size(38, 17);
            this.logger.Text = "Done.";
            // 
            // tbToPrint1
            // 
            this.tbToPrint1.Location = new System.Drawing.Point(341, 205);
            this.tbToPrint1.Name = "tbToPrint1";
            this.tbToPrint1.Size = new System.Drawing.Size(289, 77);
            this.tbToPrint1.TabIndex = 25;
            this.tbToPrint1.Text = "";
            // 
            // loadFromFileButton1
            // 
            this.loadFromFileButton1.Location = new System.Drawing.Point(555, 161);
            this.loadFromFileButton1.Name = "loadFromFileButton1";
            this.loadFromFileButton1.Size = new System.Drawing.Size(75, 23);
            this.loadFromFileButton1.TabIndex = 24;
            this.loadFromFileButton1.Text = "Load";
            this.loadFromFileButton1.UseVisualStyleBackColor = true;
            this.loadFromFileButton1.Click += new System.EventHandler(this.loadFromFileButton1_Click);
            // 
            // pathToLoad1
            // 
            this.pathToLoad1.Location = new System.Drawing.Point(429, 163);
            this.pathToLoad1.Name = "pathToLoad1";
            this.pathToLoad1.Size = new System.Drawing.Size(120, 20);
            this.pathToLoad1.TabIndex = 23;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(358, 166);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(60, 13);
            this.label6.TabIndex = 22;
            this.label6.Text = "Path to file:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(338, 140);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(127, 13);
            this.label7.TabIndex = 21;
            this.label7.Text = "Load Set_2 From File";
            // 
            // saveToFileButton1
            // 
            this.saveToFileButton1.Location = new System.Drawing.Point(555, 101);
            this.saveToFileButton1.Name = "saveToFileButton1";
            this.saveToFileButton1.Size = new System.Drawing.Size(75, 23);
            this.saveToFileButton1.TabIndex = 20;
            this.saveToFileButton1.Text = "Save";
            this.saveToFileButton1.UseVisualStyleBackColor = true;
            // 
            // pathToSave1
            // 
            this.pathToSave1.Location = new System.Drawing.Point(429, 102);
            this.pathToSave1.Name = "pathToSave1";
            this.pathToSave1.Size = new System.Drawing.Size(120, 20);
            this.pathToSave1.TabIndex = 19;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(358, 105);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(63, 13);
            this.label8.TabIndex = 18;
            this.label8.Text = "Save to file:";
            // 
            // createButton1
            // 
            this.createButton1.Location = new System.Drawing.Point(555, 71);
            this.createButton1.Name = "createButton1";
            this.createButton1.Size = new System.Drawing.Size(75, 23);
            this.createButton1.TabIndex = 17;
            this.createButton1.Text = "Create";
            this.createButton1.UseVisualStyleBackColor = true;
            this.createButton1.Click += new System.EventHandler(this.createButton1_Click);
            // 
            // sizeOfSet1
            // 
            this.sizeOfSet1.Location = new System.Drawing.Point(429, 74);
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
            this.sizeOfSet1.TabIndex = 16;
            this.sizeOfSet1.Value = new decimal(new int[] {
            10,
            0,
            0,
            0});
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(358, 76);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(65, 13);
            this.label9.TabIndex = 15;
            this.label9.Text = "Set the size:";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(338, 48);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(125, 13);
            this.label10.TabIndex = 14;
            this.label10.Text = "Make Random Set_2";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(13, 314);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(148, 13);
            this.label11.TabIndex = 26;
            this.label11.Text = "Intersection Of Two Sets";
            // 
            // tbIntersection
            // 
            this.tbIntersection.Location = new System.Drawing.Point(16, 330);
            this.tbIntersection.Name = "tbIntersection";
            this.tbIntersection.Size = new System.Drawing.Size(289, 77);
            this.tbIntersection.TabIndex = 27;
            this.tbIntersection.Text = "";
            // 
            // shapeContainer1
            // 
            this.shapeContainer1.Location = new System.Drawing.Point(0, 0);
            this.shapeContainer1.Margin = new System.Windows.Forms.Padding(0);
            this.shapeContainer1.Name = "shapeContainer1";
            this.shapeContainer1.Shapes.AddRange(new Microsoft.VisualBasic.PowerPacks.Shape[] {
            this.lineShape1});
            this.shapeContainer1.Size = new System.Drawing.Size(646, 475);
            this.shapeContainer1.TabIndex = 28;
            this.shapeContainer1.TabStop = false;
            // 
            // lineShape1
            // 
            this.lineShape1.Name = "lineShape1";
            this.lineShape1.X1 = 18;
            this.lineShape1.X2 = 620;
            this.lineShape1.Y1 = 300;
            this.lineShape1.Y2 = 300;
            // 
            // getIntersectionButton
            // 
            this.getIntersectionButton.Location = new System.Drawing.Point(230, 413);
            this.getIntersectionButton.Name = "getIntersectionButton";
            this.getIntersectionButton.Size = new System.Drawing.Size(75, 23);
            this.getIntersectionButton.TabIndex = 29;
            this.getIntersectionButton.Text = "Go";
            this.getIntersectionButton.UseVisualStyleBackColor = true;
            this.getIntersectionButton.Click += new System.EventHandler(this.getIntersectionButton_Click);
            // 
            // getUnionButton
            // 
            this.getUnionButton.Location = new System.Drawing.Point(555, 413);
            this.getUnionButton.Name = "getUnionButton";
            this.getUnionButton.Size = new System.Drawing.Size(75, 23);
            this.getUnionButton.TabIndex = 32;
            this.getUnionButton.Text = "Go";
            this.getUnionButton.UseVisualStyleBackColor = true;
            this.getUnionButton.Click += new System.EventHandler(this.getUnionButton_Click);
            // 
            // tbUnion
            // 
            this.tbUnion.Location = new System.Drawing.Point(341, 330);
            this.tbUnion.Name = "tbUnion";
            this.tbUnion.Size = new System.Drawing.Size(289, 77);
            this.tbUnion.TabIndex = 31;
            this.tbUnion.Text = "";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(338, 314);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(114, 13);
            this.label12.TabIndex = 30;
            this.label12.Text = "Union Of Two Sets";
            // 
            // mainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(646, 475);
            this.Controls.Add(this.getUnionButton);
            this.Controls.Add(this.tbUnion);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.getIntersectionButton);
            this.Controls.Add(this.tbIntersection);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.tbToPrint1);
            this.Controls.Add(this.loadFromFileButton1);
            this.Controls.Add(this.pathToLoad1);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.saveToFileButton1);
            this.Controls.Add(this.pathToSave1);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.createButton1);
            this.Controls.Add(this.sizeOfSet1);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.tbToPrint);
            this.Controls.Add(this.loadFromFileButton);
            this.Controls.Add(this.pathToLoad);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.saveToFileButton);
            this.Controls.Add(this.pathToSave);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.createButton);
            this.Controls.Add(this.sizeOfSet);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.shapeContainer1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "mainForm";
            this.Text = "Test Aplpication";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sizeOfSet)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sizeOfSet1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown sizeOfSet;
        private System.Windows.Forms.Button createButton;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox pathToSave;
        private System.Windows.Forms.Button saveToFileButton;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox pathToLoad;
        private System.Windows.Forms.Button loadFromFileButton;
        private System.Windows.Forms.RichTextBox tbToPrint;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel logger;
        private System.Windows.Forms.RichTextBox tbToPrint1;
        private System.Windows.Forms.Button loadFromFileButton1;
        private System.Windows.Forms.TextBox pathToLoad1;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button saveToFileButton1;
        private System.Windows.Forms.TextBox pathToSave1;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button createButton1;
        private System.Windows.Forms.NumericUpDown sizeOfSet1;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.RichTextBox tbIntersection;
        private Microsoft.VisualBasic.PowerPacks.ShapeContainer shapeContainer1;
        private Microsoft.VisualBasic.PowerPacks.LineShape lineShape1;
        private System.Windows.Forms.Button getIntersectionButton;
        private System.Windows.Forms.Button getUnionButton;
        private System.Windows.Forms.RichTextBox tbUnion;
        private System.Windows.Forms.Label label12;
    }
}

