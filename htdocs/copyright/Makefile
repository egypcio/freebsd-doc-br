# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/copyright/Makefile 164 2012-10-04 20:43:02Z ebrandi@fugspbr.org $

.if exists(../Makefile.conf)
.include "../Makefile.conf"
.endif
.if exists(../Makefile.inc)
.include "../Makefile.inc"
.endif

DOCS=	copyright.xml
DOCS+=	daemon.xml
DOCS+=	freebsd-doc-license.xml
DOCS+=	freebsd-license.xml
DOCS+=	license.xml
DOCS+=	trademarks.xml

INDEXLINK= copyright.html

DATA+= COPYING COPYING.LIB LEGAL

CLEANFILES+= LEGAL

LEGAL:
	${FETCH} http://svn.freebsd.org/ports/head/LEGAL

.include "${DOC_PREFIX}/share/mk/web.site.mk"
