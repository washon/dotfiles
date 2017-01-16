" gvimrcのカスタム
"

"---------------------------------------------------------------------------
" カラー設定:
"colorscheme evening
colorscheme molokai

"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
    " Windows用
    set guifont=Ricty:h9:cSHIFTJIS
    " set guifont=MS_Gothic:h9:cSHIFTJIS
    " 行間隔の設定

    set linespace=1

    " 一部のUCS文字の幅を自動計測して決める
    if has('kaoriya')
      set ambiwidth=auto
    endif

	
	set columns=240
	set lines=80
elseif has('gui_macvim')
	set guifont=Menlo\ Regular:h10
	set guifontwide=Menlo\ Regular:h10

	set isfname+=32
	set lines=70
	set columns=192

elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a10,r10,k10
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"

" メニューバーの非表示
set guioptions-=m
" ツールバーの非表示
set guioptions-=T


" ビープ音も画面フラッシュも消す
autocmd GUIEnter * set vb t_vb=
" 読み込み完了後に実行しないと有効にならないので注意！

gui

" スケスケ
set transparency=10


