" Font Selector
" Author: Cornelius  林佑安 (Yo-An Lin) <cornelius.howl@gmail.com>
" Script Type: plugin
" Wed 21 Jul 2010 03:10:44 PM CST

fun! g:SetFont()
  let name = getline('.')

  if name == "Quit"
	wincmd q
	return
  endif

  exec 'set gfn=' . escape( name , " " )
  redraw
  echo "Current Font: " . name
endf

fun! s:renderList()
  let menu = [ ]
  let file = expand('~/.vim/fontlist')

  if filereadable( expand(file) )
    cal extend( menu , readfile( expand(file) ) )
  endif

  cal add( menu,"AR PL UKai TW 10" )
  cal add( menu,"AR PL UKai TW 12" )
  cal add( menu,"AR PL UKai TW 14" )
  cal add( menu,"AR PL UKai TW 16" )

  cal add( menu,"Bitstream Charter")

  cal add( menu,"Serif")
  cal add( menu,"Sans Serif")

  cal add( menu,"Droid Sans")
  cal add( menu,"Droid Sans Mono 10")
  cal add( menu,"Droid Sans Mono 12")
  cal add( menu,"Droid Sans Mono 14")
  cal add( menu,"Droid Sans Serif 10")
  cal add( menu,"Droid Sans Serif 12")
  cal add( menu,"Droid Sans Serif 14")

  cal add( menu,"Monospace 10")
  cal add( menu,"Monospace 12")
  cal add( menu,"Monospace 14")

  cal add( menu,"Bitstream Sans Mono 12")
  cal add( menu,"Bitstream Sans Mono 14")
  cal add( menu,"Bitstream Sans Mono 16")

  cal add( menu,"ProggyCleanTT CE 10")
  cal add( menu,"ProggyCleanTT CE 12")
  cal add( menu,"Courier 10 Pitch")
  cal add( menu,"Courier 10 Pitch 10")
  cal add( menu,"Courier 10 Pitch 12")
  cal add( menu,"Quit")

  " cal add( menu,"Courier New")
  let idx = 1
  for font in menu 
	cal setline( idx , font )
	let idx += 1
  endfor
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

com! FontSelect     :cal s:SelectFonts()
com! SelectFonts    :cal s:SelectFonts()
