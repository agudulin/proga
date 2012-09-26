namespace wf_gcd_ga
{
    partial class main_wf
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
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.tb_inputM = new System.Windows.Forms.TextBox();
            this.tb_inputN = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_getGcd = new System.Windows.Forms.Button();
            this.tb_gcd = new System.Windows.Forms.TextBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(26, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "m = ";
            // 
            // tb_inputM
            // 
            this.tb_inputM.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tb_inputM.Location = new System.Drawing.Point(61, 26);
            this.tb_inputM.Name = "tb_inputM";
            this.tb_inputM.Size = new System.Drawing.Size(100, 20);
            this.tb_inputM.TabIndex = 1;
            this.tb_inputM.TextChanged += new System.EventHandler(this.tb_inputM_TextChanged);
            // 
            // tb_inputN
            // 
            this.tb_inputN.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tb_inputN.Location = new System.Drawing.Point(61, 52);
            this.tb_inputN.Name = "tb_inputN";
            this.tb_inputN.Size = new System.Drawing.Size(100, 20);
            this.tb_inputN.TabIndex = 3;
            this.tb_inputN.TextChanged += new System.EventHandler(this.tb_inputN_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(26, 55);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(27, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "n = ";
            // 
            // btn_getGcd
            // 
            this.btn_getGcd.Location = new System.Drawing.Point(167, 102);
            this.btn_getGcd.Name = "btn_getGcd";
            this.btn_getGcd.Size = new System.Drawing.Size(75, 23);
            this.btn_getGcd.TabIndex = 5;
            this.btn_getGcd.Text = "Найти НОД";
            this.toolTip1.SetToolTip(this.btn_getGcd, "Нажми для вычисления НОД");
            this.btn_getGcd.UseVisualStyleBackColor = true;
            this.btn_getGcd.Click += new System.EventHandler(this.btn_getGcd_Click);
            // 
            // tb_gcd
            // 
            this.tb_gcd.Location = new System.Drawing.Point(61, 102);
            this.tb_gcd.Name = "tb_gcd";
            this.tb_gcd.ReadOnly = true;
            this.tb_gcd.Size = new System.Drawing.Size(100, 20);
            this.tb_gcd.TabIndex = 6;
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(256, 24);
            this.menuStrip1.TabIndex = 7;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(52, 20);
            this.aboutToolStripMenuItem.Text = "About";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click_1);
            // 
            // main_wf
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(256, 154);
            this.Controls.Add(this.tb_gcd);
            this.Controls.Add(this.btn_getGcd);
            this.Controls.Add(this.tb_inputN);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tb_inputM);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.menuStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "main_wf";
            this.Text = "Наибольший общий делитель";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tb_inputM;
        private System.Windows.Forms.TextBox tb_inputN;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_getGcd;
        private System.Windows.Forms.TextBox tb_gcd;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
    }
}

