using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace BSReshaper
{
    /// <summary>
    /// Substitutes GUIDs in BattleScribe (c) files.
    /// GUIDs of following objects are regenerated:
    /// category, profileType, characteristic.
    /// Author: Amadeusz Sadowski.
    /// Original source:
    /// <see cref="!:https://github.com/amis92/bs-xml-reshaper" />
    /// </summary>
    public sealed class Reshaper
    {
        private readonly string gstPath;
        private readonly List<string> cataloguePaths;
        private readonly Action<string> log;

        public Reshaper(string gstPath, List<string> catPaths, Action<string> log)
        {
            this.gstPath = gstPath;
            this.cataloguePaths = catPaths;
            this.log = log;
        }

        /// <summary>
        /// Browses categories and profile types in gst,
        /// generates new GUIDs for them and replaces them
        /// in catalogues and game system.
        /// </summary>
        public void RegenerateIds()
        {
            // setup
            XDocument gst = XDocument.Load(gstPath);
            XNamespace ns = gst.Root.GetDefaultNamespace();
            var set = new HashSet<string>();
            // finding ids
            set.UnionWith(findDistinctIds(ns + "category", gst.Root));
            set.UnionWith(findDistinctIds(ns + "characteristic", gst.Root));
            set.UnionWith(findDistinctIds(ns + "profileType", gst.Root));
            var dict = regenerateIds(set);
            // switching
            switchIds(dict, gstPath);
            log("# replaced all occurences in gst file");
            foreach (string catPath in cataloguePaths)
            {
                switchIds(dict, catPath);
                log("# Replaced occurences in:");
                log(catPath);
            }
        }

        /// <summary>
        /// Searches for elements called elementName and creates set
        /// of distinct values found in their id attribute.
        /// </summary>
        /// <param name="elementName">name of elements to search for</param>
        /// <param name="root">root element to search in</param>
        /// <returns>Set of distinct IDs.</returns>
        private HashSet<string> findDistinctIds(XName elementName, XElement root)
        {
            var elements = root.Descendants(elementName);
            var ids = new HashSet<string>();
            foreach (var element in elements)
            {
                if (ids.Add(element.Attribute("id").Value))
                {
                    log("# Distinct element found:");
                    log("# name:");
                    log(element.Attribute("name").Value);
                    log("# id:");
                    log(element.Attribute("id").Value);
                }
            }
            return ids;
        }

        /// <summary>
        /// For each string in list, a pair is created.
        /// Pair consists of that value and a new string.
        /// New string is a new GUID.
        /// It is guaranteed new strings are distinct from each other.
        /// </summary>
        /// <param name="ids">set of IDs to process.</param>
        /// <returns>Dictionary of described pairs.</returns>
        private Dictionary<string, string> regenerateIds(HashSet<string> ids)
        {
            var dict = new Dictionary<string, string>(ids.Count);
            foreach (string id in ids)
            {
                string newId;
                do
                {
                    newId = Guid.NewGuid().ToString();
                }
                while (dict.ContainsValue(newId) || dict.ContainsKey(newId));
                dict.Add(id, newId);
                log("# changing: " + id);
                log("# into:     " + newId);
            }
            return dict;
        }

        /// <summary>
        /// Opens file and replaces each occurence of any key from dictionary
        /// with a value assigned to it.
        /// </summary>
        /// <param name="dict">Dictionary containing keys to be replaced with their values.</param>
        /// <param name="filePath">Path to file in which replacement will take place.</param>
        private void switchIds(Dictionary<string, string> dict, string filePath)
        {
            string contents = File.ReadAllText(filePath);
            foreach (var pair in dict)
            {
                contents = contents.Replace(pair.Key, pair.Value);
            }
            File.WriteAllText(filePath, contents);
        }
    }
}
