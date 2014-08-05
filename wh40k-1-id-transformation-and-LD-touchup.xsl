<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output omit-xml-declaration="no" encoding="UTF-8" standalone="yes" version="1.0" indent="yes" method="xml" />
  <!-- The Identity Transformation -->
  <!-- Whenever you match any node or any attribute -->
  <xsl:template match="node()|@*">
    <!-- Copy the current node -->
    <xsl:copy>
      <!-- Including any attributes it has and any child nodes -->
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>
  
  <!-- ID switching -->
  
  <!-- game-system id update -->
  <xsl:template match="@*[.='3d1a4963-0629-4025-a90b-76ab3d63c5c5']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">e1ebd931-a209-3ce4-87b4-d9918d25530b</xsl:attribute>
  </xsl:template>
  
  <!-- No Force Org -->
  <xsl:template match="@*[.='dd6e0525-13fe-b580-6b6c-e5b62523de16']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">ff36a6f3-19bf-4f48-8956-adacfd28fe74</xsl:attribute>
  </xsl:template>
  <!-- HQ -->
  <xsl:template match="@*[.='485123232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">848a6ff2-0def-4c72-8433-ff7da70e6bc7</xsl:attribute>
  </xsl:template>
  <!-- Elites -->
  <xsl:template match="@*[.='456c6974657323232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">638d74c6-bd97-4de5-b65a-6aaa24e9f4b2</xsl:attribute>
  </xsl:template>
  <!-- Troops -->
  <xsl:template match="@*[.='54726f6f707323232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">5d76b6f5-20ae-4d70-8f59-ade72a2add3a</xsl:attribute>
  </xsl:template>
  <!-- Fast Attack -->
  <xsl:template match="@*[.='466173742041747461636b23232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">c274d0b0-5866-44bc-9810-91c136ae7438</xsl:attribute>
  </xsl:template>
  <!-- Heavy Support -->
  <xsl:template match="@*[.='486561767920537570706f727423232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">abf5fd55-9ac7-4263-8bc1-a9fb0a8fa6a6</xsl:attribute>
  </xsl:template>
  <!-- Lords of War -->
  <xsl:template match="@*[.='caf7ecd5-8e33-4207-90d4-2ddf9d9c716f']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">c888f08a-6cea-4a01-8126-d374a9231554</xsl:attribute>
  </xsl:template>
  <!-- Extra Detachment -->
  <xsl:template match="@*[.='913c9505-bcc8-6e35-7625-4547285b6fde']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">7fc5b655-812e-45ed-98ff-db8847d356da</xsl:attribute>
  </xsl:template>
  <!-- Extra Ally Detachment -->
  <xsl:template match="@*[.='c46811fe-2a7e-ca07-2b85-897a3ffea612']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">5cb92cf6-7138-4816-b2b8-fe45e710b124</xsl:attribute>
  </xsl:template>
  <!-- Formation -->
  <xsl:template match="@*[.='9b34d4e2-a772-e953-e901-a416f40e53d6']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">28b94f51-e66b-4096-aa59-0c9df620a77d</xsl:attribute>
  </xsl:template>
  <!-- Fortification -->
  <xsl:template match="@*[.='466f7274696669636174696f6e23232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">d713cda3-5d0f-40d8-b621-69233263ec2a</xsl:attribute>
  </xsl:template>
  <!-- Extra Fortification Detachment -->
  <xsl:template match="@*[.='b38741cc-0b0b-0af2-d56a-683650a1cf85']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">7e7af1eb-a7d9-4d3b-b679-e57847607e7f</xsl:attribute>
  </xsl:template>
  <!-- Legendary Unit -->
  <xsl:template match="@*[.='a62054cf-c90a-2534-ebd1-020c1e6cf5b6']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">ee338739-6edf-4620-a2cc-f38d5dd21606</xsl:attribute>
  </xsl:template>
  <!-- Battle Formation -->
  <xsl:template match="@*[.='eead7129-69d4-bd07-8f3e-fb184f609e09']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">8dbf948c-125b-4886-b21e-3ccabc1e1188</xsl:attribute>
  </xsl:template>
  <!-- Spearhead -->
  <xsl:template match="@*[.='4e6b6976-205e-30bc-6939-df859d4b226c']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">38cf4ccf-0665-45cb-a773-fea06ee1467a</xsl:attribute>
  </xsl:template>
  <!-- Knights -->
  <xsl:template match="@*[.='04258a5b-7639-5cdb-af1f-ebcb15fe1a2d']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">3137a02e-72a5-4b5c-bcf3-54f567c8419c</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Unit Type -->
  <xsl:template match="@*[.='556e6974205479706523232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">c2b4b061-a0fd-499d-8a3d-6ee52587cbd5</xsl:attribute>
  </xsl:template>
  <!-- characteristic: WS -->
  <xsl:template match="@*[.='575323232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">5ee4ff0b-b244-4670-9d05-91d10f80c32e</xsl:attribute>
  </xsl:template>
  <!-- characteristic: BS -->
  <xsl:template match="@*[.='425323232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">f6f92f00-8bb1-4afa-8ccb-46310b7dd5e5</xsl:attribute>
  </xsl:template>
  <!-- characteristic: S -->
  <xsl:template match="@*[.='5323232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">da036dbb-32c2-430a-9dd5-aa74e0c4f74b</xsl:attribute>
  </xsl:template>
  <!-- characteristic: T -->
  <xsl:template match="@*[.='5423232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">3f9ed75c-36cd-4169-9cef-48391bb55cfd</xsl:attribute>
  </xsl:template>
  <!-- characteristic: W -->
  <xsl:template match="@*[.='5723232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">17ee558f-3014-4bd2-afc1-b474d8d2b7a8</xsl:attribute>
  </xsl:template>
  <!-- characteristic: I -->
  <xsl:template match="@*[.='4923232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">a558b3ef-04d0-440e-a312-bac3255bf592</xsl:attribute>
  </xsl:template>
  <!-- characteristic: A -->
  <xsl:template match="@*[.='4123232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">5dff3e7c-e024-4030-a71d-03195ec06ea7</xsl:attribute>
  </xsl:template>
  <!-- characteristic: LD -->
  <xsl:template match="@*[.='4c4423232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">4a42059d-12cd-4c1f-a4c7-bb569d13eeea</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Save -->
  <xsl:template match="@*[.='5361766523232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">b215fe72-dbce-4ad6-89ec-c4bb3962c39d</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Pg -->
  <xsl:template match="@*[.='506723232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">9ca713ea-39ce-4340-8871-d7c2312c1476</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Front -->
  <xsl:template match="@*[.='46726f6e7423232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">8cdd4fef-d1ba-4007-992c-b6f93e86d43f</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Side -->
  <xsl:template match="@*[.='5369646523232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">5f9a3780-eecb-4c70-be1d-e5bd06b06e9e</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Rear -->
  <xsl:template match="@*[.='5265617223232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">0a9f33cb-0412-420a-89d2-20707c360bd2</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Type -->
  <xsl:template match="@*[.='5479706523232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">077c342f-d7b9-45c6-b8af-88e97cafd3a2</xsl:attribute>
  </xsl:template>
  <!-- characteristic: HP -->
  <xsl:template match="@*[.='485023232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">ae95a1af-719f-4365-b951-33cd3ca9148a</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Structure Points -->
  <xsl:template match="@*[.='53747275637475726520506f696e747323232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">d0944b5d-ba54-4d6c-ad42-ca283a77d582</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Range -->
  <xsl:template match="@*[.='52616e676523232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">6fa97fa8-ea74-4a27-a0fb-bc4e5f367464</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Strength -->
  <xsl:template match="@*[.='537472656e67746823232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">a6383362-5aa8-4ff0-b1d0-00e059fc9d45</xsl:attribute>
  </xsl:template>
  <!-- characteristic: AP -->
  <xsl:template match="@*[.='415023232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">6abee736-f8d3-498e-97ac-a5c68445609f</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Description -->
  <xsl:template match="@*[.='4465736372697074696f6e23232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">21befb24-fc85-4f52-a745-64b2e48f8228</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Transport Capacity -->
  <xsl:template match="@*[.='5472616e73706f727420436170616369747923232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">6ef34aff-7c28-41dc-9341-b83301efc0f5</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Fire Points -->
  <xsl:template match="@*[.='4669726520506f696e747323232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">2fc5d197-0c39-4745-9a83-02fc5d080ec1</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Access Points -->
  <xsl:template match="@*[.='41636365737320506f696e747323232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">03931f31-ffab-4c06-b2df-d1064f4e309c</xsl:attribute>
  </xsl:template>
  <!-- characteristic: Ld -->
  <xsl:template match="@*[.='4c6423232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">5466410f-5eb0-42d4-8c9a-50294d26a768</xsl:attribute>
  </xsl:template>
  <!-- profileType: Unit -->
  <xsl:template match="@*[.='556e697423232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">2d6001b0-980e-46d2-bcc2-a9fc60109afd</xsl:attribute>
  </xsl:template>
  <!-- profileType: Vehicle -->
  <xsl:template match="@*[.='56656869636c6523232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">725a358c-765b-498c-8de5-399fc0c0725f</xsl:attribute>
  </xsl:template>
  <!-- profileType: Vehicle (Super Heavy) -->
  <xsl:template match="@*[.='56656869636c65202853757065722048656176792923232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">6e574719-7781-4bd0-8229-ebeb9337e645</xsl:attribute>
  </xsl:template>
  <!-- profileType: Walker -->
  <xsl:template match="@*[.='57616c6b657223232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">3dadd2ff-33f1-41dd-85c7-bee5a7dfa413</xsl:attribute>
  </xsl:template>
  <!-- profileType: Walker (Super Heavy) -->
  <xsl:template match="@*[.='57616c6b6572202853757065722048656176792923232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">536757ae-79d7-42c6-bc3e-01e87bed2151</xsl:attribute>
  </xsl:template>
  <!-- profileType: Weapon -->
  <xsl:template match="@*[.='576561706f6e23232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">d5f97c0b-9fc9-478d-aa34-a7c414d3ea48</xsl:attribute>
  </xsl:template>
  <!-- profileType: Monstrous Creature -->
  <xsl:template match="@*[.='4d6f6e7374726f757320437265617475726523232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">57aa5e90-5ee3-4059-8456-88bcc053dffa</xsl:attribute>
  </xsl:template>
  <!-- profileType: Wargear Item -->
  <xsl:template match="@*[.='57617267656172204974656d23232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">72c5eafc-75bf-4ed9-b425-78009f1efe82</xsl:attribute>
  </xsl:template>
  <!-- profileType: Vehicle (Transport) -->
  <xsl:template match="@*[.='56656869636c6520285472616e73706f72742923232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">068ce92f-2e44-41b7-8f5a-e87b096aaa92</xsl:attribute>
  </xsl:template>
  <!-- profileType: Monstrous Creature (Transport) -->
  <xsl:template match="@*[.='4d6f6e7374726f757320437265617475726520285472616e73706f72742923232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">9ebde0ec-eed0-4606-b537-e3ce32773707</xsl:attribute>
  </xsl:template>
  <!-- profileType: Vehicle (Super Heavy Transport) -->
  <xsl:template match="@*[.='56656869636c6520285375706572204865617679205472616e73706f72742923232344415441232323']">
    <xsl:attribute name="{name()}" namespace="{namespace-uri()}">4b0136c4-e036-49fd-9352-6e082921866d</xsl:attribute>
  </xsl:template>

  <!-- LD-> Ld touch-up -->
  <xsl:template match="characteristic[@name='LD']/@name" >
    <xsl:attribute name="name" namespace="{namespace-uri()}">Ld</xsl:attribute>
  </xsl:template>
  <!-- Ld@id in Monstrous Creature (Transport) touchup -->
  <xsl:template match="characteristic[@id='5466410f-5eb0-42d4-8c9a-50294d26a768']" >
    <xsl:element name="characteristic" namespace="{namespace-uri()}" >
      <xsl:attribute name="id" >4a42059d-12cd-4c1f-a4c7-bb569d13eeea</xsl:attribute>
      <xsl:attribute name="name" >Ld</xsl:attribute>
    </xsl:element>
  </xsl:template>

  <!-- Catalogue modification -->
  <!-- Ld@id in Monstrous Creature (Transport) touchup -->
  <xsl:template match="characteristic[@characteristicId='5466410f-5eb0-42d4-8c9a-50294d26a768']" >
    <xsl:element name="characteristic" namespace="{namespace-uri()}" >
      <xsl:attribute name="characteristicId" >4a42059d-12cd-4c1f-a4c7-bb569d13eeea</xsl:attribute>
      <xsl:attribute name="name" >Ld</xsl:attribute>
      <xsl:attribute name="value" >
        <xsl:value-of select="@value"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <!-- end of ID switching -->
</xsl:stylesheet>