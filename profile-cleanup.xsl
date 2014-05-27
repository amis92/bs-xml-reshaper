<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:bs-gst="http://www.battlescribe.net/schema/gameSystemSchema"
xmlns:bs-cat="http://www.battlescribe.net/schema/catalogueSchema">

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

  <!-- removing Transport Capacity-->
  <!-- <xsl:template match="bs-gst:characteristic[@id='6ef34aff-7c28-41dc-9341-b83301efc0f5']" />-->
  <!-- removing Fire Points-->
  <!-- <xsl:template match="bs-gst:characteristic[@id='2fc5d197-0c39-4745-9a83-02fc5d080ec1']" />-->
  <!-- removing Access Points-->
  <!-- <xsl:template match="bs-gst:characteristic[@id='03931f31-ffab-4c06-b2df-d1064f4e309c']" />-->
  <!-- removing Pg-->
  <!-- <xsl:template match="bs-gst:characteristic[@id='9ca713ea-39ce-4340-8871-d7c2312c1476']" />-->



  <!-- removing Transport Capacity-->
  <xsl:template match="bs-cat:characteristic[@characteristicId='6ef34aff-7c28-41dc-9341-b83301efc0f5']" />
  <!-- removing Fire Points-->
  <xsl:template match="bs-cat:characteristic[@characteristicId='2fc5d197-0c39-4745-9a83-02fc5d080ec1']" />
  <!-- removing Access Points-->
  <xsl:template match="bs-cat:characteristic[@characteristicId='03931f31-ffab-4c06-b2df-d1064f4e309c']" />
  <!-- removing Pg-->
  <xsl:template match="bs-cat:characteristic[@characteristicId='9ca713ea-39ce-4340-8871-d7c2312c1476']" />
</xsl:stylesheet>