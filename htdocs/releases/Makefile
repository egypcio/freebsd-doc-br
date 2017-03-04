# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/releases/Makefile 164 2012-10-04 20:43:02Z ebrandi@fugspbr.org $

.if exists(../Makefile.conf)
.include "../Makefile.conf"
.endif
.if exists(../Makefile.inc)
.include "../Makefile.inc"
.endif

DOCS?=	index.xml

SUBDIR+=	9.1R

.if defined $(NEW_BUILD)
SUBDIR=
.endif

.include "${DOC_PREFIX}/share/mk/web.site.mk"
