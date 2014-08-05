<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:bs-gst="http://www.battlescribe.net/schema/gameSystemSchema"
xmlns:bs-cat="http://www.battlescribe.net/schema/catalogueSchema">
  <xsl:output omit-xml-declaration="no" encoding="UTF-8" standalone="yes" version="1.0" indent="yes" method="xml"/>

  <xsl:variable name="gst-ns" >http://www.battlescribe.net/schema/gameSystemSchema</xsl:variable>
  <xsl:variable name="cat-ns" >http://www.battlescribe.net/schema/catalogueSchema</xsl:variable>

  <!-- The Identity Transformation -->
  <!-- Whenever you match any node or any attribute -->
  <xsl:template match="node()|@*">
    <!-- Copy the current node -->
    <xsl:copy>
      <!-- Including any attributes it has and any child nodes -->
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Catalogue - only rework, just delete profile type from gst -->
  
  
  <!-- Walker touch up -->
  
  <!-- Super-heavy id switch to Walker id -->
  <xsl:template match="bs-cat:profile[@profileTypeId='536757ae-79d7-42c6-bc3e-01e87bed2151']/@profileTypeId">
    <xsl:attribute name="profileTypeId">3dadd2ff-33f1-41dd-85c7-bee5a7dfa413</xsl:attribute>
  </xsl:template>

  <!-- now all ids are switched to Walker's, we resort characteristics only in normal-walker-id nodes -->
  <!-- Walker resorting (Type <-> HP) -->
  <xsl:template match="bs-cat:profile[@profileTypeId='3dadd2ff-33f1-41dd-85c7-bee5a7dfa413']/bs-cat:characteristics">
    <xsl:copy>
      <xsl:apply-templates select="bs-cat:characteristic[@name='WS']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='BS']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='S']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='Front']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='Side']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='Rear']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='I']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='A']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='HP']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='Type']"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- resorting in gst too -->
  <!-- Walker resorting (Type <-> HP) -->
  <xsl:template match="bs-gst:profileType[@id='3dadd2ff-33f1-41dd-85c7-bee5a7dfa413']/bs-gst:characteristics">
    <xsl:copy>
      <xsl:apply-templates select="bs-gst:characteristic[@name='WS']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='BS']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='S']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='Front']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='Side']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='Rear']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='I']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='A']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='HP']"/>
      <xsl:apply-templates select="bs-gst:characteristic[@name='Type']"/>
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>