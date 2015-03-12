
" Setup some color stuff
highlight Normal guibg=Black guifg=White
highlight Normal ctermbg=Black ctermfg=White
set background=dark
filetype plugin on
syntax on
" set guifont=12x20
"set guifont=-monotype-couriernew-medium-r-normal-*-*-110-*-*-m-*-iso8859-8,-misc-fixed-medium-r-normal-*-*-100-*-*-c-*-iso8859-9,-adobe-courier-medium-r-normal-*-*-110-*-*-m-*-iso8859-1


" version 4.0             " avoid warning for wrong version
" autocmd!

if has('gui_running')
	set lines=999 columns=999
endif

" Some default settings
set timeoutlen=1800
" ignore case when pattern matching
set ignorecase
" turn on the stupid fat finger booboo
nmap :W :w

" Misc macros----------------------------------
" Some of these take me a little longer to type so I will set timeoutlen to a
" little longer time.  (Time is in milliseconds.)

" Remap q and Q to indent/unindent with spaces
map <C-F1> I <Esc>
map <C-F2> a <ESC>
map q I   <Esc>j0
map Q 0d3lj
imap <C-Q> <ESC>3<C-F2>a

" Map ctrl-Qn to change q and Q so they handle indent with n spaces instead of
" default 4 spaces.
map <C-Q>1 :map Q 0d1lj<CR>:map q 1<C-F1>j0<CR>
map <C-Q>2 :map Q 0d2lj<CR>:map q 2<C-F1>j0<CR>
map <C-Q>3 :map Q 0d3lj<CR>:map q 3<C-F1>j0<CR>
map <C-Q>4 :map Q 0d4lj<CR>:map q 4<C-F1>j0<CR>
map <C-Q>5 :map Q 0d5lj<CR>:map q 5<C-F1>j0<CR>
map <C-Q>6 :map Q 0d6lj<CR>:map q 6<C-F1>j0<CR>
map <C-Q>7 :map Q 0d7lj<CR>:map q 7<C-F1>j0<CR>
map <C-Q>8 :map Q 0d8lj<CR>:map q 8<C-F1>j0<CR>
map <C-Q>9 :map Q 0d9lj<CR>:map q 9<C-F1>j0<CR>

"
" Some function key mappings
"
" map <F2> to save file
map <F2> :w<RETURN>
" map <S-F2> to reload a file
map <S-F2> :e<RETURN>
" map <F3> to open file
map <F3> :browse confirm e<RETURN>
" map <F5> to split window
map <F5> <C-W>s
" map shift-<F5> to 'unsplit' window
map <S-F5> :close<RETURN>
" map ctrl-<F5> to quit one window at a time
map <C-F5> :q<RETURN>
" map <F6> to switch between panes of split window
map <F6> <C-W>w
" map <S-F6> to switch the other direction
map <S-F6> <C-W>W
" map <tab> to switch between panes of split window when in normal mode
nmap <TAB> <F6>
" map shift-<tab> to switch the other way
nmap <S-TAB> <S-F6>
" map <F7> increase current window height
" you can use n<F7> to increase the window size by n lines
map <F7> <C-W>+
" map shift-<F7> decrease current window height
" you can use n<S-F7> to decrease the window size by n lines
map <S-F7> <C-W>-
" map <F8> to switch window to the next buffer in the list
map <F8> :bn<CR>
" map shift-<F8> to switch window to the next buffer in the list
map <S-F8> :bN<CR>
" map ctrl-<F8> to close the current buffer
map <C-F8> :bdelete<CR>
" note: <F10> mapped to insert a comment in the ftplugin files
" note: <S-F10> mapped to uninsert a comment in the ftplugin files

" map Print Screen key (<F22> on sun keyboards) to print file
map <F22> :hardcopy<RETURN>

" map that blank key to make
map <F13> :!make<CR> 

" map SOURCE to resource this file
map SOURCE :source ~/.vimrc

" Remap arrow keys so I don't use them
" map <Up> <Esc>
" map <Down> <Esc>
" map <Left> <Esc>
" map <Right> <Esc>

" map <F9> to get rid of tabs
" map <F9> :%s/<C-I>/<SPACE><SPACE><SPACE><SPACE>/g<CR>

" map <F21> to turn toolbar on and <S-F21> to turn it off
map <F21> :set toolbar=<CR>
map <S-F21> :set toolbar=icons,tooltips<CR>

" map \s to perform a spell check on the current file
map \s :w<CR>:!spell %<CR>:e %<CR>

" map \d to insert the date and time into the file
map \d o<C-R>=strftime("%c")<CR><Esc>

" SCCS commands
"map <F5> :! sccs edit %<CR><CR>:e<CR>
"map <F6> :! sccs get %<CR><CR>:e<CR>
" Edit make file
"map <F9> :! sccs edit Makefile<CR><CR>:e Makefile<CR>

