<?xml version="1.0"?>

<!-- 
Copyright © 2004-2006 by Idiom Technologies, Inc. All rights reserved. 
IDIOM is a registered trademark of Idiom Technologies, Inc. and WORLDSERVER
and WORLDSTART are trademarks of Idiom Technologies, Inc. All other 
trademarks are the property of their respective owners. 

IDIOM TECHNOLOGIES, INC. IS DELIVERING THE SOFTWARE &quot;AS IS,&quot; WITH 
ABSOLUTELY NO WARRANTIES WHATSOEVER, WHETHER EXPRESS OR IMPLIED,  AND IDIOM
TECHNOLOGIES, INC. DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE AND WARRANTY OF NON-INFRINGEMENT. IDIOM TECHNOLOGIES, INC. SHALL NOT
BE LIABLE FOR INDIRECT, INCIDENTAL, SPECIAL, COVER, PUNITIVE, EXEMPLARY,
RELIANCE, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO LOSS OF 
ANTICIPATED PROFIT), ARISING FROM ANY CAUSE UNDER OR RELATED TO  OR ARISING 
OUT OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF IDIOM
TECHNOLOGIES, INC. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. 

Idiom Technologies, Inc. and its licensors shall not be liable for any
damages suffered by any person as a result of using and/or modifying the
Software or its derivatives. In no event shall Idiom Technologies, Inc.&apos;s
liability for any damages hereunder exceed the amounts received by Idiom
Technologies, Inc. as a result of this transaction.

These terms and conditions supersede the terms and conditions in any
licensing agreement to the extent that such terms and conditions conflict
with those set forth herein.

This file is part of the DITA Open Toolkit project.
See the accompanying LICENSE file for applicable license.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:attribute-set name="codeph">
        <xsl:attribute name="font-family">monospace</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="background-color">#e0e0e0</xsl:attribute>

    </xsl:attribute-set>

    <xsl:attribute-set name="codeblock-label" use-attribute-sets="section.title">
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>

    </xsl:attribute-set>

    <xsl:attribute-set name="codeblock-content" use-attribute-sets="pre">
        <xsl:attribute name="font-family">monospace</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="text-decoration">none</xsl:attribute>
        <xsl:attribute name="space-before">6pt</xsl:attribute>
        <xsl:attribute name="space-after">6pt</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="start-indent">from-parent(start-indent) + 0.25in</xsl:attribute>
        <xsl:attribute name="line-height">1.2</xsl:attribute>
        <xsl:attribute name="background-color">#e0e0e0</xsl:attribute>
        <xsl:attribute name="end-indent">from-parent(end-indent) + 0pt</xsl:attribute>
        <xsl:attribute name="padding-top">6pt</xsl:attribute>
        <xsl:attribute name="padding-right">6pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">6pt</xsl:attribute>
        <xsl:attribute name="padding-left">6pt</xsl:attribute>
        <!--        Wrap inserts line break character
-->
        <!--        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="hyphenation-character">&#x25BA;</xsl:attribute>-->
    </xsl:attribute-set>



</xsl:stylesheet>
