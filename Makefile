# The FreeBSD Documentation Project
# The FreeBSD Brazilian Portuguese Documentation Project
#
# Original revision: 1.7
#
# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/Makefile 2 2012-09-18 19:11:04Z ebrandi@fugspbr.org $

SUBDIR = articles
SUBDIR+= books

COMPAT_SYMLINK = pt_BR

DOC_PREFIX?= ${.CURDIR}/..
.include "${DOC_PREFIX}/share/mk/doc.project.mk"
