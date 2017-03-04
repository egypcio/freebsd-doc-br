<?xml version="1.0" encoding="iso-8859-1" ?>
<!DOCTYPE xsl:stylesheet PUBLIC "-//FreeBSD//DTD FreeBSD XSLT 1.0 DTD//EN"
				"http://www.FreeBSD.org/XML/www/share/xml/xslt10-freebsd.dtd" [
<!ENTITY title "O Projeto &os;">
]>

<!--
  The FreeBSD Documentation Project
  The FreeBSD Brazilian Portuguese Documentation Project

  Original revision: r39669

  $FreeBSD: trunk/docs/pt_BR.ISO8859-1/htdocs/index.xsl 201 2012-10-17 04:34:27Z ebrandi@fugspbr.org $
-->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:import href="http://www.FreeBSD.org/XML/www/lang/share/xml/libcommon.xsl"/>
  <xsl:import href="http://www.FreeBSD.org/XML/www/share/xml/xhtml.xsl"/>

  <!-- these params should be externally bound. The values
       here are not used actually -->
  <xsl:param name="advisories.xml" select="'none'"/>
  <xsl:param name="notices.xml" select="'none'"/>
  <xsl:param name="mirrors.xml" select="'none'"/>
  <xsl:param name="news.press.xml-master" select="'none'"/>
  <xsl:param name="news.press.xml" select="'none'"/>
  <xsl:param name="news.project.xml-master" select="'none'"/>
  <xsl:param name="news.project.xml" select="'none'"/>
  <xsl:param name="events.xml-master" select="'none'"/>
  <xsl:param name="events.xml" select="'none'"/>
  <xsl:param name="html.header.script.google" select="'IGNORE'"/>

  <xsl:variable name="title">&title;</xsl:variable>

  <xsl:template name="process.content">
        <div id="frontcontainer">
          <div id="frontmain">
            <div id="frontfeaturecontainer">
	      <div id="frontfeatureleft">
		<div id="frontfeaturecontent">
		  <h1>
		    Baseado no &unix; BSD
		  </h1>

		  <p>O FreeBSD&reg; é um avançado sistema operacional
		    para servidores modernos, desktops e <a
		    href="&base;/platforms/">plataformas</a> de
		    computadores embarcados.  A base de código do &os;
		    passou por mais de trinta anos de contínuo 
		    desenvolvimento, de otimizações e de melhorias.  
		    Ele é desenvolvido e mantido por uma <a
		    href="&base;/doc/en_US.ISO8859-1/articles/contributors/staff-committers.html">grande
		    equipe de indivíduos</a>.  O &os; oferece suporte
		    a recursos avançados de rede, a funcionalidades
		    impressionantes de segurança e uma performance de
		    classe mundial, ele é utilizado em alguns dos <a
		    href="&base;/doc/en_US.ISO8859-1/books/handbook/nutshell.html#introduction-nutshell-users">web
		    sites mais movimentados do mundo</a> e em
		    dispositivos embarcados de rede e de armazenamento
		    amplamente difundidos.</p>

		    <div
		      id="txtfrontfeaturelink"> &#187;<a
		      href="&base;/about.html"
		      title="Saiba mais">Saiba mais</a>
		    </div> <!-- TXTFRONTFEATURELINK -->
		  </div> <!-- FRONTFEATURECONTENT -->
		</div> <!-- FRONTFEATURELEFT -->

		<div id="frontfeaturemiddle">
		  <div class="frontgetroundbox">
		    <div class="frontgettop"><div><b style="display: none">.</b></div></div>
		    <div class="frontgetcontent">
		      <a href="&base;/where.html">Obtenha o 
		      FreeBSD</a>
		    </div> <!-- frontgetcontent -->
		    <div class="frontgetbot"><div><b style="display: none">.</b></div></div>
		  </div> <!-- frontgetroundbox -->

		  <div id="frontreleases">
		    <div id="frontreleasescontent" class="txtshortcuts">
		      <h2><a href="&base;/releases/">ÚLTIMAS VERSÕES</a></h2>
				  <ul id="frontreleaseslist">
					<li>Produção:&nbsp;<a
				href="&u.rel.announce;">&rel.current;</a>,&nbsp;<a href="&u.rel2.announce;">&rel2.current;</a></li>
					<li>Legada: <a
				href="&u.rel3.announce;">&rel3.current;</a></li>
			    <xsl:if test="'&beta.testing;' != 'IGNORE'">
					<li>Próxima: <a
				href="&base;/where.html#helptest">&betarel.current;-&betarel.vers;</a></li>
			    </xsl:if>
			    <xsl:if test="'&beta2.testing;' != 'IGNORE'">
					<li>Próxima: <a
				href="&base;/where.html#helptest">&betarel2.current;-&betarel2.vers;</a></li>
			    </xsl:if>
				  </ul>
			  </div> <!-- FRONTRELEASESCONTENT -->
			</div> <!-- FRONTRELEASES -->
		</div> <!-- FRONTFEATUREMIDDLE -->

		<div id="frontfeatureright">
			<h2 class="blockhide">Links de Idioma</h2>
			<div id="languagenav">
				<ul id="languagenavlist">
				  <li>
					<a href="&base;/de/" title="Alemão">de</a>
				  </li>
				  <li>
					<a href="&base;/" title="Inglês">en</a>
				  </li>
				  <li>
					<a href="&base;/es/" title="Espanhol">es</a>
				  </li>
				  <li>
					<a href="&base;/fr/" title="Francês">fr</a>
				  </li>
				  <li>
					<a href="&base;/hu/" title="Húngaro">hu</a>
				  </li>
				  <li>
					<a href="&base;/it/" title="Italiano">it</a>
				  </li>
				  <li>
					<a href="&base;/ja/" title="Japonês">ja</a>
				  </li>
				  <li>
					<a href="&base;/nl/" title="Holandês">nl</a>
				  </li>
          <li>
          <a href="&base;/pt_BR/" title="Português Brasileiro">pt_BR</a>
          </li>
				  <li>
					<a href="&base;/ru/" title="Russo">ru</a>
				  </li>
				  <li class="last-child">
					<a href="&base;/zh_CN/" title="Chinês (Simplificado)">zh_CN</a>
				  </li>
				</ul>
			</div> <!-- LANGUAGENAV -->

			<div id="mirror">
			  <form action="&cgibase;/mirror.cgi" method="get">
				<div>
				  <h2 class="blockhide"><label for="MIRRORSEL">Espelho</label></h2>
				  <select id="mirrorsel" name="goto">
					  <xsl:call-template name="html-index-mirrors-options-list">
					    <xsl:with-param name="mirrors.xml" select="$mirrors.xml" />
					  </xsl:call-template>
				  </select>
				</div> <!-- unnamed -->
				<input type="submit" value="Ir" />
			  </form>
			</div> <!-- MIRROR -->

			<div id="frontshortcuts">
			  <div id="frontshortcutscontent" class="txtshortcuts">
				  <h2>ATALHOS</h2>
				  <ul id="frontshortcutslist">
					<li>
					  <a href="&base;/community/mailinglists.html" title="Listas de Discussão">Listas de Discussão</a>
					</li>
					<li>
					  <a href="&base;/support/bugreports.html" title="Comunique um Bug">Comunique um Bug</a>
					</li>
					<li>
					  <a href="&base;/doc/en_US.ISO8859-1/books/faq/index.html" title="FAQ">FAQ</a>
					</li>
					<li>
					  <a href="&base;/doc/en_US.ISO8859-1/books/handbook/index.html" title="Handbook">Handbook</a>
					</li>
					<li>
					  <a href="&base;/ports/index.html" title="Coleção de Ports">Coleção de Ports</a>
					</li>

				  </ul>
			  </div> <!-- FRONTSHORTCUTSCONTENT -->
			</div> <!-- FRONTSHORTCUTS -->

			<div class="frontnewroundbox">
			  <div class="frontnewtop"><div><b style="display: none">.</b></div></div>
			    <div class="frontnewcontent">
			      <a href="&base;/projects/newbies.html">Novo no &os;?</a>
			    </div> <!-- frontnewcontent -->
			  <div class="frontnewbot"><div><b style="display: none">.</b></div></div>
			</div> <!-- frontnewroundbox -->
		</div> <!-- FEATURERIGHT -->

            </div> <!-- FRONTFEATURECONTAINER -->

	    <br class="clearboth" />
            <div id="frontnemscontainer">
            	<div id="frontnews">
            	   <div id="frontnewscontent" class="txtnewsevent">
			<h2>ÚLTIMAS NOTÍCIAS</h2>
			<div class="newseventswrap">

			<xsl:call-template name="html-index-news-project-items">
				<xsl:with-param name="news.project.xml-master" select="$news.project.xml-master" />
				<xsl:with-param name="news.project.xml" select="$news.project.xml" />
			</xsl:call-template>

			  <div>
				<ul class="newseventslist">
				  <li class="first-child">
					<a href="&base;/news/newsflash.html" title="Mais Notícias">Mais Notícias</a>
				  </li>
				  <li class="last-child">
					<a href="&base;/news/rss.xml" title="Feed RSS de Notícias"><img class="rssimage" src="&enbase;/layout/images/ico_rss.png" width="27" height="12" alt="Feed RSS de Notícias" /></a>
				  </li>
				</ul>
			  </div> <!-- unnamed -->
			</div> <!-- newseventswrap -->

            	   </div> <!-- FRONTNEWSCONTENT -->
            	</div> <!-- FRONTNEWS -->
            	<div class="frontseparator"><b style="display: none">.</b></div>
            	<div id="frontevents">
		   <div id="fronteventscontent" class="txtnewsevent">

			<h2>PRÓXIMOS EVENTOS</h2>
			<div class="newseventswrap">

			<xsl:call-template name="html-index-events-items">
				<xsl:with-param name="events.xml-master" select="$events.xml-master" />
				<xsl:with-param name="events.xml" select="$events.xml" />
			</xsl:call-template>

			  <div>
				<ul class="newseventslist">
				  <li class="only-child">
					<a href="&base;/events/" title="Mais Eventos">Mais Eventos</a>
				  </li>
				</ul>
			  </div> <!-- unnamed -->
			</div> <!-- newseventswrap -->

		   </div> <!-- FRONTEVENTSCONTENT -->
            	</div> <!-- FRONTEVENTS -->
            	<div class="frontseparator"><b style="display: none">.</b></div>
            	<div id="frontmedia">
		   <div id="frontmediacontent" class="txtnewsevent">

			<h2>NA MÍDIA</h2>
			<div class="newseventswrap">

			<xsl:call-template name="html-index-news-press-items">
				<xsl:with-param name="news.press.xml-master" select="$news.press.xml-master" />
				<xsl:with-param name="news.press.xml" select="$news.press.xml" />
			</xsl:call-template>

			  <div>
				<ul class="newseventslist">
				  <li class="only-child">
					<a href="&base;/news/press.html" title="Mais Mídia">Mais Mídia</a>
				  </li>
				</ul>
			  </div> <!-- unnamed -->
			</div> <!-- newseventswrap -->

		   </div> <!-- FRONTMEDIACONTENT -->
            	</div> <!-- FRONTMEDIA -->
		<div class="frontseparator"><b style="display: none">.</b></div>
		<div id="frontsecurity">
		   <div id="frontsecuritycontent" class="txtnewsevent">

			<h2>ALERTAS DE SEGURANÇA</h2>
			<div class="newseventswrap">

			<xsl:call-template name="html-index-advisories-items">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
				<xsl:with-param name="type" select="'advisory'" />
			</xsl:call-template>

			  <div>
				<ul class="newseventslist">
				  <li class="first-child">
					<a href="&base;/security/advisories.html" title="Mais Alertas de Segurança">Mais</a>
				  </li>
				  <li class="last-child">
					<a href="&base;/security/rss.xml" title="Feed RSS de Alertas de Segurança"><img class="rssimage" src="&enbase;/layout/images/ico_rss.png" width="27" height="12" alt="Feed RSS de Alertas de Segurança" /></a>
				  </li>
				</ul>
			  </div> <!-- unnamed -->
			</div> <!-- newseventswrap -->

			<br />
			<h2>AVISOS DE ERRATA</h2>
			<div class="newseventswrap">

			<xsl:call-template name="html-index-advisories-items">
				<xsl:with-param name="advisories.xml" select="$notices.xml" />
				<xsl:with-param name="type" select="'notice'" />
			</xsl:call-template>

			  <div>
			    	<ul class="newseventslist">
				  <li class="first-child">
				    <a href="&base;/security/notices.html" title="Avisos de Errata">Mais</a>
				  </li>
				  <li class="last-child">
				    <a href="&base;/security/errata.xml" title="Feed RSS de Avisos de Errata"><img class="rssimage" src="&enbase;/layout/images/ico_rss.png" width="27" height="12" alt="Feed RSS de Avisos de Errata" /></a>
				  </li>
				</ul>
			  </div> <!-- unnamed -->
			</div> <!-- newseventswrap -->

		   </div> <!-- FRONTSECURITYCONTENT -->
            	</div> <!-- FRONTSECURITY -->

		<br class="clearboth" />

            </div> <!-- FRONTNEMSCONTAINER -->
          </div> <!-- FRONTMAIN -->
        </div> <!-- FRONTCONTAINER -->
  </xsl:template>

  <xsl:template name="process.footer">
	&copyright;

	A marca FreeBSD é uma marca registrada da The FreeBSD
	Foundation e é utilizada pelo Projeto FreeBSD com a permissão
	da  <a
	href="http://www.freebsdfoundation.org/documents/Guidelines.shtml">The
	FreeBSD Foundation</a>.

  </xsl:template>
</xsl:stylesheet>