" CTAGs maps
" Open in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" Misc options--------------------------------------
" set nohlsearch
" set hlsearch
set incsearch
:noremap <F4> :set hlsearch! hlsearch?<CR>
:noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set showcmd
" set cindent " This has been moved to c.vim in the ftplugin directory
" set ai      " Likewise
set autoindent     " Always turn on autoindent
set smartindent
" set expandtab
set tabstop=4
set sw=4
set noerrorbells
set visualbell
set sm
set backspace=indent,eol,start
"inoremap ^? ^H
"set t_kb=^H
"set t_kD=^?
set tw=78               " always limit the width of text to 78
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
" search for ctags in the current directory and higher until one is found
set tags=./tags;/

" auto-load cscope database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()


" Default vim stuff -------------------------------------------------

" When starting to edit a file:
"   For *.c and *.h files set formatting of comments and set C-indenting on
"   For other files switch it off
"   Don't change the sequence, it's important that the line with * comes first.
"autocmd BufRead * set formatoptions=tcql nocindent comments&
"autocmd BufRead *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.pl set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://

" Enable editing of gzipped files
"    read: set binary mode before reading the file
"          uncompress text in buffer after reading
"   write: compress file after writing
"  append: uncompress file, append, compress file
"autocmd BufReadPre,FileReadPre      *.gz set bin
autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
autocmd BufReadPost,FileReadPost    *.gz set nobin

autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r

autocmd FileAppendPre               *.gz !gunzip <afile>
autocmd FileAppendPre               *.gz !mv <afile>:r <afile>
autocmd FileAppendPost              *.gz !mv <afile> <afile>:r
autocmd FileAppendPost              *.gz !gzip <afile>:r

 if &background == "dark"
    hi Comment    term=bold        ctermfg=DarkCyan      guifg=#ff5555
    hi Constant   term=underline   ctermfg=Magenta       guifg=#00ffff
    hi Special    term=bold        ctermfg=DarkMagenta   guifg=#4499ff
    hi Identifier term=underline ctermfg=Cyan            guifg=#40ffff
    hi Statement  term=bold       ctermfg=Yellow         guifg=#16f0a4 
    hi PreProc    term=underline   ctermfg=LightBlue     guifg=#ee1111
    hi Type       term=underline   ctermfg=LightGreen    guifg=#9999ff
    hi Function   term=bold        ctermfg=White         guifg=#ffeecc
    hi Repeat     term=underline   ctermfg=White         guifg=#ff99cc
    hi Conditional term=underline   ctermfg=White         guifg=#cc88ff
    hi Operator                  ctermfg=Red             guifg=#ffff00
    hi Ignore                    ctermfg=black           guifg=bg
endif
  hi Error      term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
  hi Todo       term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow

  " Common groups that link to default highlighting.
  " You can specify other highlighting easily.
  hi link String        Constant
  hi link Character     Constant
  hi link Number        Constant
  hi link Boolean       Constant
  hi link Float         Number
  hi link Conditional   Statement
  hi link Label         Statement
  hi link Keyword       Statement
  hi link Exception     Statement
  hi link Include       PreProc
  hi link Define        PreProc
  hi link Macro         PreProc
  hi link PreCondit     PreProc
  hi link StorageClass  Type
  hi link Structure     Type
  hi link Typedef       Type
  hi link Tag           Special
  hi link SpecialChar   Special
  hi link Delimiter     Special
  hi link SpecialComment Special
  hi link Debug         Special


