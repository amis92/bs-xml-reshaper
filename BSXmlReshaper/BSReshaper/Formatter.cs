namespace BSReshaper
{
    using System.IO;
    using System.Text;
    using System.Text.RegularExpressions;

    public static class Formatter
    {
        public static void CopyFormattedAsBattleScribeTo(this Stream input, Stream output)
        {
            string xmlFormatted;
            using (var reader = new StreamReader(input))
            {
                xmlFormatted = reader.ReadToEnd();
            }
            // format header
            xmlFormatted = Regex.Replace(xmlFormatted,
                @"<\?xml version=""1\.0"" encoding=""utf-8""( standalone=""yes"")?\?>",
                @"<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?>");
            // format ElementEnds
            xmlFormatted = xmlFormatted.Replace(" />", "/>");
            // encode quotes
            xmlFormatted = Regex.Replace(xmlFormatted,
                @">(([^<""]*)""([^<""]*))*<",
                m => m.Value.Replace(@"""", @"&quot;"));
            // encode apostrophes
            xmlFormatted = xmlFormatted.Replace("'", @"&apos;");
            var writer = new StreamWriter(output, Encoding.UTF8);
            writer.Write(xmlFormatted);
            writer.Flush();
        }
    }
}
