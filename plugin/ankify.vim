if exists('g:archive_options_loaded')
  finish
endif

let s:Pecho=''
function! s:Pecho(msg)
  let s:hold_ut=&ut | if &ut>1|let &ut=1|en
  let s:Pecho=a:msg
  aug Pecho
    au CursorHold * if s:Pecho!=''| echohl ErrorMsg | echo s:Pecho | echohl None
          \|let s:Pecho=''|if s:hold_ut > &ut |let &ut=s:hold_ut|en|en
        \|aug Pecho|exe 'au!'|aug END|aug! Pecho
  aug END
endfunction

source './mappings.vim'
source './statistics.vim'

let g:archive_options_loaded = v:true
