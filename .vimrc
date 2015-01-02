
"-----------------------------------------
"NeoBundle


" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
    colorscheme desert
    " その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
    " 読み込むプラグインの指定
    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'tomasr/molokai'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'nathanaelkane/vim-indent-guides'
    NeoBundle 'itchyny/lightline.vim'
    NeoBundleLazy 'thinca/vim-fontzoom'
    " ...
    " 読み込んだプラグインの設定
    " ...
endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
    if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        filetype plugin indent off
        if has('vim_starting')
            set runtimepath+=~/.vim/bundle/neobundle.vim/
        endif
        try
            call neobundle#begin(expand('~/.vim/bundle/'))
            call s:LoadBundles()
            call neobundle#end()
        catch
            call s:WithoutBundles()
        endtry 
    else
        call s:WithoutBundles()
    endif

    filetype indent plugin on
    syntax on
endfunction

call s:InitNeoBundle()

"-----------------------------------------
"Unite

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nn.vimoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
	"ESCでuniteを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
	"入力モードのときctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+jで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	"ctrl+jで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}


"-----------------------------------------
"colorscheme
colorscheme molokai


"-----------------------------------------
"non backup settings
set noswapfile
set nobackup
set nowritebackup
set notitle
set viminfo=

"-----------------------------------------

set nrformats=

set virtualedit=block

set incsearch
set ignorecase

set smartcase

set wrapscan

set smartindent
set autoindent

set formatoptions-=c

set showmatch

set smarttab

set ruler
set number

set lazyredraw

" カーソル行のハイライト
set cursorline

set showcmd

set visualbell t_vb=


"-----------------------------------------
" キーバインド
nnoremap <ESC><ESC> :noh<CR>
nnoremap :setlocal relativenumber!

"-----------------------------------------
"
let g:indent_guides_enable_on_vim_startup = 1

setlocal expandtab
setlocal tabstop<
setlocal softtabstop=4
setlocal shiftwidth=4





