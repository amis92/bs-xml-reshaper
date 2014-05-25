<?xml version="1.0" encoding="UTF-8"?>
<!-- The Identity Transformation -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Whenever you match any node or any attribute -->
  <xsl:template match="node()|@*">
    <!-- Copy the current node -->
    <xsl:copy>
      <!-- Including any attributes it has and any child nodes -->
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!--removing specified nodes-->
  <!--nodeName - replace with name of nodes you want to remove-->
  <!--attributeName - replace with name of attribute to meet value criterion-->
  <!--### - replace with value of attribute to match-->
  <!--
  <xsl:template match="//nodeName[@attributeName='###']" />
  -->
  
  <!-- removing Transport Capacity-->
  <xsl:template match="//characteristic[@id='6ef34aff-7c28-41dc-9341-b83301efc0f5']" />
  <!-- removing Fire Points-->
  <xsl:template match="//characteristic[@id='2fc5d197-0c39-4745-9a83-02fc5d080ec1']" />
  <!-- removing Access Points-->
  <xsl:template match="//characteristic[@id='03931f31-ffab-4c06-b2df-d1064f4e309c']" />
  <!-- removing Pg-->
  <xsl:template match="//characteristic[@id='9ca713ea-39ce-4340-8871-d7c2312c1476']" />
</xsl:stylesheet>