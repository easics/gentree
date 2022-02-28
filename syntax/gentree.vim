" Vim syntax file
" Filetype tree

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "gentree"

syn match Title "\[global flags\]"
syn match Title "\[existing\]"
syn match Title "\[tree\]"

syn keyword treeGlobalKeyword visitor
syn keyword treeGlobalKeyword recursiveVisitor
syn keyword treeGlobalKeyword prefix
syn keyword treeGlobalKeyword delete
syn keyword treeGlobalKeyword cloneForArray
syn keyword treeGlobalKeyword includeAll
syn keyword treeGlobalKeyword ruby
syn keyword treeGlobalKeyword outputDir
syn keyword treeKeyword arrayDef
syn keyword treeKeyword preMorph
syn keyword treeKeyword morph
syn keyword treeSectionKeyword globals
syn keyword treeKeyword include force_include force_header_include
syn keyword treeExtension extend
syn match treeKeyword "using namespace"

syn match treeComment "//.*$"
syn match treeDefine "%%.*"

syn match treeInclude "#include "

highlight def link treeKeyword Special
highlight def link treeGlobalKeyword Identifier
highlight def link treeSectionKeyword Statement
highlight def link treeTodo Todo
highlight def link treeDefine Define
highlight def link treeComment Comment
highlight def link treeInclude Include
highlight def link treeExtension Type

