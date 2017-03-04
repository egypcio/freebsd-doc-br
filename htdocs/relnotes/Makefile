#
# Web site build hooks for the release notes.  Also see the README file.
#
# The variable RELNOTES (I couldn't think of a better name) is a poor
# man's list.  Its semantics are very similar to that of MLINKS (see
# bsd.man.mk).  The first word is the directory under which that set
# of relnotes should appear on the web site.  The second word is the
# path to that relnotes set.
#
# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/relnotes/Makefile 164 2012-10-04 20:43:02Z ebrandi@fugspbr.org $
#
.if exists(../Makefile.inc)
.include "../Makefile.inc"
.endif

RELNOTES?=	CURRENT ${DOC_PREFIX}/../relnotes/doc/${LANGCODE}

.include "Makefile.inc"
