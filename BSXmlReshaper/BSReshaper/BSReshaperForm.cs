namespace BSReshaper
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    using System.Xml.Xsl;

    // ReSharper disable LocalizableElement

    /// <summary>
    ///     Author: Amadeusz Sadowski
    ///     Original source:
    ///     <see cref="!:https://github.com/amis92/bs-xml-reshaper" />
    /// </summary>
    public partial class BsReshaper : Form
    {
#if DEBUG
        private const string DebugDefaultPath = @"C:\Users\Amadeusz\BattleScribe\data\wh40k\";
#endif

        public BsReshaper()
        {
            InitializeComponent();
        }

        private string FolderPath { get; set; }

        private bool IsFolderSelected { get; set; }

        private bool IsXslSelected { get; set; }

        private string XsltPath { get; set; }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            UpdateFolderPath(null);
        }

        private void UpdateFolderPath(string path)
        {
            FolderPath = path;
            if (!IsFolderSelected)
            {
                FolderPath = Directory.GetCurrentDirectory();
#if DEBUG
                FolderPath = Directory.Exists(DebugDefaultPath) ? DebugDefaultPath : FolderPath;
#endif
            }
            folderLabel.Text = $"Selected: '{FolderPath}'";
            if (!IsXslSelected)
            {
                CheckForXslt();
            }
        }

        private void UpdateXsltChoice(string fileName)
        {
            xsltLabel.Text = IsXslSelected ? $"Selected: '{fileName}'" : "(no file selected)";
            XsltPath = fileName;
        }

        private void CheckForXslt()
        {
            if (!Directory.Exists(FolderPath))
            {
                return;
            }
            var xslts = Directory.GetFiles(FolderPath, "*.xsl").ToList();
            if (xslts.Count != 1)
            {
                return;
            }
            Log($"# Found one XSLT in working directory, preselecting automatically: '{xslts[0]}'");
            IsXslSelected = true;
            UpdateXsltChoice(xslts[0]);
        }

        private List<string> GetFilePaths(bool requireSingleGameSystem)
        {
            Log($"# Operating in '{FolderPath}'");
            var gameSystemPaths = GetFilePathsForExtension(".gst");
            if (requireSingleGameSystem && gameSystemPaths.Count != 1)
            {
                Log(
                    "ERROR: Folder contains more than 1 game system file, or doesn't contain one. It can't be processed.");
                return null;
            }
            var cataloguePaths = GetFilePathsForExtension(".cat");
            return gameSystemPaths.Concat(cataloguePaths).ToList();
        }

        private List<string> GetFilePathsForExtension(string extension)
        {
            var paths = Directory.GetFiles(FolderPath, $"*{extension}").ToList();
            var zipped = paths.Where(x => x.EndsWith("z")).ToList();
            if (zipped.Count > 0)
            {
                Log(
                    $"# {paths.Count} {extension}z file{(paths.Count == 1 ? "" : "s")} found. Zipped files aren't processed.");
                foreach (var path in paths)
                {
                    Log($"#  * {path}");
                }
                paths = paths.Except(zipped).ToList();
            }
            Log($"# {paths.Count} {extension} file{(paths.Count == 1 ? "" : "s")} found{(paths.Count == 0 ? "." : ":")}");
            foreach (var path in paths)
            {
                Log($"#  * {path}");
            }
            Log("#");
            return paths;
        }

        private void Transform()
        {
            if (!IsXslSelected)
            {
                Log("ERROR: XSL file not selected.");
                return;
            }
            try
            {
                Log($"# Loading XSLT from '{XsltPath}'...");
                var transformer = new XslCompiledTransform();
                transformer.Load(XsltPath);
                Log("# Loaded.");
                var paths = GetFilePaths(false);
                Log("# Transforming...");
                TransformCore(transformer, paths);
                Log("# Completed operations.");
            }
            catch (XsltException e)
            {
                Log($"ERROR: In '{e.SourceUri}' (Line {e.LineNumber}:{e.LinePosition}):");
                Log(e.Message);
                Log("# Stopped processing. Please fix your stylesheet and try again.");
            }
            catch (Exception e)
            {
                Log($"ERROR: {e.Message}");
                Log("# Stopped processing.");
            }
        }

        private void TransformCore(XslCompiledTransform transformer, IEnumerable<string> paths)
        {
            foreach (var path in paths)
            {
                using (var stream = new MemoryStream())
                {
                    transformer.Transform(path, null, stream);
                    using (var file = File.Open(path, FileMode.Create))
                    {
                        stream.Position = 0;
                        stream.CopyFormattedAsBattleScribeTo(file);
                    }
                    Log("# Transformed: " + path);
                }
            }
        }

        private void RegenerateIds()
        {
            if (!IsFolderSelected)
            {
                Log("WARNING: No folder selected: operating in execution directory.");
            }
            var paths = GetFilePaths(true);
            if (paths == null)
            {
                return;
            }
            var reshaper = new IdReGenerator(paths[0], paths.Skip(1).ToList(), Log);
            reshaper.RegenerateIds();
            SaveXsltThreadSafe(reshaper);
        }

        private void SaveXsltThreadSafe(IdReGenerator idReGenerator)
        {
            if (InvokeRequired)
            {
                SaveXsltCallback d = SaveXslt;
                Invoke(d, idReGenerator);
            }
            else
            {
                SaveXslt(idReGenerator);
            }
        }

        private void SaveXslt(IdReGenerator idReGenerator)
        {
            if (saveXslDialog.ShowDialog() != DialogResult.OK)
            {
                return;
            }
            var fileName = saveXslDialog.FileName;
            Log("# Saving XSLT...");
            File.WriteAllText(fileName, idReGenerator.ReshapingXsl.ToString());
            Log($"# XSLT saved as '{fileName}'.");
        }

        private delegate void SaveXsltCallback(IdReGenerator idReGenerator);

        #region UI event handlers

        private void folderSelectButton_Click(object sender, EventArgs e)
        {
            IsFolderSelected = folderBrowserDialog.ShowDialog() == DialogResult.OK;
            UpdateFolderPath(folderBrowserDialog.SelectedPath);
        }

        private void loadXsltButton_Click(object sender, EventArgs e)
        {
            IsXslSelected = chooseXsltDialog.ShowDialog() == DialogResult.OK;
            UpdateXsltChoice(chooseXsltDialog.FileName);
        }

        private void startButton_Click(object sender, EventArgs e)
        {
            Task.Run(() => RegenerateIds());
        }

        private void transformButton_Click(object sender, EventArgs args)
        {
            Task.Run(() => Transform());
        }

        private void saveLogButton_Click(object sender, EventArgs e)
        {
            if (saveLogDialog.ShowDialog() == DialogResult.OK)
            {
                File.WriteAllText(saveLogDialog.FileName, logBox.Text);
            }
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            Close();
        }

        #endregion

        #region Logging

        private delegate void AppendTextCallback(string text);

        // If the calling thread is different from the thread that 
        // created the TextBox control, this method creates a 
        // SetTextCallback and calls itself asynchronously using the 
        // Invoke method. 
        // 
        // If the calling thread is the same as the thread that created 
        // the TextBox control, the Text property is set directly.  
        private void Log(string text)
        {
            // InvokeRequired compares the thread ID of the 
            // calling thread to the thread ID of the creating thread. 
            // If these threads are different, it returns true. 
            if (InvokeRequired)
            {
                AppendTextCallback callback = Log;
                Invoke(callback, text);
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

        #endregion
    }
}
