" C Language
runtime syntax/c.vim

" ROOT
runtime syntax/cern_root.vim

" C++ 
"Vim syntax file
" Language:	C++
" Maintainer:	Ken Shan <ccshan@post.harvard.edu>
" Last Change:	2002 Jul 15

" C++ extentions
syn keyword cppStatement	new delete this friend using
syn keyword cppAccess		public protected private
syn keyword cppType		    inline virtual explicit export bool wchar_t string ofstream
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast		    "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast		    "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS
syn keyword cppBoolean		true false
syn keyword cppIO           cout endl
syn keyword cppNamespace    std MINT

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

hi def link cppAccess		cppStatement
hi def link cppCast		    cppStatement
hi def link cppExceptions	Exception
hi def link cppOperator		Operator
hi def link cppStatement	Statement
hi def link cppType		    Type
hi def link cppStorageClass	StorageClass
hi def link cppStructure	Structure
hi def link cppNumber		Number
hi def link cppBoolean		Boolean
hi def link cppIO           Type
hi def link cppNamespace    PreProc
    
let b:current_syntax = "cpp"
au BufRead,BufNewFile *.cpp setfiletype cpp
au BufRead,BufNewFile *.C setfiletype cpp
au BufRead,BufNewFile *.cxx setfiletype cpp
au BufRead,BufNewFile *.h setfiletype cpp
au BufRead,BufNewFile *.hpp setfiletype cpp
