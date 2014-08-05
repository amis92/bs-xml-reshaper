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


  
  
  <!-- Structure Points removal -->

  <!-- Game System modification -->
  <xsl:template match="bs-gst:characteristic[@id='d0944b5d-ba54-4d6c-ad42-ca283a77d582']" />
  <!-- Catalogue modification -->
  <xsl:template match="bs-cat:characteristic[@characteristicId='d0944b5d-ba54-4d6c-ad42-ca283a77d582']" />

  
  <!-- Vehicle touch up -->
  <!-- Catalogue - only rework, just delete profile type from gst -->
  
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
</xsl:stylesheet>