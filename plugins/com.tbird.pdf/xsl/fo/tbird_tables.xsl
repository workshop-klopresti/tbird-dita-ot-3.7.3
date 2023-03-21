<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet exclude-result-prefixes="ditaarch opentopic e dita-ot opentopic-func" version="2.0"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.mycorp.pdf"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- DEFINITION LIST STACKED -->
    <!--<!-\- Changed dl from a table (tabs) to stacked headings one block for the dl, one block for dentry, one for dt and dd -\->
    <xsl:template match="*[contains(@class, ' topic/dl ')]">
        <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
            mode="outofline"/>
        <fo:block xsl:use-attribute-sets="dl">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
        <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
            mode="outofline"/>
    </xsl:template>
  
  <!-\- DEFINITION HEAD -\->
    <!-\- Supress definition list head -\->
    <xsl:template match="*[contains(@class, ' topic/dl ')]/*[contains(@class, ' topic/dlhead ')]"/>
  
  
  <!-\- DEFINITION ENTRY -\->
  <!-\- Changed entry from table row to block -\->
   <xsl:template match="*[contains(@class, ' topic/dlentry ')]">
        <fo:block xsl:use-attribute-sets="dlentry">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

  <!-\- DEFINITION TERM -\->
    <!-\- Changed definition term bold and bulleted -\->
    <xsl:template match="*[contains(@class, ' topic/dt ')]">
        <fo:block xsl:use-attribute-sets="dlentry.dt__content">
            <xsl:if test="not(preceding-sibling::*[contains(@class, ' topic/dt ')])">
                <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
                    mode="outofline"/>
            </xsl:if>
            <xsl:apply-templates select="." mode="inlineTextOptionalKeyref"/>
        </fo:block>
    </xsl:template>

    <!-\- Changed definition term bold and bulleted -\->

  <!-\- DEFINITION DESCRIPTION -\->
    <xsl:template match="*[contains(@class, ' topic/dd ')]">
        <fo:block xsl:use-attribute-sets="dlentry.dd__content">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
            <xsl:if test="not(following-sibling::*[contains(@class, ' topic/dd ')])">
                <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
                    mode="outofline"/>
            </xsl:if>
        </fo:block>
    </xsl:template>
    -->
    
  <!-- DEFINITION LIST BULLETS -->    
    <!-- use these for definition list as bulleted list -->
    <xsl:template match="*[contains(@class, ' topic/dl ')]">
    <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-startprop ')]" mode="outofline"/>
    <fo:list-block xsl:use-attribute-sets="dl-list">
      <xsl:call-template name="commonattributes"/>
      <xsl:apply-templates/>
    </fo:list-block>
    <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-endprop ')]" mode="outofline"/>
  </xsl:template>  
  <xsl:template match="*[contains(@class, ' topic/dl ')]/*[contains(@class, ' topic/dlhead ')]"/>  
  <xsl:template match="*[contains(@class, ' topic/dlentry ')]">
    <fo:list-item xsl:use-attribute-sets="dlentry">
      <xsl:call-template name="commonattributes"/>
      <fo:list-item-label xsl:use-attribute-sets="dlentry__label">
        <fo:block xsl:use-attribute-sets="dlentry__label__content">
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'Unordered List bullet'"/>
          </xsl:call-template>
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body xsl:use-attribute-sets="dlentry__body">
        <fo:block xsl:use-attribute-sets="dlentry__content">
          <xsl:apply-templates/>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>  
  <xsl:template match="*[contains(@class, ' topic/dt ')]">
    <fo:block xsl:use-attribute-sets="dt">
      <xsl:call-template name="commonattributes"/>
      <xsl:if test="not(preceding-sibling::*[contains(@class, ' topic/dt ')])">
        <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
          mode="outofline"/>
      </xsl:if>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>  
  <xsl:template match="*[contains(@class, ' topic/dd ')]">
    <fo:block xsl:use-attribute-sets="dd">
      <xsl:call-template name="commonattributes"/>
      <xsl:apply-templates/>
      <xsl:if test="not(following-sibling::*[contains(@class, ' topic/dd ')])">
        <xsl:apply-templates select="../*[contains(@class, ' ditaot-d/ditaval-endprop ')]"
          mode="outofline"/>
      </xsl:if>
    </fo:block>
  </xsl:template>

</xsl:stylesheet>
