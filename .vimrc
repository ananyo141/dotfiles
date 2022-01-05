" COPY THIS FILE AS .vimrc in home folder.
" cp vimrc ~/.vimrc
"
" .vimrc
"
" Smylers's .vimrc
" http://www.stripey.com/vim/
" 
" 2000 Jun  1: for `Vim' 5.6
" 
" This vimrc is divided into these sections:
" 
" * Terminal Settings
" * User Interface
" * Text Formatting -- General
" * Text Formatting -- Specific File Formats
" * Search & Replace
" * Spelling
" * Keystrokes -- Moving Around
" * Keystrokes -- Formatting
" * Keystrokes -- Toggles
" * Keystrokes -- Insert Mode
" * Keystrokes -- For HTML Files
" * `SLRN' Behaviour
" * Functions Referred to Above
" 
" This file contains no control codes and no `top bit set' characters above the
" normal Ascii range, and all lines contain a maximum of 79 characters.  With a
" bit of luck, this should make it resilient to being uploaded, downloaded,
" e-mailed, posted, encoded, decoded, transmitted by morse code, or whatever.


" first clear any existing autocommands:
autocmd!


"---" * Terminal Settings
"---
"---" `XTerm', `RXVT', `Gnome Terminal', and `Konsole' all claim to be "xterm";
"---" `KVT' claims to be "xterm-color":
"---if &term =~ 'xterm'
"---
"---  " `Gnome Terminal' fortunately sets $COLORTERM; it needs <BkSpc> and <Del>
"---  " fixing, and it has a bug which causes spurious "c"s to appear, which can be
"---  " fixed by unsetting t_RV:
"---  if $COLORTERM == 'gnome-terminal'
"---    execute 'set t_kb=' . nr2char(8)
"---    " [Char 8 is <Ctrl>+H.]
"---    fixdel
"---    set t_RV=
"---
"---  " `XTerm', `Konsole', and `KVT' all also need <BkSpc> and <Del> fixing;
"---  " there's no easy way of distinguishing these terminals from other things
"---  " that claim to be "xterm", but `RXVT' sets $COLORTERM to "rxvt" and these
"---  " don't:
"---  elseif $COLORTERM == ''
"---    execute 'set t_kb=' . nr2char(8)
"---    fixdel
"---
"---  " The above won't work if an `XTerm' or `KVT' is started from within a `Gnome
"---  " Terminal' or an `RXVT': the $COLORTERM setting will propagate; it's always
"---  " OK with `Konsole' which explicitly sets $COLORTERM to "".
"---
"---  endif
"---endif


" * User Interface

" have syntax highlighting in terminals which can display colours:
"if has('syntax') && (&t_Co > 2)
"  syntax on
"endif

" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" have the mouse enabled all the time:
" set mouse=a

" don't have files trying to override this .vimrc:
set nomodeline


" * Text Formatting -- General

" don't make it look like there are line breaks where there aren't:
set nowrap

" use indents of 4 spaces, and have them copied down lines:
set shiftwidth=4
set shiftround
set expandtab
set tabstop=4
set autoindent
set smartindent
set splitright
set splitbelow
set hls

" set colorscheme
colorscheme elflord
color delek

" set and customize line number
set nu
highlight LineNr term=bold cterm=NONE ctermfg=grey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Automatically closing braces
inoremap {<CR> {<CR>}<C-o>O
inoremap [<CR> [<CR>]<C-o>O
inoremap (<CR> (<CR>)<C-o>O

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set formatoptions-=o
set textwidth=79

" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
"set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::


" * Text Formatting -- Specific File Formats

" enable filetype detection:
filetype on

" recognize anything in my .Postponed directory as a news article, and anything
" at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
  autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
  autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END

" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" also don't expand tabs in shell scripts
autocmd FileType sh set noexpandtab

" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
" set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
" this turned out to do the opposite of what it was supposed to
" set gdefault


" * Keystrokes -- Moving Around

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
noremap <Space> <PageDown>
noremap <BS> <PageUp>
noremap - <PageUp>
" [<Space> by default is like l, <BkSpc> like h, and - like k.]

" scroll the window (but leaving the cursor in the same place) by a couple of
" lines up/down with <Ins>/<Del> (like in `Lynx'):
noremap <Ins> 2<C-Y>
noremap <Del> 2<C-E>
" [<Ins> by default is like i, and <Del> like x.]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>


" * Keystrokes -- Formatting

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$


" * Keystrokes -- Toggles

" Keystrokes to toggle options are defined here.  They are all set to normal
" mode keystrokes beginning \t but some function keys (which won't work in all
" terminals) are also mapped.

" have \tp ("toggle paste") toggle paste on/off and report the change, and
" where possible also have <F4> do this both in normal and insert mode:
nnoremap \tp :set invpaste paste?<CR>
nmap <F4> \tp
imap <F4> <C-O>\tp
set pastetoggle=<F4>

"" have \tf ("toggle format") toggle the automatic insertion of line breaks
"" during typing and report the change:
"nnoremap \tf :if &fo =~ 't' <Bar> set fo-=t <Bar> else <Bar> set fo+=t <Bar>
"  \ endif <Bar> set fo?<CR>
"nmap <F3> \tf
"imap <F3> <C-O>\tf
"
" have \tl ("toggle list") toggle list on/off and report the change:
nnoremap \tl :set invlist list?<CR>
nmap <F2> \tl

" have \th ("toggle highlight") toggle highlighting of search matches, and
" report the change:
nnoremap \th :set invhls hls?<CR>
" clear the current search highlight with Ctrl+/
noremap <silent> <c-_> :let @/ = ""<CR>


" * Keystrokes -- Insert Mode

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
" inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>
inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-E>\<CR>" : "\<CR>"
inoremap # X#
" [<Ctrl>+V <Tab> still inserts an actual tab character.]

" Shortcut to maximize 
nmap - :res<CR>:vertical res<CR>

" YouCompleteMe ends preview tabs
let g:ycm_autoclose_preview_window_after_insertion = 1

" make control-W easier to type
nnoremap <F3> <C-W>

syntax on

