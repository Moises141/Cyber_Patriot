using System;
using Microsoft.Win32;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Win_Toolbox
{
    public partial class Form1 : Form
    {
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            label1 = new Label();
            button1 = new System.Windows.Forms.Button();
            label2 = new Label();
            label3 = new Label();
            label4 = new Label();
            button2 = new System.Windows.Forms.Button();
            button3 = new System.Windows.Forms.Button();
            button4 = new System.Windows.Forms.Button();
            button5 = new System.Windows.Forms.Button();
            button6 = new System.Windows.Forms.Button();
            button7 = new System.Windows.Forms.Button();
            button8 = new System.Windows.Forms.Button();
            button9 = new System.Windows.Forms.Button();
            pictureBox1 = new PictureBox();
            label5 = new Label();
            button10 = new System.Windows.Forms.Button();
            button11 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.BackColor = Color.Transparent;
            label1.Location = new Point(0, 8);
            label1.Name = "label1";
            label1.Size = new Size(126, 15);
            label1.TabIndex = 0;
            label1.Text = "Optimizations Security";
            // 
            // button1
            // 
            button1.Location = new Point(8, 24);
            button1.Name = "button1";
            button1.Size = new Size(105, 24);
            button1.TabIndex = 1;
            button1.Text = " Auto secuirty ";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.BackColor = Color.Transparent;
            label2.Location = new Point(0, 208);
            label2.Name = "label2";
            label2.Size = new Size(81, 15);
            label2.TabIndex = 2;
            label2.Text = "Others/Extras ";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.BackColor = Color.Transparent;
            label3.Location = new Point(640, 8);
            label3.Name = "label3";
            label3.Size = new Size(101, 15);
            label3.TabIndex = 3;
            label3.Text = "Control interfaces";
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.BackColor = Color.Transparent;
            label4.Location = new Point(640, 208);
            label4.Name = "label4";
            label4.Size = new Size(54, 15);
            label4.TabIndex = 4;
            label4.Text = "Websites";
            // 
            // button2
            // 
            button2.Location = new Point(0, 224);
            button2.Name = "button2";
            button2.Size = new Size(105, 24);
            button2.TabIndex = 5;
            button2.Text = "Task Manager";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click;
            // 
            // button3
            // 
            button3.Location = new Point(0, 248);
            button3.Name = "button3";
            button3.Size = new Size(105, 24);
            button3.TabIndex = 6;
            button3.Text = "Antivirus Scan";
            button3.UseVisualStyleBackColor = true;
            button3.Click += button3_Click;
            // 
            // button4
            // 
            button4.Location = new Point(8, 48);
            button4.Name = "button4";
            button4.Size = new Size(105, 24);
            button4.TabIndex = 7;
            button4.Text = "RootKit detector";
            button4.UseVisualStyleBackColor = true;
            button4.Click += button4_Click;
            // 
            // button5
            // 
            button5.Location = new Point(640, 224);
            button5.Name = "button5";
            button5.Size = new Size(72, 24);
            button5.TabIndex = 8;
            button5.Text = "VirusTotal";
            button5.UseVisualStyleBackColor = true;
            button5.Click += button5_Click;
            // 
            // button6
            // 
            button6.Location = new Point(640, 248);
            button6.Name = "button6";
            button6.Size = new Size(72, 24);
            button6.TabIndex = 9;
            button6.Text = "Notes";
            button6.UseVisualStyleBackColor = true;
            button6.Click += button6_Click;
            // 
            // button7
            // 
            button7.Location = new Point(631, 24);
            button7.Name = "button7";
            button7.Size = new Size(119, 24);
            button7.TabIndex = 10;
            button7.Text = "Network";
            button7.UseVisualStyleBackColor = true;
            button7.Click += button7_Click;
            // 
            // button8
            // 
            button8.Location = new Point(631, 48);
            button8.Name = "button8";
            button8.Size = new Size(119, 24);
            button8.TabIndex = 11;
            button8.Text = "Programs/Features";
            button8.UseVisualStyleBackColor = true;
            button8.Click += button8_Click;
            // 
            // button9
            // 
            button9.Location = new Point(631, 72);
            button9.Name = "button9";
            button9.Size = new Size(119, 23);
            button9.TabIndex = 12;
            button9.Text = "User Accounts";
            button9.UseVisualStyleBackColor = true;
            button9.Click += button9_Click;
            // 
            // pictureBox1
            // 
            pictureBox1.Image = Properties.Resources._20201226_170815_01;
            pictureBox1.Location = new Point(631, 304);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(100, 94);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 13;
            pictureBox1.TabStop = false;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.BackColor = Color.Transparent;
            label5.Location = new Point(624, 400);
            label5.Name = "label5";
            label5.Size = new Size(104, 15);
            label5.TabIndex = 14;
            label5.Text = "By Moises Beleche";
            // 
            // button10
            // 
            button10.Location = new Point(0, 272);
            button10.Name = "button10";
            button10.Size = new Size(104, 24);
            button10.TabIndex = 15;
            button10.Text = "Junk Finder";
            button10.UseVisualStyleBackColor = true;
            button10.Click += button10_Click;
            // 
            // button11
            // 
            button11.Location = new Point(8, 72);
            button11.Name = "button11";
            button11.Size = new Size(104, 24);
            button11.TabIndex = 16;
            button11.Text = "Firewall settings";
            button11.UseVisualStyleBackColor = true;
            button11.Click += button11_Click;
            // 
            // Form1
            // 
            BackgroundImage = Properties.Resources.IMG_0433;
            BackgroundImageLayout = ImageLayout.Stretch;
            ClientSize = new Size(762, 435);
            Controls.Add(button11);
            Controls.Add(button10);
            Controls.Add(label5);
            Controls.Add(pictureBox1);
            Controls.Add(button9);
            Controls.Add(button8);
            Controls.Add(button7);
            Controls.Add(button6);
            Controls.Add(button5);
            Controls.Add(button4);
            Controls.Add(button3);
            Controls.Add(button2);
            Controls.Add(label4);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(button1);
            Controls.Add(label1);
            DoubleBuffered = true;
            Icon = (Icon)resources.GetObject("$this.Icon");
            Name = "Form1";
            Text = "Win_Tool_Box_v1.5";
            Load += Form1_Load;
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        private Label label1;
        private System.Windows.Forms.Button button1;
        private Label label2;
        private Label label3;
        private Label label4;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button7;
        private System.Windows.Forms.Button button8;
        private System.Windows.Forms.Button button9;
        private PictureBox pictureBox1;
        private Label label5;
        private System.Windows.Forms.Button button10;
        private System.Windows.Forms.Button button11;
    }
}