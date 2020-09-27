let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <D-BS> 
inoremap <M-BS> 
inoremap <M-Down> }
inoremap <D-Down> <C-End>
inoremap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
inoremap <silent> <S-Tab> =BackwardsSnippet()
nnoremap  
snoremap <silent> 	 i<Right>=TriggerSnippet()
nnoremap <NL> <NL>
nnoremap  
nnoremap  
vnoremap  :nohls
onoremap  :nohls
nnoremap <silent>  :CtrlP
nnoremap  :q!
vnoremap  "hy:%s/h//gc<Left><Left><Left>
nnoremap  :tabnew
nnoremap  :tabclose
snoremap  b<BS>
snoremap % b<BS>%
snoremap ' b<BS>'
snoremap U b<BS>U
snoremap \ b<BS>\
noremap <silent> \cc :call CommentLine()
map \\y :set ft=yaml
map \\t :set ft=text
map \\S :set ft=sql
map \\s :set ft=sh
map \\r :set ft=ruby
map \\m :set ft=markdown
map \\j :set ft=javascript
map \\H :set ft=haml
map \\h :set ft=html
map \\C :set ft=coffee
map \\c :set ft=css
map \bi :call InsertBindingPry()
map \b :call RemoveBindingPry()
map \f :call OpenFactories()
map \r :call OpenRoutes()
map \g :call OpenGemFile()
map \- :call CollapseMultipleBlankLines()
map \= :call TrimWhiteSpace()
nnoremap \sr :!rake routes
vmap \a: :Tabularize /:\zs
nmap \a: :Tabularize /:\zs
vmap \a= :Tabularize /=
nmap \a= :Tabularize /=
snoremap ^ b<BS>^
snoremap ` b<BS>`
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nnoremap <SNR>98_: :=v:count ? v:count : ''
noremap <silent> <Plug>AirlineSelectNextTab :exe repeat(':tabn|', v:count1)
noremap <silent> <Plug>AirlineSelectPrevTab gT
noremap <silent> <Plug>AirlineSelectTab9 :9tabn
noremap <silent> <Plug>AirlineSelectTab8 :8tabn
noremap <silent> <Plug>AirlineSelectTab7 :7tabn
noremap <silent> <Plug>AirlineSelectTab6 :6tabn
noremap <silent> <Plug>AirlineSelectTab5 :5tabn
noremap <silent> <Plug>AirlineSelectTab4 :4tabn
noremap <silent> <Plug>AirlineSelectTab3 :3tabn
noremap <silent> <Plug>AirlineSelectTab2 :2tabn
noremap <silent> <Plug>AirlineSelectTab1 :1tabn
nnoremap <SNR>88_: :=v:count ? v:count : ''
noremap <M-Down> }
noremap <D-Down> <C-End>
noremap <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> b<BS>
snoremap <silent> <S-Tab> i<Right>=BackwardsSnippet()
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <Plug>GitGutterPreviewHunk :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterUndoHunk :GitGutterUndoHunk
nnoremap <silent> <Plug>GitGutterStageHunk :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
xnoremap <silent> <Plug>GitGutterTextObjectOuterVisual :call gitgutter#hunk#text_object(0)
xnoremap <silent> <Plug>GitGutterTextObjectInnerVisual :call gitgutter#hunk#text_object(1)
onoremap <silent> <Plug>GitGutterTextObjectOuterPending :call gitgutter#hunk#text_object(0)
onoremap <silent> <Plug>GitGutterTextObjectInnerPending :call gitgutter#hunk#text_object(1)
noremap <F12> :source ~/.vimrc
nnoremap <C-Left> :tabprevious
nnoremap <C-Right> :tabnext
xmap <BS> "-d
inoremap <silent> 	 =TriggerSnippet()
imap  <Plug>DiscretionaryEnd
inoremap <silent> 	 =ShowAvailableSnips()
map! \bi :call InsertBindingPry()
map! \b :call RemoveBindingPry()
map! \- :call CollapseMultipleBlankLines()
map! \= :call TrimWhiteSpace()
cmap w!! w !sudo tee % > /dev/null
cabbr tabe tab drop
let &cpo=s:cpo_save
unlet s:cpo_save
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set balloonexpr=SyntasticBalloonsExprNotifier()
set clipboard=unnamed
set complete=.,w,b,u,t
set errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,\ %#Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-G\ %#Overwrite%.%#\"h\"%.%#,%+GStarted\ %\\u%\\u%.%#,%+GCompleted\ %\\d%\\d%\\d%.%#,%+G[ActiveJob]%.%#]\ Perform%.%#,%.%#rails\ test\ %f:%l,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ The\ fixture\ ID\ for\ %.%#,%f:\ %s\ (%m)%$%\\&%.%#/fixtures/%.%#(%\\d%\\+),%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Irails\ %\\S%\\+%\\s%\\+#\ %.%#,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%\\&completion=rails#complete_rake,%\\&console=console,%\\&start=server,%\\&terminal=%\\C%\\%%(console%\\|dbconsole%\\|server%\\|%[cs]%\\|db%\\)%\\>:%\\@!%\\ze%.%#,%\\&default=default,%D(in\ %f),%\\s%#%\\d%#:%#\ %#from\ %f:%l:%m,%\\s%#%\\d%#:%#\ %#from\ %f:%l:,%\\s%##\ %f:%l:%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%##\ %f:%l%\\&%.%#%\\D:%\\d%\\+,%\\s%#[%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:,%m\ [%f:%l]:,%+Erake\ aborted!,%+EDon't\ know\ how\ to\ build\ task\ %.%#,%+Einvalid\ option:%.%#,%+Irake\ %\\S%\\+%\\s%\\+#\ %.%#,%\\&chdir\ /Users/eduardo/projects/ngr,%\\&buffer=%%:s/.*/\\=rails#buffer(submatch(0)).default_rake_task(exists('l#')\ ?\ l#\ :\ 0)/
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Roboto\ Mono\ for\ Powerline
set guioptions=g
set guitablabel=%M%t
set helplang=en
set history=256
set hlsearch
set ignorecase
set incsearch
set langmenu=none
set laststatus=2
set mouse=a
set omnifunc=rubycomplete#Complete
set path=.,,**
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set ruler
set runtimepath=
set runtimepath+=~/.vim
set runtimepath+=~/.vim/plugged/tabular/
set runtimepath+=~/.vim/plugged/syntastic/
set runtimepath+=~/.vim/plugged/Dockerfile.vim/
set runtimepath+=~/.vim/plugged/vim-airline/
set runtimepath+=~/.vim/plugged/vim-airline-themes/
set runtimepath+=~/.vim/plugged/vim-rails/
set runtimepath+=~/.vim/plugged/vim-endwise/
set runtimepath+=~/.vim/plugged/vim-gitgutter/
set runtimepath+=~/.vim/plugged/vim-fugitive/
set runtimepath+=~/.vim/plugged/vim-coffee-script/
set runtimepath+=~/.vim/plugged/indentLine/
set runtimepath+=~/.vim/plugged/snipmate.vim/
set runtimepath+=~/.vim/plugged/tmuxline.vim/
set runtimepath+=~/.vim/plugged/ctrlp.vim/
set runtimepath+=~/.vim/plugged/vim-jsx-improve/
set runtimepath+=~/.vim/plugged/base16-vim/
set runtimepath+=~/.vim/plugged/evening_vim/
set runtimepath+=~/.vim/plugged/vim-vendetta/
set runtimepath+=~/.vim/plugged/summerfruit256.vim/
set runtimepath+=~/.vim/plugged/vim-lucius/
set runtimepath+=~/.vim/plugged/vim-colors-pencil/
set runtimepath+=~/.vim/plugged/papercolor-theme/
set runtimepath+=/usr/local/Cellar/macvim/8.1-156/MacVim.app/Contents/Resources/vim/vimfiles
set runtimepath+=/usr/local/Cellar/macvim/8.1-156/MacVim.app/Contents/Resources/vim/runtime
set runtimepath+=/usr/local/Cellar/macvim/8.1-156/MacVim.app/Contents/Resources/vim/vimfiles/after
set runtimepath+=~/.vim/plugged/tabular/after
set runtimepath+=~/.vim/plugged/vim-rails/after
set runtimepath+=~/.vim/plugged/vim-coffee-script/after
set runtimepath+=~/.vim/plugged/indentLine/after
set runtimepath+=~/.vim/plugged/snipmate.vim/after
set runtimepath+=~/.vim/plugged/vim-jsx-improve/after
set runtimepath+=~/.vim/after
set scrolloff=3
set shiftwidth=2
set showtabline=2
set sidescroll=1
set sidescrolloff=7
set smartcase
set splitbelow
set splitright
set noswapfile
set tabline=%!airline#extensions#tabline#get()
set tabstop=2
set termencoding=utf-8
set wildignore=*~
set wildmenu
set wildmode=list:longest
set window=129
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/projects/ngr
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd app/models/address.rb
tabnew
tabrewind
edit app/models/organization.rb
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> [c <Plug>GitGutterPrevHunk
nmap <buffer> \hp <Plug>GitGutterPreviewHunk
nmap <buffer> \hu <Plug>GitGutterUndoHunk
nmap <buffer> \hs <Plug>GitGutterStageHunk
nmap <buffer> ]c <Plug>GitGutterNextHunk
xmap <buffer> ac <Plug>GitGutterTextObjectOuterVisual
omap <buffer> ac <Plug>GitGutterTextObjectOuterPending
xmap <buffer> ic <Plug>GitGutterTextObjectInnerVisual
omap <buffer> ic <Plug>GitGutterTextObjectInnerPending
cmap <buffer>  <Plug><cfile>
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80,100
setlocal colorcolumn=80,100
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
set cursorcolumn
setlocal cursorcolumn
set cursorline
setlocal cursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,\ %#Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-G\ %#Overwrite%.%#\"h\"%.%#,%+GStarted\ %\\u%\\u%.%#,%+GCompleted\ %\\d%\\d%\\d%.%#,%+G[ActiveJob]%.%#]\ Perform%.%#,%.%#rails\ test\ %f:%l,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ The\ fixture\ ID\ for\ %.%#,%f:\ %s\ (%m)%$%\\&%.%#/fixtures/%.%#(%\\d%\\+),%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Irails\ %\\S%\\+%\\s%\\+#\ %.%#,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%\\&completion=rails#complete_rake,%\\&console=console,%\\&start=server,%\\&terminal=%\\C%\\%%(console%\\|dbconsole%\\|server%\\|%[cs]%\\|db%\\)%\\>:%\\@!%\\ze%.%#,%\\&default=default,%D(in\ %f),%\\s%#%\\d%#:%#\ %#from\ %f:%l:%m,%\\s%#%\\d%#:%#\ %#from\ %f:%l:,%\\s%##\ %f:%l:%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%##\ %f:%l%\\&%.%#%\\D:%\\d%\\+,%\\s%#[%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:,%m\ [%f:%l]:,%+Erake\ aborted!,%+EDon't\ know\ how\ to\ build\ task\ %.%#,%+Einvalid\ option:%.%#,%+Irake\ %\\S%\\+%\\s%\\+#\ %.%#,%\\&chdir\ /Users/eduardo/projects/ngr,%\\&buffer=%%:s/.*/\\=rails#buffer(submatch(0)).default_rake_task(exists('l#')\ ?\ l#\ :\ 0)/
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,:,.,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end,=private,=protected,=public
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T\ -f\ bs
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal nomacmeta
setlocal makeencoding=
setlocal makeprg=bin/rake
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=
setlocal path+=.
setlocal path+=~/projects/ngr/lib
setlocal path+=~/projects/ngr/vendor
setlocal path+=~/projects/ngr/app/models/concerns
setlocal path+=~/projects/ngr/app/controllers/concerns
setlocal path+=~/projects/ngr/app/controllers
setlocal path+=~/projects/ngr/app/helpers
setlocal path+=~/projects/ngr/app/mailers
setlocal path+=~/projects/ngr/app/models
setlocal path+=~/projects/ngr/app/jobs
setlocal path+=~/projects/ngr/app/*
setlocal path+=~/projects/ngr/test
setlocal path+=~/projects/ngr/test/unit
setlocal path+=~/projects/ngr/test/functional
setlocal path+=~/projects/ngr/test/integration
setlocal path+=~/projects/ngr/test/controllers
setlocal path+=~/projects/ngr/test/helpers
setlocal path+=~/projects/ngr/test/mailers
setlocal path+=~/projects/ngr/test/models
setlocal path+=~/projects/ngr/test/jobs
setlocal path+=~/projects/ngr/spec
setlocal path+=~/projects/ngr/spec/controllers
setlocal path+=~/projects/ngr/spec/helpers
setlocal path+=~/projects/ngr/spec/mailers
setlocal path+=~/projects/ngr/spec/models
setlocal path+=~/projects/ngr/spec/views
setlocal path+=~/projects/ngr/spec/lib
setlocal path+=~/projects/ngr/spec/features
setlocal path+=~/projects/ngr/spec/requests
setlocal path+=~/projects/ngr/spec/integration
setlocal path+=~/projects/ngr/spec/jobs
setlocal path+=~/projects/ngr/app/views
setlocal path+=~/projects/ngr
setlocal path+=~/projects/ngr/vendor/plugins/*/lib
setlocal path+=~/projects/ngr/vendor/rails/*/lib
setlocal path+=**
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/2.4.0
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/2.4.0/x86_64-darwin18
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/2.4.0
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/2.4.0/x86_64-darwin18
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/x86_64-darwin18
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=.rb,.raw,.erb,.html,.builder,.ruby,.coffee,.haml,.jbuilder
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tagfunc=
setlocal tags=~/projects/ngr/tags,~/projects/ngr/tmp/tags,./tags,tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/2.4.0/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/2.4.0/x86_64-darwin18/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/2.4.0/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/2.4.0/x86_64-darwin18/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/x86_64-darwin18/tags
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 2 - ((1 * winheight(0) + 63) / 127)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 076|
lcd ~/projects/ngr
tabnext
edit ~/projects/ngr/app/models/address.rb
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
1argu
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> [c <Plug>GitGutterPrevHunk
nmap <buffer> \hp <Plug>GitGutterPreviewHunk
nmap <buffer> \hu <Plug>GitGutterUndoHunk
nmap <buffer> \hs <Plug>GitGutterStageHunk
nmap <buffer> ]c <Plug>GitGutterNextHunk
xmap <buffer> ac <Plug>GitGutterTextObjectOuterVisual
omap <buffer> ac <Plug>GitGutterTextObjectOuterPending
xmap <buffer> ic <Plug>GitGutterTextObjectInnerVisual
omap <buffer> ic <Plug>GitGutterTextObjectInnerPending
cmap <buffer>  <Plug><cfile>
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80,100
setlocal colorcolumn=80,100
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
set cursorcolumn
setlocal cursorcolumn
set cursorline
setlocal cursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,\ %#Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-G\ %#Overwrite%.%#\"h\"%.%#,%+GStarted\ %\\u%\\u%.%#,%+GCompleted\ %\\d%\\d%\\d%.%#,%+G[ActiveJob]%.%#]\ Perform%.%#,%.%#rails\ test\ %f:%l,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ The\ fixture\ ID\ for\ %.%#,%f:\ %s\ (%m)%$%\\&%.%#/fixtures/%.%#(%\\d%\\+),%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Irails\ %\\S%\\+%\\s%\\+#\ %.%#,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%\\&completion=rails#complete_rake,%\\&console=console,%\\&start=server,%\\&terminal=%\\C%\\%%(console%\\|dbconsole%\\|server%\\|%[cs]%\\|db%\\)%\\>:%\\@!%\\ze%.%#,%\\&default=default,%D(in\ %f),%\\s%#%\\d%#:%#\ %#from\ %f:%l:%m,%\\s%#%\\d%#:%#\ %#from\ %f:%l:,%\\s%##\ %f:%l:%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%##\ %f:%l%\\&%.%#%\\D:%\\d%\\+,%\\s%#[%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:,%m\ [%f:%l]:,%+Erake\ aborted!,%+EDon't\ know\ how\ to\ build\ task\ %.%#,%+Einvalid\ option:%.%#,%+Irake\ %\\S%\\+%\\s%\\+#\ %.%#,%\\&chdir\ /Users/eduardo/projects/ngr,%\\&buffer=%%:s/.*/\\=rails#buffer(submatch(0)).default_rake_task(exists('l#')\ ?\ l#\ :\ 0)/
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,:,.,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end,=private,=protected,=public
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T\ -f\ bs
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal nomacmeta
setlocal makeencoding=
setlocal makeprg=bin/rake
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=
setlocal path+=.
setlocal path+=~/projects/ngr/lib
setlocal path+=~/projects/ngr/vendor
setlocal path+=~/projects/ngr/app/models/concerns
setlocal path+=~/projects/ngr/app/controllers/concerns
setlocal path+=~/projects/ngr/app/controllers
setlocal path+=~/projects/ngr/app/helpers
setlocal path+=~/projects/ngr/app/mailers
setlocal path+=~/projects/ngr/app/models
setlocal path+=~/projects/ngr/app/jobs
setlocal path+=~/projects/ngr/app/*
setlocal path+=~/projects/ngr/test
setlocal path+=~/projects/ngr/test/unit
setlocal path+=~/projects/ngr/test/functional
setlocal path+=~/projects/ngr/test/integration
setlocal path+=~/projects/ngr/test/controllers
setlocal path+=~/projects/ngr/test/helpers
setlocal path+=~/projects/ngr/test/mailers
setlocal path+=~/projects/ngr/test/models
setlocal path+=~/projects/ngr/test/jobs
setlocal path+=~/projects/ngr/spec
setlocal path+=~/projects/ngr/spec/controllers
setlocal path+=~/projects/ngr/spec/helpers
setlocal path+=~/projects/ngr/spec/mailers
setlocal path+=~/projects/ngr/spec/models
setlocal path+=~/projects/ngr/spec/views
setlocal path+=~/projects/ngr/spec/lib
setlocal path+=~/projects/ngr/spec/features
setlocal path+=~/projects/ngr/spec/requests
setlocal path+=~/projects/ngr/spec/integration
setlocal path+=~/projects/ngr/spec/jobs
setlocal path+=~/projects/ngr/app/views
setlocal path+=~/projects/ngr
setlocal path+=~/projects/ngr/vendor/plugins/*/lib
setlocal path+=~/projects/ngr/vendor/rails/*/lib
setlocal path+=**
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/2.4.0
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/2.4.0/x86_64-darwin18
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/2.4.0
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/2.4.0/x86_64-darwin18
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0
setlocal path+=~/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/x86_64-darwin18
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=.rb,.raw,.erb,.html,.builder,.ruby,.coffee,.haml,.jbuilder
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tagfunc=
setlocal tags=~/projects/ngr/tags,~/projects/ngr/tmp/tags,./tags,tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/2.4.0/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/2.4.0/x86_64-darwin18/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/site_ruby/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/2.4.0/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/2.4.0/x86_64-darwin18/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/vendor_ruby/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/tags,~/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/x86_64-darwin18/tags
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 34 - ((32 * winheight(0) + 63) / 127)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
34
normal! 070|
lcd ~/projects/ngr
tabnext 2
badd +1 ~/projects/ngr/spec/models/cvd_form_spec.rb
badd +1 ~/projects/ngr/spec/factories/payees.rb
badd +59 ~/projects/ngr/spec/factories/forms.rb
badd +22 ~/projects/ngr/app/jobs/update_certificate_suggested_options_job.rb
badd +40 ~/projects/ngr/app/models/cvd_form.rb
badd +40 ~/projects/ngr/spec/rails_helper.rb
badd +1 ~/projects/ngr/spec/support/background_jobs.rb
badd +0 ~/projects/ngr/config/environments/test.rb
badd +89 ~/projects/ngr/spec/models/cvd_form_version_spec.rb
badd +1 ~/projects/ngr/spec/factories/certificates.rb
badd +1 ~/projects/ngr/app/models/certificate_suggested_option.rb
badd +4 ~/docker-compose.yml
badd +14 ~/projects/ngr/.circleci/config.yml
badd +458 ~/projects/ngr/config/routes.rb
badd +1 ~/projects/ngr/spec/models/combined_harvest_declaration/card_spec.rb
badd +31 ~/projects/ngr/app/controllers/combined_harvest_declaration/reports_controller.rb
badd +93 ~/projects/ngr/spec/requests/report_download_log_spec.rb
badd +5 ~/projects/ngr/test/factories/combined_harvest_declaration/suppliers.rb
badd +1 ~/projects/ngr/test/factories/combined_harvest_declaration/seasons.rb
badd +463 ~/projects/ngr/db/schema.rb
badd +25 ~/projects/ngr/app/extras/combined_harvest_declaration/report_generator.rb
badd +2 ~/projects/ngr/app/models/organization.rb
badd +212 ~/projects/ngr/app/extras/certificates/pack_audit_certificates_service.rb
badd +0 ~/projects/ngr/app/models/address.rb
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOS
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
