<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet exclude-result-prefixes="ditaarch opentopic e dita-ot opentopic-func" version="2.0"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.mycorp.pdf"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic="http://www.idiominc.com/opentopic"
  xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="*" mode="processTopicChapterInsideFlow">
    <fo:block xsl:use-attribute-sets="topic">
      <xsl:call-template name="commonattributes"/>
      <xsl:variable name="level" as="xs:integer">
        <xsl:apply-templates select="." mode="get-topic-level"/>
      </xsl:variable>
      <xsl:if test="$level eq 1">
        <fo:marker marker-class-name="current-topic-number">
          <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
          <xsl:for-each select="$topicref">
            <xsl:apply-templates select="." mode="topicTitleNumber"/>
          </xsl:for-each>
        </fo:marker>
        <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
      </xsl:if>
      
      <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>
      
      <xsl:apply-templates select="." mode="insertChapterFirstpageStaticContent">
        <xsl:with-param name="type" select="'chapter'"/>
      </xsl:apply-templates>
      
      <!-- use this block if chapter prefix is inline with title --> 
      <!--<fo:block xsl:use-attribute-sets="topic.title">
        <xsl:call-template name="pullPrologIndexTerms"/>
        <xsl:call-template name="getVariable">
          <xsl:with-param name="id" select="'Chapter with number'"/>
          <xsl:with-param name="params">
            <number>
                <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>              
            </number>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:for-each select="*[contains(@class,' topic/title ')]">
          <xsl:apply-templates select="." mode="getTitle"/>
        </xsl:for-each>
      </fo:block>-->
      
      <!-- use this block if chapter prefix is going to be a header before title -->
      <fo:block xsl:use-attribute-sets="topic.title">
        <xsl:call-template name="pullPrologIndexTerms"/>
        <xsl:for-each select="*[contains(@class,' topic/title ')]">
          <xsl:apply-templates select="." mode="getTitle"/>
        </xsl:for-each>
      </fo:block>
      
      <xsl:choose>
        <xsl:when test="$chapterLayout='BASIC'">
          <xsl:apply-templates select="*[not(contains(@class, ' topic/topic ') or contains(@class, ' topic/title ') or
            contains(@class, ' topic/prolog '))]"/>
          <!--xsl:apply-templates select="." mode="buildRelationships"/-->
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="." mode="createMiniToc"/>
        </xsl:otherwise>
      </xsl:choose>
      
      <xsl:apply-templates select="*[contains(@class,' topic/topic ')]"/>
      <xsl:call-template name="pullPrologIndexTerms.end-range"/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="*" mode="insertChapterFirstpageStaticContent">
    <xsl:param name="type" as="xs:string"/>
    <fo:block>
      <xsl:attribute name="id">
        <xsl:call-template name="generate-toc-id"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$type = 'chapter'">
          <!-- remove this block if chapter prefix is inline with title -->
          <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
            <xsl:call-template name="getVariable">
              <xsl:with-param name="id" select="'Chapter with number'"/>
              <xsl:with-param name="params">
                <number>
                  <fo:inline xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                    <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                  </fo:inline>
                </number>
              </xsl:with-param>
            </xsl:call-template>
          </fo:block>
        </xsl:when>
        <xsl:when test="$type = 'appendix'">
          <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
            <xsl:call-template name="getVariable">
              <xsl:with-param name="id" select="'Appendix with number'"/>
              <xsl:with-param name="params">
                <number>
                  <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                    <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                  </fo:block>
                </number>
              </xsl:with-param>
            </xsl:call-template>
          </fo:block>
        </xsl:when>
        <xsl:when test="$type = 'appendices'">
          <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
            <xsl:call-template name="getVariable">
              <xsl:with-param name="id" select="'Appendix with number'"/>
              <xsl:with-param name="params">
                <number>
                  <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                    <xsl:text>&#xA0;</xsl:text>
                  </fo:block>
                </number>
              </xsl:with-param>
            </xsl:call-template>
          </fo:block>
        </xsl:when>
        <xsl:when test="$type = 'part'">
          <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
            <xsl:call-template name="getVariable">
              <xsl:with-param name="id" select="'Part with number'"/>
              <xsl:with-param name="params">
                <number>
                  <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                    <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                  </fo:block>
                </number>
              </xsl:with-param>
            </xsl:call-template>
          </fo:block>
        </xsl:when>
        <xsl:when test="$type = 'preface'">
          <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
            <xsl:call-template name="getVariable">
              <xsl:with-param name="id" select="'Preface title'"/>
            </xsl:call-template>
          </fo:block>
        </xsl:when>
        <xsl:when test="$type = 'notices'">
          <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
            <xsl:call-template name="getVariable">
              <xsl:with-param name="id" select="'Notices title'"/>
            </xsl:call-template>
          </fo:block>
        </xsl:when>
      </xsl:choose>
    </fo:block>
  </xsl:template>

  <!-- prefix page numbers (not compatible with Apache FOP --> 
  <xsl:template name="startPageNumbering">   
    <!--<xsl:variable as="xs:string" name="topicType">
      <xsl:call-template name="determineTopicType" />
    </xsl:variable>
    <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)" />
    <xsl:for-each select="$topicref[1]">
      <xsl:choose>
        <xsl:when test="$topicType = 'topicChapter'">
          <xsl:attribute name="initial-page-number">1</xsl:attribute>
          <fo:folio-prefix>
            <xsl:number count="*[contains(@class, ' bookmap/chapter ')]" format="1" />
            <xsl:text>–</xsl:text>
          </fo:folio-prefix>
        </xsl:when>
        <xsl:when test="$topicType = ('topicAppendix', 'topicAppendices')">
          <xsl:attribute name="initial-page-number">1</xsl:attribute>
          <fo:folio-prefix>
            <xsl:number count="*[contains(@class, ' bookmap/appendix ')]" format="A" />
            <xsl:text>–</xsl:text>
          </fo:folio-prefix>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>-->    
  </xsl:template>
  
</xsl:stylesheet>
