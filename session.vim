let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/repos/prezi-clone
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +23 ~/repos/prezi-clone/index.html
badd +138 ~/repos/prezi-clone/styles.css
badd +1 term://~/repos/prezi-clone//6256:live-server
badd +11 project.md
argglobal
%argdel
$argadd .
edit ~/repos/prezi-clone/index.html
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 86 + 86) / 173)
exe 'vert 2resize ' . ((&columns * 86 + 86) / 173)
argglobal
balt ~/repos/prezi-clone/styles.css
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
7
normal! zo
7
normal! zo
16
normal! zo
52
normal! zo
57
normal! zo
62
normal! zo
63
normal! zo
73
normal! zo
79
normal! zo
79
normal! zo
89
normal! zo
97
normal! zo
98
normal! zo
let s:l = 98 - ((31 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 98
normal! 09|
wincmd w
argglobal
if bufexists(fnamemodify("~/repos/prezi-clone/styles.css", ":p")) | buffer ~/repos/prezi-clone/styles.css | else | edit ~/repos/prezi-clone/styles.css | endif
if &buftype ==# 'terminal'
  silent file ~/repos/prezi-clone/styles.css
endif
balt ~/repos/prezi-clone/index.html
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 138 - ((27 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 138
normal! 016|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 86 + 86) / 173)
exe 'vert 2resize ' . ((&columns * 86 + 86) / 173)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
