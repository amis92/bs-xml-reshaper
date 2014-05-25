bs-xml-reshaper
===============

_author:_ Amadeusz Sadowski

Allows convenient reshaping of BattleScribe (c) Datafiles, ie after game system changes


### Instructions ###

To use:

* select folder containing all .cat and the .gst files by clicking `Select folder`.
* click `Regenerate IDs` to generate new GUIDs for all categories, profileTypes and characteristics found in .gst;
  these GUIDs will be replaced in all .cat files as well as in .gst file.
* if you created some .xsl file (an example is provided), you can transform all the files with it, selecting the .xsl file with `Select XSLT` button and clicking `Transform`
* optionally you can save log with appropriate button.


Program and it's source code is distributed under MIT license (as is in LICENSE file).
