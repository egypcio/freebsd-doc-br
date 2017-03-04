# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/java/Makefile 164 2012-10-04 20:43:02Z ebrandi@fugspbr.org $

.if exists(../Makefile.conf)
.include "../Makefile.conf"
.endif
.if exists(../Makefile.inc)
.include "../Makefile.inc"
.endif

SUBDIR =	dists
SUBDIR+=	docs
SUBDIR+=	links

DOCS =  advocacy.xml
DOCS+=  howhelp.xml
DOCS+=  index.xml
DOCS+=  install.xml

DATA=	j2j.gif

XML.DEFAULT=	news.xml
XMLDOCS=	newsflash
XMLDOCS+=	news:java-rss.xsl::rss.xml

.include "${DOC_PREFIX}/share/mk/web.site.mk"
