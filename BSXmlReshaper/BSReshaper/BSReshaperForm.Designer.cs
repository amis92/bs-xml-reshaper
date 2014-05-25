namespace BSReshaper
{
    partial class BSReshaper
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
            this.folderBrowserDialog = new System.Windows.Forms.FolderBrowserDialog();
            this.folderLabel = new System.Windows.Forms.Label();
            this.folderSelectButton = new System.Windows.Forms.Button();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.logBoxFrame = new System.Windows.Forms.GroupBox();
            this.logBox = new System.Windows.Forms.TextBox();
            this.startButton = new System.Windows.Forms.Button();
            this.loadXsltButton = new System.Windows.Forms.Button();
            this.xsltLabel = new System.Windows.Forms.Label();
            this.transformButton = new System.Windows.Forms.Button();
            this.chooseXsltDialog = new System.Windows.Forms.OpenFileDialog();
            this.flowLayoutPanel4 = new System.Windows.Forms.FlowLayoutPanel();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.flowLayoutPanel2 = new System.Windows.Forms.FlowLayoutPanel();
            this.closeButton = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.saveLogButton = new System.Windows.Forms.Button();
            this.saveLogDialog = new System.Windows.Forms.SaveFileDialog();
            this.tableLayoutPanel1.SuspendLayout();
            this.logBoxFrame.SuspendLayout();
            this.flowLayoutPanel4.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.flowLayoutPanel2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.flowLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // folderBrowserDialog
            // 
            this.folderBrowserDialog.RootFolder = System.Environment.SpecialFolder.UserProfile;
            this.folderBrowserDialog.ShowNewFolderButton = false;
            // 
            // folderLabel
            // 
            this.folderLabel.AutoSize = true;
            this.folderLabel.Location = new System.Drawing.Point(119, 5);
            this.folderLabel.Margin = new System.Windows.Forms.Padding(5, 5, 0, 0);
            this.folderLabel.Name = "folderLabel";
            this.folderLabel.Size = new System.Drawing.Size(97, 13);
            this.folderLabel.TabIndex = 2;
            this.folderLabel.Text = "(no folder selected)";
            // 
            // folderSelectButton
            // 
            this.folderSelectButton.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.folderSelectButton.Location = new System.Drawing.Point(3, 3);
            this.folderSelectButton.Name = "folderSelectButton";
            this.folderSelectButton.Size = new System.Drawing.Size(108, 23);
            this.folderSelectButton.TabIndex = 0;
            this.folderSelectButton.Text = "Select Folder";
            this.folderSelectButton.UseVisualStyleBackColor = true;
            this.folderSelectButton.Click += new System.EventHandler(this.folderSelectButton_Click);
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 58.09859F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 41.90141F));
            this.tableLayoutPanel1.Controls.Add(this.logBoxFrame, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.flowLayoutPanel4, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.groupBox2, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.groupBox3, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 4;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 13.05361F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 86.94639F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 60F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 33F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(544, 523);
            this.tableLayoutPanel1.TabIndex = 3;
            // 
            // logBoxFrame
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.logBoxFrame, 2);
            this.logBoxFrame.Controls.Add(this.logBox);
            this.logBoxFrame.Dock = System.Windows.Forms.DockStyle.Fill;
            this.logBoxFrame.Location = new System.Drawing.Point(3, 59);
            this.logBoxFrame.Name = "logBoxFrame";
            this.logBoxFrame.Size = new System.Drawing.Size(538, 367);
            this.logBoxFrame.TabIndex = 5;
            this.logBoxFrame.TabStop = false;
            this.logBoxFrame.Text = "Log";
            // 
            // logBox
            // 
            this.logBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.logBox.Location = new System.Drawing.Point(3, 16);
            this.logBox.MinimumSize = new System.Drawing.Size(4, 20);
            this.logBox.Multiline = true;
            this.logBox.Name = "logBox";
            this.logBox.ReadOnly = true;
            this.logBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.logBox.Size = new System.Drawing.Size(532, 348);
            this.logBox.TabIndex = 3;
            // 
            // startButton
            // 
            this.startButton.Location = new System.Drawing.Point(351, 3);
            this.startButton.Name = "startButton";
            this.startButton.Size = new System.Drawing.Size(103, 23);
            this.startButton.TabIndex = 4;
            this.startButton.Text = "Regenerate IDs";
            this.startButton.UseVisualStyleBackColor = true;
            this.startButton.Click += new System.EventHandler(this.startButton_Click);
            // 
            // loadXsltButton
            // 
            this.loadXsltButton.Location = new System.Drawing.Point(3, 3);
            this.loadXsltButton.Name = "loadXsltButton";
            this.loadXsltButton.Size = new System.Drawing.Size(87, 23);
            this.loadXsltButton.TabIndex = 0;
            this.loadXsltButton.Text = "Choose XSLT";
            this.loadXsltButton.UseVisualStyleBackColor = true;
            this.loadXsltButton.Click += new System.EventHandler(this.loadXsltButton_Click);
            // 
            // xsltLabel
            // 
            this.xsltLabel.AutoSize = true;
            this.xsltLabel.Location = new System.Drawing.Point(98, 5);
            this.xsltLabel.Margin = new System.Windows.Forms.Padding(5);
            this.xsltLabel.Name = "xsltLabel";
            this.xsltLabel.Size = new System.Drawing.Size(98, 13);
            this.xsltLabel.TabIndex = 1;
            this.xsltLabel.Text = "(no XSLT selected)";
            // 
            // transformButton
            // 
            this.transformButton.Location = new System.Drawing.Point(258, 3);
            this.transformButton.Name = "transformButton";
            this.transformButton.Size = new System.Drawing.Size(87, 23);
            this.transformButton.TabIndex = 2;
            this.transformButton.Text = "Transform";
            this.transformButton.UseVisualStyleBackColor = true;
            this.transformButton.Click += new System.EventHandler(this.transformButton_Click);
            // 
            // chooseXsltDialog
            // 
            this.chooseXsltDialog.Filter = "XSLT files|*.xslt|XML files|*.xml";
            // 
            // flowLayoutPanel4
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.flowLayoutPanel4, 2);
            this.flowLayoutPanel4.Controls.Add(this.closeButton);
            this.flowLayoutPanel4.Controls.Add(this.startButton);
            this.flowLayoutPanel4.Controls.Add(this.transformButton);
            this.flowLayoutPanel4.Controls.Add(this.saveLogButton);
            this.flowLayoutPanel4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel4.FlowDirection = System.Windows.Forms.FlowDirection.RightToLeft;
            this.flowLayoutPanel4.Location = new System.Drawing.Point(3, 492);
            this.flowLayoutPanel4.Name = "flowLayoutPanel4";
            this.flowLayoutPanel4.Size = new System.Drawing.Size(538, 28);
            this.flowLayoutPanel4.TabIndex = 8;
            // 
            // groupBox2
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.groupBox2, 2);
            this.groupBox2.Controls.Add(this.flowLayoutPanel2);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox2.Location = new System.Drawing.Point(3, 432);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(538, 54);
            this.groupBox2.TabIndex = 10;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Transformation";
            // 
            // flowLayoutPanel2
            // 
            this.flowLayoutPanel2.Controls.Add(this.loadXsltButton);
            this.flowLayoutPanel2.Controls.Add(this.xsltLabel);
            this.flowLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel2.Location = new System.Drawing.Point(3, 16);
            this.flowLayoutPanel2.Name = "flowLayoutPanel2";
            this.flowLayoutPanel2.Size = new System.Drawing.Size(532, 35);
            this.flowLayoutPanel2.TabIndex = 0;
            // 
            // closeButton
            // 
            this.closeButton.Location = new System.Drawing.Point(460, 3);
            this.closeButton.Name = "closeButton";
            this.closeButton.Size = new System.Drawing.Size(75, 23);
            this.closeButton.TabIndex = 5;
            this.closeButton.Text = "Close";
            this.closeButton.UseVisualStyleBackColor = true;
            this.closeButton.Click += new System.EventHandler(this.closeButton_Click);
            // 
            // groupBox3
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.groupBox3, 2);
            this.groupBox3.Controls.Add(this.flowLayoutPanel1);
            this.groupBox3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox3.Location = new System.Drawing.Point(3, 3);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(538, 50);
            this.groupBox3.TabIndex = 11;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Folder selection";
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.Controls.Add(this.folderSelectButton);
            this.flowLayoutPanel1.Controls.Add(this.folderLabel);
            this.flowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel1.Location = new System.Drawing.Point(3, 16);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(532, 31);
            this.flowLayoutPanel1.TabIndex = 0;
            // 
            // saveLogButton
            // 
            this.saveLogButton.Location = new System.Drawing.Point(177, 3);
            this.saveLogButton.Name = "saveLogButton";
            this.saveLogButton.Size = new System.Drawing.Size(75, 23);
            this.saveLogButton.TabIndex = 6;
            this.saveLogButton.Text = "Save Log";
            this.saveLogButton.UseVisualStyleBackColor = true;
            this.saveLogButton.Click += new System.EventHandler(this.saveLogButton_Click);
            // 
            // saveLogDialog
            // 
            this.saveLogDialog.DefaultExt = "txt";
            this.saveLogDialog.FileName = "BSReshaper_log";
            this.saveLogDialog.Filter = "Text files|*.txt|Log files|*.log";
            this.saveLogDialog.Title = "Save Log";
            // 
            // BSReshaper
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(544, 523);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "BSReshaper";
            this.Text = "BSReshaper";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.logBoxFrame.ResumeLayout(false);
            this.logBoxFrame.PerformLayout();
            this.flowLayoutPanel4.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.flowLayoutPanel2.ResumeLayout(false);
            this.flowLayoutPanel2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.flowLayoutPanel1.ResumeLayout(false);
            this.flowLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog;
        private System.Windows.Forms.Button folderSelectButton;
        private System.Windows.Forms.Label folderLabel;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.TextBox logBox;
        private System.Windows.Forms.Button startButton;
        private System.Windows.Forms.GroupBox logBoxFrame;
        private System.Windows.Forms.Button loadXsltButton;
        private System.Windows.Forms.Label xsltLabel;
        private System.Windows.Forms.Button transformButton;
        private System.Windows.Forms.OpenFileDialog chooseXsltDialog;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel4;
        private System.Windows.Forms.Button closeButton;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private System.Windows.Forms.Button saveLogButton;
        private System.Windows.Forms.SaveFileDialog saveLogDialog;
    }
}

