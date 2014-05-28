using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BSReshaper
{
    /// <summary>
    /// Author: Amadeusz Sadowski
    /// Original source:
    /// <see cref="!:https://github.com/amis92/bs-xml-reshaper" />
    /// </summary>
    public partial class BSReshaper : Form
    {

        // This delegate enables asynchronous calls for setting 
        // the text property on a TextBox control. 
        delegate void AppendTextCallback(string text);

        private bool folderSelected;
        private bool xslSelected;
        private static readonly string debugDefaultPath = @"D:\Documents\BattleScribe\data\wh40k\";
        public BSReshaper()
        {
            folderSelected = xslSelected = false;
            InitializeComponent();
        }

        private void folderSelectButton_Click(object sender, EventArgs e)
        {
            folderSelected = folderBrowserDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK;
            if (folderSelected)
            {
                folderLabel.Text = "Selected: " + folderBrowserDialog.SelectedPath;
            }
            else
            {
                folderLabel.Text = "(no folder selected)";
            }
        }

        private string getGstPath()
        {
            var path = folderBrowserDialog.SelectedPath;
#if DEBUG
            path = debugDefaultPath;
            log("DEBUG loading gst from: " + path);
#endif
            log("# Operating in:");
            log(path);
            /* searching for gsts */
            List<string> gstStream = new List<string>(1);
            log("# Following .gst files found:");
            foreach (var s in Directory.EnumerateFiles(path, "*.gst"))
            {
                log("* " + s);
                gstStream.Add(s);
            }
            if (gstStream.Count != 1)
            {
                log("Folder contains more than 1 game system file, or doesn't contain one. It can't be processed.");
                return null;
            }
            return gstStream[0];
        }

        private List<string> getCatPaths()
        {
            var path = folderBrowserDialog.SelectedPath;
#if DEBUG
            path = debugDefaultPath;
            log("DEBUG loading cats from: " + path);
#endif
            log("# Operating in:");
            log(path);
            /* searching for cats */
            List<string> catStreams = new List<string>();
            log("# Following .cat files found:");
            foreach (var s in Directory.EnumerateFiles(path, "*.cat"))
            {
                log("* " + s);
                catStreams.Add(s);
            }
            return catStreams;
        }

        private void startButton_Click(object sender, EventArgs e)
        {
#if DEBUG
            folderSelected = true;
#endif
            if (!folderSelected)
            {
                log("No folder selected.");
                return;
            }
#if DEBUG
            folderSelected = false;
#endif
            string gstPath = getGstPath();
            if (gstPath == null)
            {
                return;
            }
            Reshaper reshaper = new Reshaper(gstPath, getCatPaths(), log);
            Task.Run(new Action(reshaper.RegenerateIds));
        }

        private void transformButton_Click(object sender, EventArgs e)
        {
            if (!xslSelected)
            {
                log("XSL file not selected.");
                return;
            }
            Task.Run(new Action(() =>
            {
                var transformer = new System.Xml.Xsl.XslCompiledTransform();
                transformer.Load(chooseXsltDialog.FileName);
                var paths = getCatPaths();
                paths.Add(getGstPath());
                log("Transforming...");
                foreach (var path in paths)
                {
                    using (var stream = new MemoryStream())
                    {
                        transformer.Transform(path, null, stream);
                        using (FileStream file = File.Open(path, FileMode.Create))
                        {
                            stream.WriteTo(file);
                        }
                        log("# Transformed: " + path);
                    }
                }
                log("Completed.");
            }));
        }

        private void loadXsltButton_Click(object sender, EventArgs e)
        {
            xslSelected = chooseXsltDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK;
            if (xslSelected)
            {
                xsltLabel.Text = "Selected: " + chooseXsltDialog.FileName;
            }
            else
            {
                xsltLabel.Text = "(no file selected)";
            }
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void saveLogButton_Click(object sender, EventArgs e)
        {
            if (saveLogDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                File.WriteAllText(saveLogDialog.FileName, logBox.Text);
            }
        }

        // If the calling thread is different from the thread that 
        // created the TextBox control, this method creates a 
        // SetTextCallback and calls itself asynchronously using the 
        // Invoke method. 
        // 
        // If the calling thread is the same as the thread that created 
        // the TextBox control, the Text property is set directly.  
        private void log(string text)
        {
            // InvokeRequired required compares the thread ID of the 
            // calling thread to the thread ID of the creating thread. 
            // If these threads are different, it returns true. 
            if (this.logBox.InvokeRequired)
            {
                AppendTextCallback d = new AppendTextCallback(log);
                this.Invoke(d, new object[] { text });
            }
            else
            {
                AppendText(text);
            }
        }

        private void AppendText(string logText)
        {
            logBox.AppendText(logText);
            logBox.AppendText("\r\n");
        }
    }
}
