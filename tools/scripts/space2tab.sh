#!/bin/sh

perl -pi.orig -e "s|        |\t|g;s|^[\s\t]+$|\n|" "${@}"
#perl -pi.orig -e "s|\.  </para>|\.</para>|" b.sgml
