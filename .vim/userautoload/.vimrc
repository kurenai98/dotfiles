set nocompatible
filetype off

if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim
   call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'git://github.com/karakaram/vim-quickrun-phpunit.git'

" Color Scheme
" solarized カラースキーム
  NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
  NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
  NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
  NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
  NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
  NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
  NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
  NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
  NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
  NeoBundle 'tomasr/molokai'

filetype plugin on
filetype indent on

" Color Scheme Configure:
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_hitrail=1
let g:solarized_visibility=1
colorscheme solarized
"colorscheme molokai

"--------------------
" 基本的な設定
"--------------------
"新しい行のインデントを現在行と同じにする
set autoindent 

"vi互換をオフする
set nocompatible

"タブの代わりに空白文字を指定する
set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"新しい行を作った時に高度な自動インデントを行う
set smarttab

set cursorline

set tabstop=4

set shiftwidth=4

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

set laststatus=2

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit
augroup END

let g:quickrun_config = {}
let g:quickrun_config['_'] = {}
" runnerにvimprocを設定。phpunitの実行中にVimがフリーズしなくなる
let g:quickrun_config['_']['runner'] = 'vimproc'
let g:quickrun_config['_']['runner/vimproc/updatetime'] = 100

" ステータスラインの下に結果を表示
let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter'] = 'phpunit'
let g:quickrun_config['phpunit']['command'] = 'phpunit --colors'
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'

let g:quickrun_config['phpunit']['outputter/phpunit/height'] = 3
let g:quickrun_config['phpunit']['outputter/phpunit/running_mark'] = 'running...'
let g:quickrun_config['phpunit']['outputter/phpunit/auto_open'] = 0

let g:quickrun_config={'*': {'split': ''}}
set splitbelow


" Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" " ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" " 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" " レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" " ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" " 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" " ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


