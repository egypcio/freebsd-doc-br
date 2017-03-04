# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/ports/Makefile.inc 164 2012-10-04 20:43:02Z ebrandi@fugspbr.org $

PORTINDEX=	${PERL} ${.CURDIR}/portindex
INDEX=		INDEX
PINDEX=		ports/${INDEX}

COOKIE=		${INDEX} Makefile.gen

CLEANFILES+=	${INDEX} ${INDEX}.bz2
CLEANFILES+=	packages.exists.temp  packages.exists
CLEANFILES+= 	${DYNAMIC_DOCS}
CLEANFILES+=	Makefile.gen
CLEANFILES+=	ports.count ports.size

_ALLINSTALL= packages.exists categories

