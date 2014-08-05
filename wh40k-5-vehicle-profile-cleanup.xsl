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
  
  
  <!-- Vehicle touch up -->
  
  <!-- Super-heavy Transport id switch to Vehicle -->
  <xsl:template match="bs-cat:profile[@profileTypeId='4b0136c4-e036-49fd-9352-6e082921866d']/@profileTypeId">
    <xsl:attribute name="profileTypeId">725a358c-765b-498c-8de5-399fc0c0725f</xsl:attribute>
  </xsl:template>

  <!-- Super-heavy id switch to Vehicle -->
  <xsl:template match="bs-cat:profile[@profileTypeId='6e574719-7781-4bd0-8229-ebeb9337e645']/@profileTypeId">
    <xsl:attribute name="profileTypeId">725a358c-765b-498c-8de5-399fc0c0725f</xsl:attribute>
  </xsl:template>
  
  <!-- Transport id switch to Vehicle -->
  <xsl:template match="bs-cat:profile[@profileTypeId='068ce92f-2e44-41b7-8f5a-e87b096aaa92']/@profileTypeId">
    <xsl:attribute name="profileTypeId">725a358c-765b-498c-8de5-399fc0c0725f</xsl:attribute>
  </xsl:template>

  <!-- now all ids are switched to Vehicle's, we resort characteristics only in normal-vehicle-id nodes -->
  <!-- Vehicle (normal) resorting (Type <-> HP) -->
  <xsl:template match="bs-cat:profile[@profileTypeId='725a358c-765b-498c-8de5-399fc0c0725f']/bs-cat:characteristics">
    <xsl:copy>
      <xsl:apply-templates select="bs-cat:characteristic[@name='BS']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='Front']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='Side']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='Rear']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='HP']"/>
      <xsl:apply-templates select="bs-cat:characteristic[@name='Type']"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>