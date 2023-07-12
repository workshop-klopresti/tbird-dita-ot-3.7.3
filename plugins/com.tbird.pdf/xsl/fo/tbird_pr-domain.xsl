<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xs">




    <xsl:template match="*[contains(@class, ' pr-d/codeblock ')]">
        <xsl:call-template name="generateAttrLabel"/>
        <!--  xsl:use-attribute-sets="codeblock-label" found in tbird_pr-domain-attr.xsl    -->
        <fo:block xsl:use-attribute-sets="codeblock-label">
<!--            variable found in tbird_strings.xml-->
            <xsl:call-template name="getVariable">
                <xsl:with-param name="id" select="'title_codeblock'"/>
            </xsl:call-template>
            <!--  xsl:use-attribute-sets="codeblock-content" found in tbird_pr-domain-attr.xsl    -->
            
            <fo:block xsl:use-attribute-sets="codeblock-content">
                <xsl:call-template name="commonattributes"/>
                <xsl:call-template name="setFrame"/>
                <xsl:call-template name="setScale"/>
                <xsl:call-template name="setExpanse"/>
                <xsl:variable name="codeblock.line-number" as="xs:boolean">
                    <xsl:apply-templates select="." mode="codeblock.generate-line-number"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when
                        test="$codeblock.wrap or $codeblock.line-number">
                        <xsl:variable name="content" as="node()*">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$codeblock.line-number">
                                <xsl:variable name="buf" as="document-node()">
                                    <xsl:document>
                                        <xsl:processing-instruction name="line-number"/>
                                        <xsl:apply-templates select="$content"
                                            mode="codeblock.line-number"/>
                                    </xsl:document>
                                </xsl:variable>
                                <xsl:variable name="line-count"
                                    select="count($buf/descendant::processing-instruction('line-number'))"/>
                                <xsl:apply-templates select="$buf" mode="codeblock">
                                    <xsl:with-param name="line-count" select="$line-count"
                                        tunnel="yes"/>
                                </xsl:apply-templates>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="$content" mode="codeblock">
                                </xsl:apply-templates>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </fo:block>
        </fo:block>
    </xsl:template>

    <!--<xsl:variable name="codeblock.wrap" select="true()"/>-->

</xsl:stylesheet>
