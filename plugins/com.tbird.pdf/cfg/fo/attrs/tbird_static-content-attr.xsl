<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet exclude-result-prefixes="xs ditaarch opentopic e dita-ot opentopic-func"
    version="2.0" xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.mycorp.pdf"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:attribute-set name="odd__header">
        <xsl:attribute name="start-indent">0.75in</xsl:attribute>
        <xsl:attribute name="end-indent">0.75in</xsl:attribute>
        <xsl:attribute name="space-before">0.75in</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="header-leader">
        <xsl:attribute name="start-indent">0.75in</xsl:attribute>
        <xsl:attribute name="end-indent">0.75in</xsl:attribute>
        <xsl:attribute name="leader-pattern">rule</xsl:attribute>
        <xsl:attribute name="leader-pattern-width">2pt</xsl:attribute>
        <xsl:attribute name="leader-length">7in</xsl:attribute>
        <xsl:attribute name="color">purple</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="header-logo-container">
        <xsl:attribute name="position">absolute</xsl:attribute>
        <xsl:attribute name="top">0.5in</xsl:attribute>
        <xsl:attribute name="left">1in</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="header-logo">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="odd__footer">
        <xsl:attribute name="start-indent">0.75in</xsl:attribute>
        <xsl:attribute name="end-indent">0.75in</xsl:attribute>
        <xsl:attribute name="space-after">0.375in</xsl:attribute>
        <xsl:attribute name="space-before">10pt</xsl:attribute>
        <xsl:attribute name="text-align-last">justify</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="footer-leader">
        <xsl:attribute name="start-indent">0.75in</xsl:attribute>
        <xsl:attribute name="end-indent">0.75in</xsl:attribute>
        <xsl:attribute name="leader-pattern">rule</xsl:attribute>
        <xsl:attribute name="leader-pattern-width">1pt</xsl:attribute>
        <xsl:attribute name="leader-length">7in</xsl:attribute>
        <xsl:attribute name="color">#002097</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__odd__footer__copyright">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__odd__footer__title">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__chapter__frontmatter__name__container">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="border-before-style">none</xsl:attribute>
        <xsl:attribute name="border-after-style">solid</xsl:attribute>
        <xsl:attribute name="border-before-width">0pt</xsl:attribute>
        <xsl:attribute name="border-after-width">2pt</xsl:attribute>
        <xsl:attribute name="padding-top">10pt</xsl:attribute>
        <xsl:attribute name="space-after">20pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__chapter__frontmatter__number__container">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
</xsl:stylesheet>
