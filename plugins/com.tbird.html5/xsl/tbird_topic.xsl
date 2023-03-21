<?xml version="1.0" encoding="UTF-8"?>
<!--
This file is part of the DITA Open Toolkit project.
See the accompanying LICENSE file for applicable license.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  xmlns:dita2html="http://dita-ot.sourceforge.net/ns/200801/dita2html"
  xmlns:ditamsg="http://dita-ot.sourceforge.net/ns/200704/ditamsg" version="2.0"
  exclude-result-prefixes="xs dita-ot dita2html ditamsg">

  <!-- TBIRD: DITA paragraphs should always be div elements in HTML output -->
  <xsl:template match="*[contains(@class, ' topic/p ')]" name="topic.p">
    <div>
      <xsl:call-template name="commonattributes"/>
      <xsl:call-template name="setid"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  


  <!-- =========== SECTION =========== -->
  <!-- section processor - div with no generated title -->
  <xsl:template match="*[contains(@class, ' topic/section ')]" name="topic.section">
    <section class="section">
      <xsl:call-template name="commonattributes"/>
      <xsl:call-template name="gen-toc-id"/>
      <xsl:call-template name="setidaname"/>
      <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
        mode="out-of-line"/>
      <xsl:apply-templates select="." mode="dita2html:section-heading"/>
      <!--  when section @outputclass=accordion put everything after the title in a <div>  -->
      <xsl:choose>
        <xsl:when test="@outputclass = 'accordion'">
          <div>
            <xsl:apply-templates
              select="*[not(contains(@class, ' topic/title '))] | text() | comment() | processing-instruction()"
            > </xsl:apply-templates>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates
            select="*[not(contains(@class, ' topic/title '))] | text() | comment() | processing-instruction()"> </xsl:apply-templates>

        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
        mode="out-of-line"/>
    </section>
  </xsl:template>

  <!-- =========== NOTES =========== -->

  <xsl:template match="*" mode="process.note.other">
    <xsl:choose>
      <xsl:when test="@othertype">
        <xsl:apply-templates select="." mode="process.note.common-processing">
          <xsl:with-param name="type" select="'note'"/>
          <xsl:with-param name="title" select="string(@othertype)"/>
        </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="process.note.common-processing">
          <xsl:with-param name="type" select="'note'"/>
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--  don't output notes with type="other" othertype="service" -->
  <!--  To override a single note type, match the class with mode="process.note.(selected-type)"  -->
  <xsl:template match="*[@othertype = 'service']" mode="process.note.other">
    <xsl:apply-templates> </xsl:apply-templates>
  </xsl:template>

  <!--  
  EXERCISE
  definition lists should not be transformed to <dl> in HTML
	try a <ul> 
	try stacked blocks 
	try sections with dt as a title/heading
	
	xsl:call-template calls common utilities (name="commonattributes" name="setaname"   -->

  <!-- =========== DEFINITION LIST =========== -->
  <!--
  <!-\- DL -\->
  <xsl:template match="*[contains(@class, ' topic/dl ')]" name="topic.dl">
    <xsl:call-template name="setaname"/>
    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
      mode="out-of-line"/>
    <!-\-  Insert HTML element here <ul>  -\->
    <ul>
      <!-\- handle DL compacting - default=yes -\->
      <xsl:if test="@compact = 'no'">
        <xsl:attribute name="class">dlexpand</xsl:attribute>
      </xsl:if>
      <xsl:call-template name="commonattributes"/>
      <xsl:apply-templates select="@compact"/>
      <xsl:call-template name="setid"/>
      <xsl:apply-templates/>
    </ul>
    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
      mode="out-of-line"/>
  </xsl:template>

  <!-\- DL Entry -\->
  <xsl:template match="*[contains(@class, ' topic/dlentry ')]" name="topic.dlentry">
    <!-\-  Insert HTML element here <li>  -\->

    <li>
      <xsl:call-template name="commonattributes"/>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <!-\- DL term -\->
  <xsl:template match="*[contains(@class, ' topic/dt ')]" mode="output-dt">
    <xsl:variable name="is-first-dt"
      select="empty(preceding-sibling::*[contains(@class, ' topic/dt ')])"/>
    <xsl:variable name="dt-class">
      <xsl:choose>
        <!-\- handle non-compact list items -\->
        <xsl:when test="$is-first-dt and ../../@compact = 'no'">dltermexpand</xsl:when>
        <xsl:otherwise>dlterm</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-\-  Insert HTML element here <dt> to <span> -\->
    <span>
      <!-\- Get xml:lang and ditaval styling from DLENTRY, then override with local -\->
      <xsl:apply-templates select="../@xml:lang"/>
      <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-startprop ')]/@style"
        mode="add-ditaval-style"/>
      <xsl:for-each select="..">
        <xsl:call-template name="commonattributes"/>
      </xsl:for-each>
      <xsl:call-template name="commonattributes">
        <xsl:with-param name="default-output-class" select="$dt-class"/>
      </xsl:call-template>
      <!-\- handle ID on a DLENTRY -\->
      <xsl:choose>
        <xsl:when test="$is-first-dt and exists(../@id) and exists(@id)">
          <xsl:call-template name="setidaname"/>
          <a id="{dita-ot:get-prefixed-id(.., ../@id)}"/>
        </xsl:when>
        <xsl:when test="$is-first-dt and exists(../@id) and empty(@id)">
          <xsl:for-each select="..">
            <xsl:call-template name="setidaname"/>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="setidaname"/>
        </xsl:otherwise>
      </xsl:choose>
      <!-\- Use flags from parent dlentry, if present -\->
      <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
        mode="out-of-line"/>
      <xsl:apply-templates/>
      <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
        mode="out-of-line"/>
    </span>
  </xsl:template>

  <!-\- DL description -\->
  <xsl:template match="*[contains(@class, ' topic/dd ')]" name="topic.dd">
    <xsl:variable name="is-first-dd"
      select="empty(preceding-sibling::*[contains(@class, ' topic/dd ')])"/>
    <span>
      <xsl:for-each select="..">
        <xsl:call-template name="commonattributes"/>
      </xsl:for-each>
      <xsl:call-template name="commonattributes">
        <xsl:with-param name="default-output-class">
          <xsl:if test="not($is-first-dd)">
            <!-\- para space before 2 thru N -\->
            <xsl:text>ddexpand</xsl:text>
          </xsl:if>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="setidaname"/>
      <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
        mode="out-of-line"/>
      <xsl:apply-templates/>
      <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
        mode="out-of-line"/>
    </span>
  </xsl:template>-->

  <!-- =========== FOOTER =========== -->
  <xsl:template match="/|node()|@*" mode="gen-user-footer">
    <!-- to customize: copy this to your override transform, add the content you want. -->
    <!-- it will be placed in the FOOTER section of the XHTML. -->
    <div class="footer">
      <div class="footer-content">
        <p class="slogan">
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'slogan'"/>
          </xsl:call-template>
        </p>
        <p class="copytright"> &#xa9;<xsl:value-of select="format-date(current-date(), '[Y0001]')"
          />, <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'copyright'"/>
          </xsl:call-template>
        </p>
        <p class="address">
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'address'"/>
          </xsl:call-template>
        </p>

      </div>
    </div>
  </xsl:template>

  <!--  MODES DEFINED -->
  <!--  Sometimes the same input content needs to appear multiple times in the output document, formatted according to a different template each time. 
    For instance, the titles of the chapters in a book formatted one way, formatted a different way in the table of contents. 
    Both xsl:apply-templates and xsl:template elements can have optional mode attributes that connect different template rules to different uses. 
    A mode attribute on xsl:template element identifies in which mode that template rule should be activated.  -->
  <!-- remove undefined class applied to map title in html output  <span class="undefined_element">T-Bird User Guide</span>" -->
  <xsl:template mode="header-title" match="*[contains(@class, ' topic/title ')]">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- =========== HEADER =========== -->
  <xsl:template match="/|node()|@*" mode="gen-user-head">
    <!-- to customize: copy this to your override transform, add the content you want. -->
    <!-- it will be placed in the HEAD section of the XHTML. -->
    <div class="header">
      <div class="header-content">
        <p>
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'header_label'"/>
          </xsl:call-template>
        </p>

        <p>
          <!--   insert the title of the map  -->
          <!--   Note:  title is not direct child of map, title is a descendant of map     -->
          <!--    grab map title: method 1  grab the map, then the title  -->
          <xsl:apply-templates
            select="$input.map/*[contains(@class, ' map/map ')]/*[contains(@class, ' topic/title ')]"
            mode="header-title"/>
          <!--    grab map title: method 2 use double-slash // to indicate descendant, "find a title element anywhere inside the map" -->
          <!--    <xsl:apply-templates select="$input.map//*[contains(@class, ' topic/title ')]"/> -->
        </p>
      </div>
    </div>
  </xsl:template>



</xsl:stylesheet>
