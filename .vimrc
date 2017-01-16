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
    "colorscheme
    NeoBundle 'tomasr/molokai'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'croaker/mustang-vim'
    NeoBundle 'jeffreyiacono/vim-colors-wombat'
    NeoBundle 'nanotech/jellybeans.vim'
    NeoBundle 'vim-scripts/Lucius'
    NeoBundle 'vim-scripts/Zenburn'
    NeoBundle 'mrkn/mrkn256.vim'
    NeoBundle 'jpo/vim-railscasts-theme'
    NeoBundle 'therubymug/vim-pyte'


    " 総合的
    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/neocomplete'				"自動補完
    NeoBundle 'Shougo/vimshell'				"vim上でshell
    NeoBundle 'Shougo/unite.vim.git'			"インターフェース
    NeoBundle 'Shougo/unite-outline'			"outline表示できる（超便利
    NeoBundle 'thinca/vim-singleton'			"既にvimウィンドウを開いているときにタブで開く


    " 画面表示系
    NeoBundle 'HybridText'						"かっこいいシンタックス
    NeoBundle 'itchyny/lightline.vim'			"ステータスラインをかっこよくする
    NeoBundle 'thinca/vim-fontzoom'				"フォント変更
    NeoBundle 'ujihisa/unite-colorscheme'		"カラースキーム

    " コーディング補助系
    NeoBundle 'houtsnip/vim-emacscommandline'	"コマンドラインでemacsキーバインド
    NeoBundle 'tpope/vim-surround'				"括弧とかでくくりやすくする
    NeoBundle 'nathanaelkane/vim-indent-guides'	"インデントに色がついてかっこいい


	if has('win32')
		NeoBundle 'Townk/vim-autoclose'				"括弧とかを閉じる
    endif

    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'tpope/vim-endwise'				" beginやdoもendで囲んでくれるよ
    NeoBundle 'vim-ruby/vim-ruby'
    NeoBundle 'AndrewRadev/switch.vim'			"true/falseなどをトグル操作
    NeoBundle 'tomtom/tcomment_vim'
    NeoBundle 'koron/codic-vim'					" 命名の辞書


    " テキスト編集系
    NeoBundle 'DrawIt'							"図形を描画
    NeoBundle 'Align'							"テキスト整形

    " markdown
    NeoBundle 'kannokanno/previm'				"markdown over vim
    NeoBundle 'tyru/open-browser.vim'			"ブラウザを開く
    NeoBundle 'rhysd/vim-gfm-syntax'			"markdown syntax


    " evernote
    NeoBundle 'kakkyz81/evervim'


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


"---------------------------------------------------------------------------
" vim-singleton

call singleton#enable()

"---------------------------------------------------------------------------
" Previm

" リアルタイム更新
let g:previm_enable_realtime = 1

"---------------------------------------------------------------------------
" vim-indent-guides
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

"---------------------------------------------------------------------------
" showmarks
" 表示するmarkをアルファベットだけにする
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"


"---------------------------------------------------------------------------
" hybridtext

"markdownのシンタックスハイライトはダサいけど、いったんhybridにした後の
"markdownはかっこいいので、autocmdで黒魔術！
autocmd BufEnter * call s:re_detect_filetype()

" 自動折り返し禁止
autocmd FileType text setlocal textwidth=0

"---------------------------------------------------------------------------
" Align

" 日本語を扱えるようにする
" let g:Align_xstrlen=3
" ↑なんかこれだとスクロールが変なところに行ってしまう
let g:Align_xstrlen=0
let g:DrChipTopLvlMenu = ''

"---------------------------------------------------------------------------
" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"---------------------------------------------------------------------------
" evervim

let g:evervim_devtoken='dummy'

nnoremap <Leader>l :EvervimNotebookList<CR>
nnoremap <Leader>s :EvervimSearchByQuery<Space>
nnoremap <Leader>c :EvervimCreateNote<CR>
nnoremap <Leader>t :EvervimListTags<CR>


"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を表示 
set number
" 相対行数を表示(MacType入れると描画が重くなったのでやめた
"set relativenumber

" タブをスペースに変換
set expandtab

" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4



" カーソルの強調
set cursorline

"スクロールの設定
set scrolloff=8

" quickrunの表示系
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
set previewheight=20

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない 
set nobackup
set noswapfile
set noundofile
set viminfo=

" カレントディレクトリの変更(vimshellと競合する模様
set autochdir


" エンコーディング
if has('win32')
	set enc=cp932
	set fenc=cp932
	set fileformats=dos,unix,mac
