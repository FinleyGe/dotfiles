let mapleader=","
vmap <C-y> "+y

set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

set t_ut= " 防止vim背景颜色错误
set showmatch " 高亮匹配括号
set matchtime=1
set report=0
set ignorecase
set noeb
set softtabstop=2
set shiftwidth=2
set nobackup
set autoread
set nocompatible
set nu "设置显示行号
set backspace=2 "能使用backspace回删
syntax on "语法检测
set ruler "显示最后一行的状态
set laststatus=2 "两行状态行+一行命令行
set ts=4
set expandtab
set autoindent "设置c语言自动对齐
set t_Co=256 "指定配色方案为256
set mouse=a "设置可以在VIM使用鼠标
set selection=exclusive
set tabstop=2 "设置TAB宽度
set history=1000 "设置历史记录条数   
set shortmess=atl 
set cmdheight=3
if version >= 603
     set helplang=cn
     set encoding=utf-8
endif
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
