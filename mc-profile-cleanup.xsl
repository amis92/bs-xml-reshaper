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
  
  
  <!-- Monstrous Creature touch up -->
  
  <!-- adding 'Unit Type' characteristic -->
  <xsl:template match="bs-cat:profile[@profileTypeId='57aa5e90-5ee3-4059-8456-88bcc053dffa']/bs-cat:characteristics" >
    <xsl:copy>
      <xsl:element name="characteristic" namespace="{$cat-ns}">
        <xsl:attribute name="characteristicId">c2b4b061-a0fd-499d-8a3d-6ee52587cbd5</xsl:attribute>
        <xsl:attribute name="name">Unit Type</xsl:attribute>
        <xsl:attribute name="value">Monstrous Creature</xsl:attribute>
      </xsl:element>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- id switching (for Unit id) -->
  <xsl:template match="bs-cat:profile[@profileTypeId='57aa5e90-5ee3-4059-8456-88bcc053dffa']/@profileTypeId" >
    <xsl:attribute name="profileTypeId" >2d6001b0-980e-46d2-bcc2-a9fc60109afd</xsl:attribute>
  </xsl:template>

  <!-- Monstrous Creature (Transport) touch up -->

  <!-- adding 'Unit Type' characteristic -->
  <xsl:template match="bs-cat:profile[@profileTypeId='9ebde0ec-eed0-4606-b537-e3ce32773707']/bs-cat:characteristics" >
    <xsl:copy>
      <xsl:element name="characteristic" namespace="{$cat-ns}">
        <xsl:attribute name="characteristicId">c2b4b061-a0fd-499d-8a3d-6ee52587cbd5</xsl:attribute>
        <xsl:attribute name="name">Unit Type</xsl:attribute>
        <xsl:attribute name="value">Monstrous Creature</xsl:attribute>
      </xsl:element>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- id switching (for Unit id) -->
  <xsl:template match="bs-cat:profile[@profileTypeId='9ebde0ec-eed0-4606-b537-e3ce32773707']/@profileTypeId" >
    <xsl:attribute name="profileTypeId" >2d6001b0-980e-46d2-bcc2-a9fc60109afd</xsl:attribute>
  </xsl:template>
  
  
</xsl:stylesheet>