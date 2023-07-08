<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet exclude-result-prefixes="ditaarch opentopic e dita-ot opentopic-func" version="2.0"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.mycorp.pdf"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic="http://www.idiominc.com/opentopic"
  xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="header">
    <fo:block-container xsl:use-attribute-sets="header-logo-container">
      <fo:block>
        <fo:external-graphic src="url('Customization/OpenTopic/common/artwork/logoipsum-285.svg')" xsl:use-attribute-sets="header-logo"/>
      </fo:block>
    </fo:block-container>
    <fo:block xsl:use-attribute-sets="__body__odd__header">
      <xsl:call-template name="getVariable">
        <xsl:with-param name="id" select="'Body odd header'"/>
        <xsl:with-param name="params">
          <heading>
            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
              <fo:retrieve-marker retrieve-class-name="current-header"/>
            </fo:inline>
          </heading>
        </xsl:with-param>
      </xsl:call-template>
    </fo:block>
    <fo:block xsl:use-attribute-sets="header-leader">
      <fo:leader/>
    </fo:block>
  </xsl:template>

  <xsl:template name="insertBodyOddHeader">
    <fo:static-content flow-name="odd-body-header">
      <xsl:call-template name="header"/>
    </fo:static-content>
  </xsl:template>
  
  <xsl:template name="insertBodyFirstHeader">
    <fo:static-content flow-name="first-body-header">
      <xsl:call-template name="header"/>
    </fo:static-content>
  </xsl:template>
  
  <xsl:template name="insertBodyLastHeader">
    <fo:static-content flow-name="last-body-header">
      <xsl:call-template name="header"/>
    </fo:static-content>
  </xsl:template>

  <xsl:template name="insertTocOddHeader">
    <fo:static-content flow-name="odd-toc-header">
      <xsl:call-template name="header"/>
    </fo:static-content>
  </xsl:template>

  <xsl:template name="insertIndexOddHeader">
    <fo:static-content flow-name="odd-index-header">
      <xsl:call-template name="header"/>
    </fo:static-content>
  </xsl:template>
  
  <xsl:template name="footer">
    <fo:block xsl:use-attribute-sets="footer-leader">
      <fo:leader/>
    </fo:block>
    <fo:block xsl:use-attribute-sets="__body__odd__footer">
      <xsl:call-template name="getVariable">
        <xsl:with-param name="id" select="'Body odd footer'"/>
        <xsl:with-param name="params">
          <copyright>
            <fo:inline xsl:use-attribute-sets="__body__odd__footer__copyright">
              <xsl:call-template name="getVariable">
                <xsl:with-param name="id" select="'Copyright'"/>
                <xsl:with-param name="params">
                  <year>
                    <xsl:value-of select="format-date(current-date(), '[Y0001]')"/>
                  </year>
                </xsl:with-param>
              </xsl:call-template>
            </fo:inline>
            <fo:leader leader-pattern="space"/>
          </copyright>
          <pagenum>
            <fo:inline xsl:use-attribute-sets="__body__odd__footer__pagenum">
              <fo:page-number/>
            </fo:inline>
            <fo:leader leader-pattern="space"/>
          </pagenum>
          <title>
            <fo:inline xsl:use-attribute-sets="__body__odd__footer__title">
              <xsl:apply-templates mode="dita-ot:title-metadata" select="/"/>
            </fo:inline>
          </title>
        </xsl:with-param>
      </xsl:call-template>
    </fo:block>
  </xsl:template>

  <xsl:template name="insertBodyOddFooter">
    <fo:static-content flow-name="odd-body-footer">
      <xsl:call-template name="footer"/>
    </fo:static-content>
  </xsl:template>
  
  <xsl:template name="insertBodyFirstFooter">
    <fo:static-content flow-name="first-body-footer">
      <xsl:call-template name="footer"/>
    </fo:static-content>
  </xsl:template>
  
  <xsl:template name="insertBodyLastFooter">
    <fo:static-content flow-name="last-body-footer">
      <xsl:call-template name="footer"/>
    </fo:static-content>
  </xsl:template>

  <xsl:template name="insertTocOddFooter">
    <fo:static-content flow-name="odd-toc-footer">
      <xsl:call-template name="footer"/>
    </fo:static-content>
  </xsl:template>

  <xsl:template name="insertIndexOddFooter">
    <fo:static-content flow-name="odd-index-footer">
      <xsl:call-template name="footer"/>
    </fo:static-content>
  </xsl:template>

</xsl:stylesheet>