"elseif has('mac')
elseif has('mac')
	set enc=utf-8
	set fenc=utf-8
	set fileformats=mac,unix,dos
endif


set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932



"---------------------------------------------------------------------------
"coding

"indent解釈
set smartindent

"折りたたみ
" set foldmethod=syntax

"---------------------------------------------------------------------------
" 編集に関する設定:
set formatoptions=q

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
" set visualbell      

" ビープ音も画面フラッシュも消す
set vb t_vb=        
" ↑ t_vbはgvimが起動したときにリセットされるのでgvimrcでの設定が必要なので
" 注意！ なので_gvimrcにも書いてあります

"ctrl+a,xを10進数にする
set nf=""			

" 自動改行の回避
set tw=0

" インクリメンタルサーチ
set incsearch

"---------------------------------------------------------------------------
" キーマップ
" モード			再割当有り	再割当無し
" normal+visual		noremap		map
" command+insert	noremap!	map!
" normal			nnoremap	nmap
" visual			vnoremap	vmap
" command			cnoremap	cmap
" insert			inoremap	imap

" Esc の 2 回押しでハイライトを消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap <C-j><C-j> :nohlsearch<CR><ESC>

"新規タブ
nnoremap <C-T>     :tabnew %<CR>

" タブ移動
nnoremap <C-l>     gt
nnoremap <C-h>     gT

" タブの入れ替え
nnoremap <Space>tH   <ESC>:tabm -1<CR> 
nnoremap <Space>tL   <ESC>:tabm +1<CR>


" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

" Fontzoomの誤爆回避
nnoremap - <Nop>
nnoremap + <Nop>

" 相対行数の表示
nnoremap <F3> <ESC>:<C-u>setlocal relativenumber!<CR>

" .vimrc読み込み
nnoremap <F4> <ESC>:tabnew $HOME/.vimrc<CR>
nnoremap <F5> <ESC>:source $HOME/.vimrc<CR>:source $HOME/.gvimrc<CR>

" timestamp
nnoremap <F6> <ESC>a<C-R>=strftime("%Y%m%d")<CR><ESC>
inoremap <F6> <ESC>a<C-R>=strftime("%Y%m%d")<CR><ESC>a
nnoremap <F7> <ESC>a<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR><ESC>
inoremap <F7> <ESC>a<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR><ESC>a

" 入力切替
nnoremap <F8> <ESC>:<C-u>setlocal imi=2<CR>
inoremap <F8> <ESC>:<C-u>setlocal imi=2<CR>a
nnoremap <F9> <ESC>:<C-u>setlocal imi=0<CR>
inoremap <F9> <ESC>:<C-u>setlocal imi=0<CR>a

" 全体整形
nnoremap <M-S-F> :call <SID>format_file()<CR>
nnoremap <Space>kD :call <SID>format_file()<CR>

" メモの作成
nnoremap <Space>m :<C-u>call <SID>touch_with_desktop(0)<CR>
nnoremap <Space>M :<C-u>call <SID>touch_with_desktop(1)<CR>

" 透過率のトグルスイッチ
nnoremap <silent> <Space>oT :<C-u>call <SID>toggle_transparence()<CR>

" ファイルタイプの再解釈
nnoremap <silent> <Space>oF :<C-u>call <SID>re_detect_filetype()<CR>

" 文字コードの読み込み
nnoremap <silent> <Space>oU :e ++enc=utf8<CR>
nnoremap <silent> <Space>oS :e ++enc=cp932<CR>

" windowsのクリップボードに全体をコピー
nnoremap <silent> <Space>aY mmggVG"*y`m

" 全削除
nnoremap <silent> <Space>aD ggdG

" 箇条書きの用意
nnoremap <silent> <Space>kN :<C-u>call <SID>put_num_list(7)<CR>
nnoremap <silent> <Space>kA :<C-u>call <SID>put_ast_list(7)<CR>

nnoremap <silent> <Space>mL :<C-u>call <SID>markdown_link()<CR>
nnoremap <silent> <Space>mC :<C-u>call <SID>markdown_codeblock()<CR>


" Switch
nnoremap <silent> <Space>s :Switch<CR>

"---------------------------------------------------------------------------
" tcomment関連
" nnoremap <C-S-_> :TComment<CR>
" vnoremap <C-S-_> :TComment<CR>
" ↑いい感じのマッピング思いつかんかった！


if !exists('g:tcomment_types')
	let g:tcomment_types = {}
endif
let g:tcomment_types['uwsc'] = '// %s'


"---------------------------------------------------------------------------

