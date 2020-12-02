if exists("g:fooopt_loaded")
  finish
endif
let g:fooopt_loaded = 1

echom "foo opt loaded"
packadd! fooother
call other#auto#hello()
