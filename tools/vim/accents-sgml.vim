" accents in SGML
" $FreeBSD: doc/share/examples/vim/accents-sgml.vim,v 1.1 1999/11/15 19:41:09 nik Exp $

  " accents in SGML
if !exists("autocommands_accents_sgml")
    let autocommands_accents_sgml = 1
    autocmd BufReadPost,FileReadPost *.sgml,*.ent,*.html '[,']!$HOME/.vim/sgml2accents.pl
    autocmd BufReadPost,FileReadPost *.sgml,*.ent,*.html syn match sgmlSpecial "&[^;]*;"
    autocmd BufReadPost,FileReadPost *.sgml,*.ent,*.html set sts=2
    autocmd BufWritePre,FileWritePre *.sgml,*.ent,*.html '[,']!$HOME/.vim/accents2sgml.pl
    autocmd BufWritePost,FileWritePost *.sgml,*.ent,*.html '[,']!$HOME/.vim/sgml2accents.pl
endif

