<?xml version="1.0" encoding="UTF-8"?>
<!--
This file is part of the DITA Open Toolkit project.

Copyright 2016 Jarno Elovirta

See the accompanying LICENSE file for applicable license.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  xmlns:related-links="http://dita-ot.sourceforge.net/ns/200709/related-links"
  xmlns:dita2html="http://dita-ot.sourceforge.net/ns/200801/dita2html"
  xmlns:ditamsg="http://dita-ot.sourceforge.net/ns/200704/ditamsg" version="2.0"
  exclude-result-prefixes="xs dita-ot related-links dita2html ditamsg ">

  <xsl:template match="*[contains(@class, ' task/taskbody ')]" name="topic.task.taskbody">
    <div>
      <xsl:call-template name="commonattributes"/>
      <xsl:call-template name="setidaname"/>
      <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
        mode="out-of-line"/>
      <!-- here, you can generate a toc based on what's a child of body -->
      <!--xsl:call-template name="gen-sect-ptoc"/-->
      <!-- Works; not always wanted, though; could add a param to enable it.-->

      <!-- Added for DITA 1.1 "Shortdesc proposal" -->
      <!-- get the abstract para -->
      <xsl:apply-templates select="preceding-sibling::*[contains(@class, ' topic/abstract ')]"
        mode="outofline"/>

      <!-- get the short descr para -->
      <xsl:apply-templates select="preceding-sibling::*[contains(@class, ' topic/shortdesc ')]"
        mode="outofline"/>

      <!-- Insert pre-req links here, after shortdesc - unless there is a prereq section about -->
      <xsl:if test="not(*[contains(@class, ' task/prereq ')])">
        <xsl:apply-templates
          select="following-sibling::*[contains(@class, ' topic/related-links ')]" mode="prereqs"/>
      </xsl:if>

      <!-- klopresti 2022-11-18 -->
      <!-- COMTECH SOLUTION ONE   -->
      <!-- individually dictate which task sections shoule be included, and when -->
      <xsl:apply-templates select="*[contains(@class, ' task/prereq ')]"/>
      <xsl:apply-templates select="*[contains(@class, ' task/context ')]"/>
      <xsl:apply-templates select="*[contains(@class, ' task/steps ')]"/>
      <xsl:apply-templates select="*[contains(@class, ' task/result ')]"/>

      <!-- COMTECH SOLUTION TWO   -->
      <!-- dictate that the context section must come first, and then be followed by anything that is not a context section -->
      <!--<xsl:apply-templates select="*[contains(@class, ' task/context ')]"/>
      <xsl:apply-templates select="*[not(self::*[contains(@class, ' task/context ')])]"/>-->

      <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
        mode="out-of-line"/>
    </div>
  </xsl:template>

</xsl:stylesheet>