" 全体整形
function! s:format_file()
	let view = winsaveview()
	normal gg=G
	silent call winrestview(view)
endfunction


" 透過度を変える
function! s:toggle_transparence()
	if has('gui_macvim')
		if &transparency ==10
			set transparency=0
		else
			set transparency=10
		endif
	else
		if &transparency ==255 
			set transparency=200
		else
			set transparency=255
		endif
	endif
endfunction


" filetype再検知
function! s:re_detect_filetype()
	filetype detect
	if &filetype == "markdown" | setlocal ft=hybrid |setlocal ft=markdown | endif
	if &filetype == "text" | setlocal ft=hybrid |setlocal ft=markdown | endif
endfunction

"---------------------------------------------------------------------------
" markdown functions
"

" リンク記法を整える
function! s:markdown_link()
	:call append(line(".")-1, "[")
	:call append(line("."), "](")
	:call append(line(".")+2, ")")
	:call cursor( line(".")-1 , col(".") )
	:join5
	:call cursor( line(".") , col(".") )
endfunction

" 数値付箇条書きを作成
function! s:markdown_codeblock()
	:call append(line(".")-1, "```")
	:call append(line("."), "```")
	:call cursor( line(".") , col(".") )
endfunction

" 数値付箇条書きを作成
function! s:put_num_list( max )
	for i in range(1, a:max)
		let msg = i . ". "
		:call append(line(".")-1, msg)
		unlet i
		unlet msg
	endfor
	:call cursor( line(".")-a:max , col(".") )
endfunction


" 箇条書きを作成
function! s:put_ast_list( max )
	for i in range(1, a:max)
		let msg = "* "
		:call append(line(".")-1, msg)
		unlet i
		unlet msg
	endfor
	:call cursor( line(".")-a:max , col(".") )
endfunction


" markdown形式のファイルを出力する
function! s:touch_markdown(outputfilepath, flagNewTab)
	if !filereadable(a:outputfilepath)
		execute ":redir! >>" . a:outputfilepath
		silent! echon "\n"
		silent! echon "====================================\n"
		silent! echon "\n"
		silent! echon "------------------------\n"
		redir END

		if a:flagNewTab
			echo "Note has created at Desktop! will open with new tab, soon..."
			execute ":tabnew " . a:outputfilepath
		else
			echo "Note has created at Desktop! will open with separated window, soon..."
			execute ":vs " . a:outputfilepath
		endif
		return 1
	endif
	return 0
endfunction

" Desktop にmemoをtouchする
function! s:touch_with_desktop(flagNewTab)
	if s:touch_markdown(expand("$HOME/Desktop/" . strftime("%Y%m%d") . '_.txt'), a:flagNewTab)
		return
	endif

	for num in range(1,9)
		if s:touch_markdown(expand("$HOME/Desktop/" . strftime("%Y%m%d") . '_0' . num . '_.txt'), a:flagNewTab)
			return
		endif
	endfor

	echo "Already exists 10 notes... Please organize your notes."
endfunction





"---------------------------------------------------------------------------
" Unite用キーマップ

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

"uniteのwindowを右に
"let g:unite_split_rule = 'rightbelow'
"

call unite#custom#source('file', 'matchers', "matcher_default")


"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" outline
nnoremap <silent> [unite]o :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>
"Color Scheme
nnoremap <silent> [unite]s :<C-u>Unite colorscheme -auto-preview<CR>
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


"---------------------------------------------------------------------------
"" neocomplete

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete_enable_at_startup = 1
" Use smartcase.
let g:neocomplete_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete_min_syntax_length = 3
let g:neocomplete_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete_dictionary_filetype_lists = {
			\ 'default' : ''
			\ }

" Plugin key-mappings.
inoremap <expr> <C-g> neocomplete#undo_completion()
inoremap <expr> <C-l> neocomplete#complete_common_string()

" <TAB>: completion.
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <C-y> neocomplete#close_popup()
inoremap <expr> <C-e> neocomplete#cancel_popup()

" あれ！急に動かなくなった！なんでだろ！
" vimrcを再読み込みすると動くけど、初回読み込みではちゃんと動かん。
" inoremap <expr> <CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
"



"---------------------------------------------------------------------------
" vim-ruby

"全部入りのbundle。シンタックスハイライトも可能になります。
au FileType ruby compiler ruby
augroup rbsyntaxcheck
	autocmd!
	autocmd BufWritePost *.rb,*.rake,Rakefile silent make -c % 
augroup END
" 別のとこでいいかも
augroup quickfixopen
	autocmd!
	autocmd QuickfixCmdPost make cw
augroup END


