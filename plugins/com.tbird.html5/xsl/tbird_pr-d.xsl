<?xml version="1.0" encoding="UTF-8" ?>
<!--
This file is part of the DITA Open Toolkit project.

Copyright 2004, 2005 IBM Corporation

See the accompanying LICENSE file for applicable license.
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="plugin:org.dita.html5:xsl/syntax-braces.xsl"/>

  <!-- TBIRD: Codeblocks have a label -->

  <xsl:template match="*[contains(@class, ' pr-d/codeblock ')]" name="topic.pr-d.codeblock">

    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
      mode="out-of-line"/>
    <xsl:call-template name="spec-title-nospace"/>

    <pre>
      <xsl:call-template name="commonattributes"/>
      <xsl:call-template name="setscale"/>
      <xsl:call-template name="setidaname"/>
  
  <div>
      <xsl:call-template name="getVariable">
        <xsl:with-param name="id" select="'code_example'"/>
      </xsl:call-template>
    </div>
  
      <code>
        <xsl:apply-templates/>
      </code>
    </pre>

    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
      mode="out-of-line"/>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' pr-d/codeph ')]" name="topic.pr-d.codeph">
    <code>
      <xsl:call-template name="commonattributes"/>
      <xsl:call-template name="setidaname"/>
      <xsl:apply-templates/>
    </code>
  </xsl:template>




</xsl:stylesheet>
