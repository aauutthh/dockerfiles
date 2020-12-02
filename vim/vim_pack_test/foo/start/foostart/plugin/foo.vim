echom "foostart package load"
packadd fooopt
if exists("g:fooopt_loaded")
  call foo#auto#hello()
endif
