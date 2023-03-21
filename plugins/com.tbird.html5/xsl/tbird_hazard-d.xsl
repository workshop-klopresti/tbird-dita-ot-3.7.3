<?xml version="1.0" encoding="UTF-8" ?>
<!--
This file is part of the DITA Open Toolkit project. 
See the accompanying license.txt file for applicable licenses.
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ditamsg="http://dita-ot.sourceforge.net/ns/200704/ditamsg"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ditamsg dita-ot xs">

  <!--  parameter that points to image; used later in template -->
  <xsl:param name="inline-hazard-svg" as="element()"
    select="document('plugin:org.dita.html5:resources/ISO_7010_W001_html.svg')/*"/>

  <!-- display <hazardstatement> as table with icon -->
  <xsl:template match="*[contains(@class, ' hazard-d/hazardstatement ')]">

    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]"/>
    <table role="presentation" border="2">
      <xsl:call-template name="commonattributes"/>
      <tr>
        <th colspan="2"> Hazard </th>
      </tr>
      <tr>
        <td>
          <xsl:apply-templates select="*[contains(@class, ' hazard-d/hazardsymbol ')]"/>
          <xsl:if test="empty(*[contains(@class, ' hazard-d/hazardsymbol ')])">
            <xsl:sequence select="$inline-hazard-svg"/>
          </xsl:if>
        </td>
        <td>
          <xsl:apply-templates select="*[contains(@class, ' hazard-d/messagepanel ')]"/>
        </td>
      </tr>
    </table>
    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]"/>
  </xsl:template>


</xsl:stylesheet>
