namespace BSReshaper
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Xml.Linq;

    /// <summary>
    ///     Substitutes GUIDs in BattleScribe (c) files.
    ///     GUIDs of following objects are regenerated:
    ///     category, profileType, characteristic.
    ///     Author: Amadeusz Sadowski.
    ///     Original source:
    ///     <see cref="!:https://github.com/amis92/bs-xml-reshaper" />
    /// </summary>
    public sealed class IdReGenerator
    {
        private readonly List<string> _cataloguePaths;
        private readonly string _gstPath;
        private readonly Action<string> _log;
        private Dictionary<string, string> _idOldNewDict;

        public IdReGenerator(string gstPath, List<string> catPaths, Action<string> log)
        {
            _gstPath = gstPath;
            _cataloguePaths = catPaths;
            _log = log;
        }

        public XDocument ReshapingXsl => GenerateXslt();

        /// <summary>
        ///     Browses categories and profile types in gst,
        ///     generates new GUIDs for them and replaces them
        ///     in catalogues and game system.
        /// </summary>
        public void RegenerateIds()
        {
            // setup
            _log("Setting up Reshaper...");
            var gst = XDocument.Load(_gstPath);
            var ns = gst.Root.GetDefaultNamespace();
            var set = new HashSet<string>();
            _log("Set-up. Searching gst for distinct ids...");
            // finding ids
            set.UnionWith(FindDistinctIds(ns + "category", gst.Root));
            set.UnionWith(FindDistinctIds(ns + "characteristic", gst.Root));
            set.UnionWith(FindDistinctIds(ns + "profileType", gst.Root));
            _log("Finished. Re-generating ids.");
            _idOldNewDict = RegenerateIdsCore(set);
            _log("Re-generated. Replacing in gst...");
            // switching
            SwitchIds(_idOldNewDict, _gstPath);
            _log("Replaced all occurences in gst file. Replacing in catalogues...");
            foreach (var catPath in _cataloguePaths)
            {
                SwitchIds(_idOldNewDict, catPath);
                _log("# Replaced occurences in:");
                _log(catPath);
            }
            _log("Replacing completed.");
        }

        /// <summary>
        ///     Searches for elements called elementName and creates set
        ///     of distinct values found in their id attribute.
        /// </summary>
        /// <param name="elementName">name of elements to search for</param>
        /// <param name="root">root element to search in</param>
        /// <returns>Set of distinct IDs.</returns>
        private HashSet<string> FindDistinctIds(XName elementName, XElement root)
        {
            var elements = root.Descendants(elementName);
            var ids = new HashSet<string>();
            foreach (var element in elements)
            {
                if (ids.Add(element.Attribute("id").Value))
                {
                    _log("# Distinct element found:");
                    _log("# name:");
                    _log(element.Attribute("name").Value);
                    _log("# id:");
                    _log(element.Attribute("id").Value);
                }
            }
            return ids;
        }

        /// <summary>
        ///     For each string in list, a pair is created.
        ///     Pair consists of that value and a new string.
        ///     New string is a new GUID.
        ///     It is guaranteed new strings are distinct from each other.
        /// </summary>
        /// <param name="ids">set of IDs to process.</param>
        /// <returns>Dictionary of described pairs.</returns>
        private Dictionary<string, string> RegenerateIdsCore(ICollection<string> ids)
        {
            var dict = new Dictionary<string, string>(ids.Count);
            foreach (var id in ids)
            {
                string newId;
                do
                {
                    newId = Guid.NewGuid().ToString();
                } while (dict.ContainsValue(newId) || dict.ContainsKey(newId));
                dict.Add(id, newId);
                _log("# changing: " + id);
                _log("# into:     " + newId);
            }
            return dict;
        }

        /// <summary>
        ///     Opens file and replaces each occurence of any key from dictionary
        ///     with a value assigned to it.
        /// </summary>
        /// <param name="dict">Dictionary containing keys to be replaced with their values.</param>
        /// <param name="filePath">Path to file in which replacement will take place.</param>
        private static void SwitchIds(Dictionary<string, string> dict, string filePath)
        {
            var contents = File.ReadAllText(filePath);
            contents = dict.Aggregate(contents, (current, pair) => current.Replace(pair.Key, pair.Value));
            File.WriteAllText(filePath, contents);
        }

        /// <summary>
        ///     Warning! This should not be called before idOldNewDict isn't initialized.
        /// </summary>
        /// <returns></returns>
        private XDocument GenerateXslt()
        {
            if (_idOldNewDict == null)
            {
                throw new InvalidDataException("No isOldNewDict found.");
            }
            var docBuilder = new StringBuilder();
            docBuilder.AppendLine(@"<?xml version=""1.0"" encoding=""UTF-8""?>");
            docBuilder.AppendLine(@"<xsl:stylesheet version=""1.0"" xmlns:xsl=""http://www.w3.org/1999/XSL/Transform"">");
            docBuilder.AppendLine(
                @"  <xsl:output omit-xml-declaration=""no"" encoding=""UTF-8"" standalone=""yes"" version=""1.0"" indent=""yes"" method=""xml""/>");
            docBuilder.AppendLine();
            docBuilder.AppendLine(@"<!-- The Identity Transformation -->");
            docBuilder.AppendLine(@"<!-- Whenever you match any node or any attribute -->");
            docBuilder.AppendLine(@"<xsl:template match=""node()|@*"">");
            docBuilder.AppendLine(@"    <!-- Copy the current node -->");
            docBuilder.AppendLine(@"    <xsl:copy>");
            docBuilder.AppendLine(@"      <!-- Including any attributes it has and any child nodes -->");
            docBuilder.AppendLine(@"      <xsl:apply-templates select=""@*|node()""/>");
            docBuilder.AppendLine(@"    </xsl:copy>");
            docBuilder.AppendLine(@"  </xsl:template>");
            foreach (var pair in _idOldNewDict)
            {
                docBuilder.AppendLine();
                docBuilder.AppendLine($@"  <xsl:template match=""@*[.='{pair.Key}']"">");
                docBuilder.AppendLine(
                    $@"    <xsl:attribute name=""{{name()}}"" namespace=""{{namespace-uri()}}"">{pair.Value}</xsl:attribute>");
                docBuilder.AppendLine(@"  </xsl:template>");
            }
            docBuilder.AppendLine();
            docBuilder.AppendLine(@"</xsl:stylesheet>");
            return XDocument.Parse(docBuilder.ToString());
        }
    }
}