" vim
" List of words from Microsoft Word 7, with some additions
" Author: Matt Corks <mvcorks@uwaterloo.ca>
ab accesories accessories
ab accomodate accommodate
ab acheive achieve
ab acheiving achieving
ab acn can
ab acommodate accommodate
ab acomodate accommodate
ab adn and
ab agian again
ab ahppen happen
ab ahve have
ab ahve have
ab allready already
ab almsot almost
ab alot a lot
ab alreayd already
ab alwasy always
ab amke make
ab anbd and
ab andthe and the
ab appeares appears
ab aplyed applied
ab artical article
ab audeince audience
ab audiance audience
ab awya away
ab bakc back
ab balence balance
ab baout about
ab bcak back
ab beacuse because
ab becasue because
ab becomeing becoming
ab becuase because
ab becuse because
ab befoer before
ab begining beginning
ab beleive believe
ab boxs boxes
ab bve be
ab changeing changing
ab charachter character
ab charecter character
ab charector character
ab cheif chief
ab circut circuit
ab claer clear
ab claerly clearly
ab cna can
ab colection collection
ab comany company
ab comapny company
ab comittee committee
ab commitee committee
ab committe committee
ab committy committee
ab compair compare
ab compleated completed
ab completly completely
ab comunicate communicate
ab comunity community
ab conected connected
ab cotten cotton
ab coudl could
ab cpoy copy
ab cxan can
ab danceing dancing
ab definately definitely
ab develope develop
ab developement development
ab differant different
ab differnt different
ab diffrent different
ab disatisfied dissatisfied
ab doese does
ab doign doing
ab doller dollars
ab donig doing
ab driveing driving
ab drnik drink
ab ehr her
ab embarass embarrass
ab equippment equipment
ab esle else
ab excitment excitement
ab eyt yet
ab familar familiar
ab feild field
ab fianlly finally
ab fidn find
ab firts first
ab follwo follow
ab follwoing following
ab foriegn foreign
ab fro for
ab foudn found
ab foward forward
ab freind friend
ab frmo from
ab fwe few
ab gerat great
ab geting getting
ab giveing giving
ab goign going
ab gonig going
ab govenment government
ab gruop group
ab grwo grow
ab haev have
ab happend happened
ab haveing having
ab hda had
ab helpfull helpful
ab herat heart
ab hge he
ab hismelf himself
ab hsa has
ab hsi his
ab hte the
ab htere there
ab htey they
ab hting thing
ab htink think
ab htis this
ab hvae have
ab hvaing having
ab idae idea
ab idaes ideas
ab ihs his
ab immediatly immediately
ab indecate indicate
ab insted intead
ab inthe in the
ab iwll will
ab iwth with
ab jsut just
ab knwo know
ab knwos knows
ab konw know
ab konws knows
ab levle level
ab libary library
ab librarry library
ab librery library
ab librarry library
ab liek like
ab liekd liked
ab liev live
ab likly likely
ab littel little
ab liuke like
ab liveing living
ab loev love
ab lonly lonely
ab makeing making
ab mkae make
ab mkaes makes
ab mkaing making
ab moeny money
ab mroe more
ab mysefl myself
ab myu my
ab neccessary necessary
ab necesary necessary
ab nkow know
ab nwe new
ab nwo now
ab ocasion occasion
ab occassion occasion
ab occurence occurrence
ab occurrance occurrence
ab ocur occur
ab oging going
ab ohter other
ab omre more
ab onyl only
ab optoin option
ab optoins options
ab opperation operation
ab orginized organized
ab otehr other
ab otu out
ab owrk work
ab peopel people
ab perhasp perhaps
ab perhpas perhaps
ab pleasent pleasant
ab poeple people
ab porblem problem
ab probelm problem
ab protoge protege
ab puting putting
ab pwoer power
ab quater quarter
ab questoin question
ab reccomend recommend
ab reccommend recommend
ab receieve receive
ab recieve receive
ab recieved received
ab recomend recommend
ab reconize recognize
ab recrod record
ab religous religious
ab rwite write
ab rythm rhythm
ab seh she
ab selectoin selection
ab sentance sentence
ab seperate separate
ab shineing shining
ab shiped shipped
ab shoudl should
ab similiar similar
ab smae same
ab smoe some
ab soem some
ab sohw show
ab soudn sound
ab soudns sounds
ab statment statement
ab stnad stand
ab stopry story
ab stoyr story
ab stpo stop
ab strentgh strength
ab struggel struggle
ab sucess success
ab swiming swimming
ab tahn than
ab taht that
ab talekd talked
ab tath that
ab teh the
ab tehy they
ab tghe the
ab thansk thanks
ab themselfs themselves
ab theri their
ab thgat that
ab thge the
ab thier their
ab thme them
ab thna than
ab thne then
ab thnig thing
ab thnigs things
ab thsi this
ab thsoe those
ab thta that
ab tihs this
ab timne time
ab tje the
ab tjhe the
ab tkae take
ab tkaes takes
ab tkaing taking
ab tlaking talking
ab todya today
ab tongiht tonight
ab tonihgt tonight
ab towrad toward
ab truely truly
ab tyhat that
ab tyhe the
ab useing using
ab veyr very
ab vrey very
ab waht what
ab watn want
ab wehn when
ab whcih which
ab whic which
ab whihc which
ab whta what
ab wief wife
ab wierd weird
ab wihch which
ab wiht with
ab windoes windows
ab withe with
ab wiull will
ab wnat want
ab wnated wanted
ab wnats wants
ab woh who
ab wohle whole
ab wokr work
ab woudl would
ab wriet write
ab wrod word
ab wroking working
ab wtih with
ab wya way
ab yera year
ab yeras years
ab ytou you
ab yuo you
ab yuor your
" Days of weeks
ab monday Monday
ab tuesday Tuesday
ab wednesday Wednesday
ab thursday Thursday
ab friday Friday
ab saturday Saturday
ab sunday Sunday
" Other
ab xmas Christmas
ab Xmas Christmas
