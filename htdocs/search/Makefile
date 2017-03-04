# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/search/Makefile 164 2012-10-04 20:43:02Z ebrandi@fugspbr.org $

.if exists(../Makefile.conf)
.include "../Makefile.conf"
.endif
.if exists(../Makefile.inc)
.include "../Makefile.inc"
.endif

DOCS+= search.xml
DOCS+= searchhints.xml
DOCS+=	search-mid.xml

#SUBDIR+= opensearch

INDEXLINK=	search.html

XMLDOCS=	index-site:xsl:sitemap.xml

.include "${DOC_PREFIX}/share/mk/web.site.mk"
