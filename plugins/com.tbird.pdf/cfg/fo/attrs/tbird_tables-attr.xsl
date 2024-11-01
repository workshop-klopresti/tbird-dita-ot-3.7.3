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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">

  <!-- DEFINITION LIST STACKED DEFINITION DESCRIPTION --> 
  <xsl:attribute-set name="dlentry.dd__content" use-attribute-sets="common.table.body.entry">
    <xsl:attribute name="start-indent">10mm</xsl:attribute>
  </xsl:attribute-set>
 
 
  <!-- use these for definition list as bulleted list  -->
  <!-- See DEFINITION LIST BULLETS in tbird_tables.xsl --> 
 <!-- <xsl:attribute-set name="dl-list" use-attribute-sets="ul">
  </xsl:attribute-set> 
  <xsl:attribute-set name="dlentry" use-attribute-sets="ul.li">
  </xsl:attribute-set> 
  <xsl:attribute-set name="dlentry__label" use-attribute-sets="ul.li__label">
  </xsl:attribute-set>  
  <xsl:attribute-set name="dlentry__label__content" use-attribute-sets="ul.li__label__content">
  </xsl:attribute-set> 
  <xsl:attribute-set name="dlentry__body" use-attribute-sets="ul.li__body">
  </xsl:attribute-set>  
  <xsl:attribute-set name="dlentry__content">
  </xsl:attribute-set>  
  <xsl:attribute-set name="dt">   
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
  </xsl:attribute-set> 
  <xsl:attribute-set name="dd">   
<!-\-    <xsl:attribute name="start-indent">from-parent(start-indent)+<xsl:value-of select="$side-col-width"/></xsl:attribute>
-\->    
  </xsl:attribute-set>
-->
  
  <!-- use these for dl to be a series of paragraphs with no special indetns-->
  <!-- See DEFINITION LIST PARAGRAPHS in tbird_tables.xsl -->
  <xsl:attribute-set name="dl-block">
    <xsl:attribute name="space-before">5pt</xsl:attribute>
    <xsl:attribute name="space-after">5pt</xsl:attribute>
   
  </xsl:attribute-set>
  <xsl:attribute-set name="dlentry"> </xsl:attribute-set>
  <xsl:attribute-set name="dt">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="dd">
        <xsl:attribute name="space-after">10pt</xsl:attribute>
  </xsl:attribute-set>
  
  
  
  <!-- use these for dl to be a series of paragraphs with special indents-->
  <!-- See DEFINITION LIST PARAGRAPHS in tbird_tables.xsl -->
<!--  <xsl:attribute-set name="dl-block">
    <xsl:attribute name="space-before">5pt</xsl:attribute>
    <xsl:attribute name="space-after">5pt</xsl:attribute>
    <xsl:attribute name="start-indent">
      <xsl:choose>
        <xsl:when test="ancestor-or-self::entry">from-parent(start-indent)+0pt</xsl:when>
        <xsl:otherwise><xsl:value-of select="$side-col-width"/> + 0.25in</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="dlentry"> </xsl:attribute-set>
  <xsl:attribute-set name="dt">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="dd">
    <xsl:attribute name="start-indent">from-parent(start-indent)+<xsl:value-of
      select="$side-col-width"/></xsl:attribute>
    <xsl:attribute name="space-after">10pt</xsl:attribute>
  </xsl:attribute-set>-->
</xsl:stylesheet>