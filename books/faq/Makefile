#
# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/books/faq/Makefile 165 2012-10-04 21:26:02Z ebrandi@fugspbr.org $
#
# Build the FreeBSD FAQ
#
# The FreeBSD Documentation Project
# The FreeBSD Brazilian Portuguese Documentation Project
#
# Original revision: 1.10
#

MAINTAINER=lioux@FreeBSD.org

DOC?= book

FORMATS?= html-split html

INSTALL_COMPRESSED?= gz
INSTALL_ONLY_COMPRESSED?=

WITH_BIBLIOXREF_TITLE?=YES

#
# SRCS lists the individual SGML files that make up the document. Changes
# to any of these files will force a rebuild
#

# SGML content
SRCS= book.xml

DOC_PREFIX?= ${.CURDIR}/../../..

.include "${DOC_PREFIX}/share/mk/doc.project.mk"
