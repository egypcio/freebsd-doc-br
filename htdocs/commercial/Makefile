# $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/commercial/Makefile 164 2012-10-04 20:43:02Z ebrandi@fugspbr.org $

.if exists(../Makefile.conf)
.include "../Makefile.conf"
.endif
.if exists(../Makefile.inc)
.include "../Makefile.inc"
.endif

DOCS=		commercial.xml
INDEXLINK=	commercial.html

XSLT.DEFAULT=		${XSL_ENTRIES}
DEPENDSET.DEFAULT=	commercial

XMLDOCS=	consult::${XML_COMMERCIAL_CONSULT}:
PARAMS.consult=	--param pagename "'Consulting Services'" \
		--param basename "'consult.html'"

XMLDOCS+=	consult_bycat::${XML_COMMERCIAL_CONSULT}:
PARAMS.consult_bycat=\
		--param pagename "'Consulting Services'" \
		--param basename "'consult.html'" \
		--param sort "'bycat'"

XMLDOCS+=	hardware::${XML_COMMERCIAL_HARDWARE}:
PARAMS.hardware= --param pagename "'Hardware Vendors'"

XMLDOCS+=	isp::${XML_COMMERCIAL_ISP}:
PARAMS.isp=	--param pagename "'Internet Service Providers'"

XMLDOCS+=	misc::${XML_COMMERCIAL_MISC}:
PARAMS.misc=	--param pagename "'Miscellaneous Vendors'"

XMLDOCS+=	software::${XML_COMMERCIAL_SOFTWARE}:
PARAMS.software=--param pagename "'Software Vendors'"

XMLDOCS+=	software_bycat::${XML_COMMERCIAL_SOFTWARE}:
PARAMS.software_bycat=\
		--param pagename "'Software Vendors'" \
		--param basename "'software.html'" \
		--param sort "'bycat'"

.include "${DOC_PREFIX}/share/mk/web.site.mk"
