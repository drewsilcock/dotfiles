" Vim syntax file
" Language: Mint
" Maintainer: Drew Silcock
" Latest Revision: 9 September 2013

if exists("b:current_syntax")
    finish
endif

syn keyword mintKeyword IntegratorSource doScan OutputRootFile MCFileSave
syn keyword mintBool true false

syn keyword mintCommentKeyword contained options name fix init step min max

syn match mintComment "*.*$" contains=mintCommentKeyword

syn region mintString start=/\v"/ skip=/\v\\./ end=/\v"/

" Integer with - + or nothing in front
syn match mintNumber '\d\+'
syn match mintNumber '[-+]\d\+'

" Floating point number with decimal no E or e (+,-)
syn match mintNumber '\d\+\.\d*'
syn match mintNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-)
syn match mintNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match mintNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-)
syn match mintNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match mintNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

hi def link mintCommentKeyword  Todo
hi def link mintBool            Special
hi def link mintKeyword         Type
hi def link mintComment         Comment
hi def link mintString          String
hi def link mintNumber          Statement

let b:current_syntax = "mint"
au BufRead,BufNewFile *.mint setfiletype mint
