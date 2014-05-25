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
  <xsl:template match="//nodeName[@attributeName='###']" />
  
  <!--example: remove all characteristics named "Pg":-->
  <!--
  <xsl:template match="//characteristic[@name='Pg']" />
  -->
</xsl:stylesheet>