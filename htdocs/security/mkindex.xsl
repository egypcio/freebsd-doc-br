<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet PUBLIC "-//FreeBSD//DTD FreeBSD XSLT 1.0 DTD//EN"
				"http://www.FreeBSD.org/XML/www/share/xml/xslt10-freebsd.dtd">

<!-- $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/security/mkindex.xsl 164 2012-10-04 20:43:02Z ebrandi@fugspbr.org $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="http://www.FreeBSD.org/XML/www/lang/share/xml/libcommon.xsl"/>

  <xsl:output type="xml" encoding="iso-8859-1"
              omit-xml-declaration="yes" />

  <xsl:template match="/">
    <xsl:call-template name="html-list-advisories">
       <xsl:with-param name="advisories.xml" select="$advisories.xml" />
       <xsl:with-param name="type" select="$type" />
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
