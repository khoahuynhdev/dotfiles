" function Meow()
"   echom "Meow!"
" endfunction

" function GetMeow()
"   return  "Meow string!"
" endfunction
" function TextWidthIsTooWide()
"   if &l:textwidth ># 80
"     return 1
"   endif
" endfunction

" set textwidth=80

" if TextWidthIsTooWide()
"   echom "Warning: wide text!"
" endif

" setlocal textwidth=100
" if TextWidthIsTooWide()
"   echom "Warning: wide text!"
" endif

function DisplayName(name)
  echom "Hello! my name is: "
  echom a:name
endfunction

function Varg(...)
  echom a:0
  echom a:1
  echo a:000
endfunction
  echom a:foo
  echom a:0
  echom a:1
  echo a:000
endfunction
