if exists("b:current_syntax")
    finish
endif

echom "Our syntax highlighting code will go here."

let b:current_syntax = "jay"
" My Personal Highlight ========{{{
syntax match jayKeyword "\v//Updated"
highlight link jayKeyword Keyword
"}}}

