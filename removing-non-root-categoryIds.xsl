<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:bs-cat="http://www.battlescribe.net/schema/catalogueSchema">

  <xsl:output omit-xml-declaration="no" encoding="UTF-8" standalone="yes" version="1.0" indent="yes" method="xml"/>
  
  <!-- The Identity Transformation -->
  <!-- Whenever you match any node or any attribute -->
  <xsl:template match="node()|@*">
    <!-- Copy the current node -->
    <xsl:copy>
      <!-- Including any attributes it has and any child nodes -->
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Removing categoryId from entry descendants of any level of sharedEntries node-->
  <xsl:template match="bs-cat:sharedEntries//bs-cat:entry/@categoryId">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">(No Category)</xsl:attribute>
  </xsl:template>
  
  <!-- Removing categoryId from entry descendants of any level of sharedEntryGroups node-->
  <xsl:template match="bs-cat:sharedEntryGroups//bs-cat:entry/@categoryId">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">(No Category)</xsl:attribute>
  </xsl:template>
  
  <!-- Removing categoryId from entry descendants of at least second level in entries node-->
  <xsl:template match="//bs-cat:entries/bs-cat:entry//bs-cat:entry/@categoryId">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">(No Category)</xsl:attribute>
  </xsl:template>

</xsl:stylesheet>