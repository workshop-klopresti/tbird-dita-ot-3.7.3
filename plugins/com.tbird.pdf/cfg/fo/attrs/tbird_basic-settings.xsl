<?xml version="1.0" encoding="utf-8"?>
<!--
This file is part of the DITA Open Toolkit project.
See the accompanying LICENSE file for applicable license.
-->
<!-- (c) Copyright Suite Solutions -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="2.0"
                exclude-result-prefixes="xs">

  <xsl:param name="locale"/>
  <xsl:param name="customizationDir.url"/>
  <xsl:param name="artworkPrefix"/>
  <xsl:param name="publishRequiredCleanup"/>
  <xsl:param name="DRAFT"/>
  <xsl:param name="artLabel" select="'no'"/>
  <xsl:param name="output.dir.url"/>
  <xsl:param name="work.dir.url"/>
  <!-- Deprecated since 3.0 -->
  <xsl:param name="input.dir.url"/>
  <xsl:param name="pdfFormatter" select="'fop'"/>
  
  <xsl:param name="tocMaximumLevel" select="3"/>
  <xsl:param name="antArgsGenerateTaskLabels"/>


  <xsl:param name="antArgsBookmarkStyle"/>
  <!-- Values are COLLAPSED or EXPANDED. If a value is passed in from Ant, use that value. -->
  <xsl:variable name="bookmarkStyle" select="if (normalize-space($antArgsBookmarkStyle)) then $antArgsBookmarkStyle else 'COLLAPSE'"/>

  <!-- Determine how to style topics referenced by <chapter>, <part>, etc. Values are:
         MINITOC: render with a MiniToc on left, content indented on right.
         BASIC: render the same way as any topic. -->
  <xsl:param name="antArgsChapterLayout"/>
  <xsl:variable name="chapterLayout" select="if (normalize-space($antArgsChapterLayout)) then $antArgsChapterLayout else 'MINITOC'"/>

  <xsl:param name="appendixLayout" select="$chapterLayout"/>
  <xsl:param name="appendicesLayout" select="$chapterLayout"/>
  <xsl:param name="partLayout" select="$chapterLayout"/>
  <xsl:param name="noticesLayout" select="$chapterLayout"/>

  <!-- list of supported link roles -->
  <xsl:param name="include.rellinks"/>
  <xsl:variable name="includeRelatedLinkRoles" select="tokenize(normalize-space($include.rellinks), '\s+')" as="xs:string*"/>

  <!-- The default of 215.9mm x 279.4mm is US Letter size (8.5x11in) -->
  <xsl:variable name="page-width">215.9mm</xsl:variable>
  <xsl:variable name="page-height">279.4mm</xsl:variable>

<!--PAGE MARGINS with VARIABLES
  <!-\- This is the default, but you can set the margins individually below. -\->
  <xsl:variable name="page-margins">20mm</xsl:variable>

  <!-\- Change these if your page has different margins on different sides. -\->
  <xsl:variable name="page-margin-inside" select="$page-margins"/>
  <xsl:variable name="page-margin-outside" select="$page-margins"/>
  <xsl:variable name="page-margin-top" select="$page-margins"/>
  <xsl:variable name="page-margin-bottom" select="$page-margins"/>-->
  
  <!--   PAGE MARGINS UNIQUE-->
  <xsl:variable name="page-margin-top">1.25in</xsl:variable>
  <xsl:variable name="page-margin-outside">0.75in</xsl:variable>
  <xsl:variable name="page-margin-bottom">1in</xsl:variable>
  <xsl:variable name="page-margin-inside">0.75in</xsl:variable>

  <!--The side column width is the amount the body text is indented relative to the margin. -->
  <xsl:variable name="side-col-width">0.25in</xsl:variable>

  <xsl:variable name="mirror-page-margins" select="false()"/>

  <xsl:variable name="default-font-size">10pt</xsl:variable>
  <xsl:variable name="default-line-height">1.2</xsl:variable>

  <xsl:variable name="generate-front-cover" select="true()"/>
  <xsl:variable name="generate-back-cover" select="false()"/>
  <xsl:variable name="generate-toc" select="true()"/>
  


</xsl:stylesheet>
