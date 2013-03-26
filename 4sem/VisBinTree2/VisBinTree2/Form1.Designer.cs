namespace VisBinTree2 {
  partial class Form1 {
    /// <summary>
    /// Требуется переменная конструктора.
    /// </summary>
    private System.ComponentModel.IContainer components=null;

    /// <summary>
    /// Освободить все используемые ресурсы.
    /// </summary>
    /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
    protected override void Dispose(bool disposing) {
      if(disposing&&(components!=null)) {
        components.Dispose();
      }
      base.Dispose(disposing);
    }

    #region Код, автоматически созданный конструктором форм Windows

    /// <summary>
    /// Обязательный метод для поддержки конструктора - не изменяйте
    /// содержимое данного метода при помощи редактора кода.
    /// </summary>
    private void InitializeComponent() {
        this.panel1 = new System.Windows.Forms.Panel();
        this.label1 = new System.Windows.Forms.Label();
        this.textBox1 = new System.Windows.Forms.TextBox();
        this.button1 = new System.Windows.Forms.Button();
        this.textBox2 = new System.Windows.Forms.TextBox();
        this.menuStrip1 = new System.Windows.Forms.MenuStrip();
        this.оПрограммеToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
        this.button2 = new System.Windows.Forms.Button();
        this.textBox3 = new System.Windows.Forms.TextBox();
        this.checkBox1 = new System.Windows.Forms.CheckBox();
        this.menuStrip1.SuspendLayout();
        this.SuspendLayout();
        // 
        // panel1
        // 
        this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                    | System.Windows.Forms.AnchorStyles.Left)
                    | System.Windows.Forms.AnchorStyles.Right)));
        this.panel1.BackColor = System.Drawing.Color.White;
        this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
        this.panel1.Location = new System.Drawing.Point(191, 24);
        this.panel1.Name = "panel1";
        this.panel1.Size = new System.Drawing.Size(427, 323);
        this.panel1.TabIndex = 0;
        this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint);
        this.panel1.DoubleClick += new System.EventHandler(this.mainFormDoubleClick);
        // 
        // label1
        // 
        this.label1.AutoSize = true;
        this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
        this.label1.ForeColor = System.Drawing.Color.Blue;
        this.label1.Location = new System.Drawing.Point(9, 54);
        this.label1.Name = "label1";
        this.label1.Size = new System.Drawing.Size(129, 20);
        this.label1.TabIndex = 1;
        this.label1.Text = "Новый элемент";
        // 
        // textBox1
        // 
        this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
        this.textBox1.Location = new System.Drawing.Point(144, 49);
        this.textBox1.Name = "textBox1";
        this.textBox1.Size = new System.Drawing.Size(39, 29);
        this.textBox1.TabIndex = 2;
        this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
        this.textBox1.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.newNumberTextBoxKey);
        // 
        // button1
        // 
        this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
        this.button1.ForeColor = System.Drawing.Color.Maroon;
        this.button1.Location = new System.Drawing.Point(8, 85);
        this.button1.Name = "button1";
        this.button1.Size = new System.Drawing.Size(175, 51);
        this.button1.TabIndex = 3;
        this.button1.Text = "Добавить новый элемент (от 1 по 99)";
        this.button1.UseVisualStyleBackColor = true;
        this.button1.Click += new System.EventHandler(this.button1_Click);
        // 
        // textBox2
        // 
        this.textBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
        this.textBox2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
        this.textBox2.Location = new System.Drawing.Point(8, 203);
        this.textBox2.Multiline = true;
        this.textBox2.Name = "textBox2";
        this.textBox2.ReadOnly = true;
        this.textBox2.Size = new System.Drawing.Size(175, 83);
        this.textBox2.TabIndex = 4;
        // 
        // menuStrip1
        // 
        this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.оПрограммеToolStripMenuItem});
        this.menuStrip1.Location = new System.Drawing.Point(0, 0);
        this.menuStrip1.Name = "menuStrip1";
        this.menuStrip1.Size = new System.Drawing.Size(624, 24);
        this.menuStrip1.TabIndex = 5;
        this.menuStrip1.Text = "menuStrip1";
        // 
        // оПрограммеToolStripMenuItem
        // 
        this.оПрограммеToolStripMenuItem.Name = "оПрограммеToolStripMenuItem";
        this.оПрограммеToolStripMenuItem.Size = new System.Drawing.Size(94, 20);
        this.оПрограммеToolStripMenuItem.Text = "О программе";
        this.оПрограммеToolStripMenuItem.Click += new System.EventHandler(this.оПрограммеToolStripMenuItem_Click);
        // 
        // button2
        // 
        this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
        this.button2.ForeColor = System.Drawing.Color.Maroon;
        this.button2.Location = new System.Drawing.Point(8, 142);
        this.button2.Name = "button2";
        this.button2.Size = new System.Drawing.Size(112, 51);
        this.button2.TabIndex = 8;
        this.button2.Text = "Удалить элемент";
        this.button2.UseVisualStyleBackColor = true;
        this.button2.Click += new System.EventHandler(this.button2_Click);
        // 
        // textBox3
        // 
        this.textBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
        this.textBox3.Location = new System.Drawing.Point(131, 151);
        this.textBox3.Name = "textBox3";
        this.textBox3.Size = new System.Drawing.Size(39, 29);
        this.textBox3.TabIndex = 9;
        this.textBox3.TextChanged += new System.EventHandler(this.textBox3_TextChanged);
        this.textBox3.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.delNumberTextBoxKey);
        // 
        // checkBox1
        // 
        this.checkBox1.AutoSize = true;
        this.checkBox1.Location = new System.Drawing.Point(8, 297);
        this.checkBox1.Name = "checkBox1";
        this.checkBox1.Size = new System.Drawing.Size(117, 17);
        this.checkBox1.TabIndex = 10;
        this.checkBox1.Text = "рисовать стрелки";
        this.checkBox1.UseVisualStyleBackColor = true;
        this.checkBox1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
        // 
        // Form1
        // 
        this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
        this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        this.ClientSize = new System.Drawing.Size(624, 354);
        this.Controls.Add(this.checkBox1);
        this.Controls.Add(this.textBox3);
        this.Controls.Add(this.button2);
        this.Controls.Add(this.textBox2);
        this.Controls.Add(this.button1);
        this.Controls.Add(this.textBox1);
        this.Controls.Add(this.label1);
        this.Controls.Add(this.panel1);
        this.Controls.Add(this.menuStrip1);
        this.MainMenuStrip = this.menuStrip1;
        this.Name = "Form1";
        this.Text = "Рисуем дерево поиска (версия 2)";
        this.menuStrip1.ResumeLayout(false);
        this.menuStrip1.PerformLayout();
        this.ResumeLayout(false);
        this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.Panel panel1;
    private System.Windows.Forms.Label label1;
    private System.Windows.Forms.TextBox textBox1;
    private System.Windows.Forms.Button button1;
    private System.Windows.Forms.TextBox textBox2;
    private System.Windows.Forms.MenuStrip menuStrip1;
    private System.Windows.Forms.ToolStripMenuItem оПрограммеToolStripMenuItem;
    private System.Windows.Forms.Button button2;
    private System.Windows.Forms.TextBox textBox3;
    private System.Windows.Forms.CheckBox checkBox1;
  }
}

