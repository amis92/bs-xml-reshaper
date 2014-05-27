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
  
  <!-- Game System modification -->
  <!-- LD-> Ld touch-up -->
  <xsl:template match="bs-gst:characteristic[@name='LD']/@name" >
    <xsl:attribute name="name">Ld</xsl:attribute>
  </xsl:template>
  <!-- Ld@id in Monstrous Creature (Transport) touchup -->
  <xsl:template match="bs-gst:characteristic[@id='5466410f-5eb0-42d4-8c9a-50294d26a768']" >
    <xsl:element name="characteristic" namespace="{$gst-ns}" >
      <xsl:attribute name="id" >4a42059d-12cd-4c1f-a4c7-bb569d13eeea</xsl:attribute>
      <xsl:attribute name="name" >Ld</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <!-- Catalogue modification -->
  <!-- LD-> Ld touch-up -->
  <xsl:template match="bs-cat:characteristic[@name='LD']/@name" >
    <xsl:attribute name="name">Ld</xsl:attribute>
  </xsl:template>
  <!-- Ld@id in Monstrous Creature (Transport) touchup -->
  <xsl:template match="bs-cat:characteristic[@characteristicId='5466410f-5eb0-42d4-8c9a-50294d26a768']" >
    <xsl:element name="characteristic" namespace="{$cat-ns}" >
      <xsl:attribute name="characteristicId" >4a42059d-12cd-4c1f-a4c7-bb569d13eeea</xsl:attribute>
      <xsl:attribute name="name" >Ld</xsl:attribute>
      <xsl:attribute name="value" >
        <xsl:value-of select="@value"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>