" Font Selector
" Author: Cornelius  林佑安 (Yo-An Lin) <cornelius.howl@gmail.com>
" Script Type: plugin
" Wed 21 Jul 2010 03:10:44 PM CST

fun! g:SetFont()
  let name = getline('.')
  exec 'set gfn=' . escape( name , " " )
  redraw
  echo "Current Font: " . name
endf


fun! s:renderList()
    cal setline(1,"Droid Sans")
    cal setline(2,"Droid Sans Mono")
    cal setline(3,"Monospace")
    cal setline(4,"Courier New")
endf

fun! s:SelectFonts()
  30vnew
  setlocal bufhidden=wipe buftype=nofile nonu fdc=0
  file FontSelector

  cal s:renderList()

  setlocal nomodifiable
  setlocal cursorline

  hi CursorLine gui=reverse
  hi CursorName guifg=green
  hi CurrentColor guifg=black guibg=red
  hi link Header Function

  nmap <buffer>  <Enter>  :cal g:SetFont()<CR>
  nmap <buffer>  <C-q>    :q<CR>   
  nmap <buffer>  <C-n>    j<CR>
  nmap <buffer>  <C-p>    k<CR>
  nmap <buffer><script>  ?      :cal <SID>help()<CR>
endf

fun! s:help()
  echo "** Font Selector **"
  echo "  j    - apply next"
  echo "  ?    - show help"
endf

com! SelectFonts    :cal s:SelectFonts()
