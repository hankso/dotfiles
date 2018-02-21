""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My vimrc
"Hankso
"learnt a lot from:
"  1 https://github.com/ma6174/vim
"  2 https://github.com/spf13/spf13-vim
"  3 https://github.com/amix/vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"先清空自动命令列表,防止多次source .vimrc时重复添加自动命令
au!

syntax on
"colorscheme Dark       "设置颜色主题
filetype on            "侦测文件类型
filetype plugin on     "载入文件类型插件
filetype indent on     "为特定文件类型载入相关缩进文件


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"基本设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autochdir          "打开文件或切换窗口时自动切换相应的工作路径
set autoindent         "跟随上一行的缩进
set autoread           "当打开的文件在vim外被其他编辑器改动时自动载入
set autowrite          "打开新buffer自动保存之前buffer内容
set backspace=eol,indent,start "合理退格
set backup             "自动备份文件
set backupdir=~/.vim/dirs/backups "back文件所在处
"set cindent            "C语言自动缩进
set cmdheight=1        "最下方命令行高度
set completeopt=preview,menuone,noinsert "智能补全的选项,不立即插入,显示更多信息
set confirm            "处理未保存或只读文件时弹出确认
set cursorcolumn       "突出当前列
set cursorline         "突出当前行
set encoding=utf8      "编码格式
set expandtab          "使用空格代替\t(使用`:retab!`将全文'\t'替换成' ')
set fileencodings=utf8,ucs-bom,euc-cn,cp950
set fillchars=vert:\ ,stl:\ ,stlnc:\ "在被分割的窗口间显示空白，便于阅读
set formatoptions+=mB
set foldenable         "开启折叠功能
set foldlevel=1        "低于该等级的折叠自动打开
set foldmethod=manual  "手动折叠
"set guifont=Courier_New:h10:cANSI "设置字体
set guioptions-=T      "gvim隐藏工具栏
set guioptions-=m      "gvim隐藏菜单栏
set helplang=cn        "优先查询中文帮助文档
set history=100        "输入历史记录数
set hlsearch           "搜索结果高亮
set ignorecase         "搜索忽略大小写
set incsearch          "边输入边搜索"
set iskeyword+=.,_,$,@,%,#,- "带有如下符号的单词不折行
set langmenu=zh_CN.UTF-8 "语言设置
set laststatus=2       "状态行启动显示:1,总是显示:2
set linebreak          "在breakat规定的符号处折行
set matchtime=1        "匹配括号高亮的时间(单位是十分之一秒)
set mouse=a            "可以在任意处使用鼠标
set mousemodel=popup_setpos "鼠标右键位置弹出菜单
set nocompatible       "不兼容vi的特性(默认开启,如果习惯用vi就关闭)
set noerrorbells       "关闭输入错误提示音
set number             "显示行号
set report=0           "显示命令结果(如`:w`--"xx"[New]2L,11C written)
set ruler "显示光标位置和百分比,如果设置了stateline和laststatus=2,该功能无用
set scrolloff=1        "光标到边界保持1行
set selection=inclusive "默认inclusive,允许越行选取闭区间操作
set selectmode=mouse,key "使用鼠标和一些按键进入选择模式而不是可视模式
set shiftwidth=4       "保持和tabstop一致最好
set shortmess=atI      "启动的时候不显示援助乌干达儿童的提示
set showcmd            "右下角显示未输入完的命令
set showmatch          "输入括号时高亮显示一会儿
set smartindent        "智能缩进,比cindent更好用,若开启cindent该功能无效
set smarttab           "在行和段开始处使用制表符
set softtabstop=4 "按下tab后输入($sts)/($ts)个'\t'和($sts)%($ts)个空格
set tabstop=4          "将\t渲染成4个空格
set termencoding=utf-8 "terminal encoding,键值的编码
set viminfo+=!         "保存首字母大写的变量
set whichwrap+=<,>     "允许backspace和光标键跨越行边界
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif "MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif "Windows
set wildmenu           "增强输入命令自动补全功能


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动命令 au[tocmd]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au vimenter * if !argc() | NERDTree | endif
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
au BufWritePost ~/.vimrc source ~/.vimrc
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\""| endif

au BufNewFile * normal G
au BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.md execute ":call SetTitle()"
au BufRead,BufNewFile *.txt set filetype=confluencewiki
au BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && execute "redr!"
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict
au FileType javascript setlocal foldmethod=syntax
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set completeopt-=preview

func! SetTitle()
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(line("."),   "# coding=utf-8")
        call append(line(".")+1, "'''")
        call append(line(".")+2, "File: ".expand("%"))
        call append(line(".")+3, "Author: Hankso")
        call append(line(".")+4, "Web: http://github.com/hankso")
        call append(line(".")+5, "Time: ".strftime("%c"))
        call append(line(".")+6, "'''")
        call append(line(".")+7, "")
    elseif &filetype == 'ruby'
        call setline(1, "#!/usr/bin/env ruby")
        call append(line("."), "# encoding: utf-8")
        call append(line(".")+1, "")
    elseif &filetype == 'mkd'
        call setline(1, "<head><meta charset=\"UTF-8\"></head>")
    elseif &filetype == 'java'
        call setline(1, "public class ".expand("%:r"))
        call append(line("."), "")
    elseif &filetype == 'c' || &filetype == 'cpp'
        call setline(1, "/*************************************************************************")
        call append(line("."),   "File: ".expand("%"))
        call append(line(".")+1, "Author: Hankso")
        call append(line(".")+2, "Web: http://github.com/hankso")
        call append(line(".")+3, "Time: ".strftime("%c"))
        call append(line(".")+4, "************************************************************************/")
        call append(line(".")+5, "#include<stdio.h>")
        call append(line(".")+6, "")
    endif
endfunc

" 打开二进制文件比如照片,可执行文件bin等时使用16进制显示
augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r | endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

augroup Json
    au!
    au Filetype json set autoindent
    au Filetype json set formatoptions=tcq2l
    au Filetype json set textwidth=78 shiftwidth=2
    au Filetype json set foldmethod=syntax
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"快捷键
"     COMMANDS                    MODES
":map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
":nmap  :nmap :nunmap    Normal
":vmap  :vnoremap :vunmap    Visual and Select
":smap  :snoremap :sunmap    Select
":xmap  :xnoremap :xunmap    Visual
":omap  :onoremap :ounmap    Operator-pending
":map!  :noremap! :unmap!    Insert and Command-line
":imap  :inoremap :iunmap    Insert
":lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
":cmap  :cnoremap :cunmap    Command-line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
"普通|可视|选择模式
" ,ee 修改.vimrc文件
map <silent> <leader>ee :e ~/.vimrc<CR>
" ,ss 应用.vimrc文件
map <silent> <leader>ss :source ~/.vimrc<CR>
" ,w 关闭当tab
map <silent> <leader>w :tabclose<CR>
" ,t 打开新tab
map <silent> <leader>t :tabnew<CR>
" ctrl+w 切换窗口
map <C-w> <C-w>w
" Esc-Esc 保存文件
map <Esc><Esc> :w<CR>
" ctrl-a 选择全文
map <C-a> ggVG$
" md 输出为html文件,需要在~/.vim/下有markdown.pl文件
map md :!~/.vim/markdown.pl % > %.html <CR><CR>
" ,/ 调用NerdCommenter添加(取消)注释
map <leader>/ <plug>NERDCommenterToggle
" 9 jump to end of this line
map 9 $

"仅普通模式
" tab 切换到下一个标签页
nmap <Tab> :tabn<CR>
" shift-tab 切换到上一个标签页
nmap <S-Tab> :tabp<CR>
" shift-up 缩短窗口
nmap <S-Up> :resize -1<CR>
" shift-down 增高窗口
nmap <S-Down> :resize +1<CR>
" shift-left 缩窄窗口
nmap <S-Left> :vertical resize -1<CR>
" shift-right 增宽窗口
nmap <S-Right> :vertical resize +1<CR>
" ctrl-left 前一个buffer
nmap <leader><left> :bp<CR>
" ctrl-right 下一个buffer
nmap <leader><right> :bn<CR>
" 通过cscope交互式查找当前词
nmap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
" s: Find this C symbol
nmap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nmap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nmap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nmap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nmap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nmap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nmap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nmap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>



"输入模式
" ctrl-d 删除当前行
imap <C-d> <Esc>ddi
" ctrl-z 撤销
imap <C-z> <Esc>ua
" ctrl-r 恢复
imap <C-r> <Esc><C-r>a
" ctrl-c 复制
imap <C-c> <Esc>yi
" ctrl-v 粘贴
imap <C-v> <Esc>pa
" ctrl-up 将当前行上移一行
imap <C-Up> <Esc>ddkPA
" ctrl-down 将当前行下移一行
imap <C-Down> <Esc>ddpA
" ctrl-left 光标到行尾
imap <C-Left> <Esc>0i
" ctrl-right 光标到行首
imap <C-Right> <Esc>$a

"选择模式
" ctrl-c 复制
vmap <C-c> y
" tab 添加缩进,试试加上数字n吧
vmap <Tab> >
" shift-tab 删除,比如选中多行后,按3再按Shift+Tab,删除3级缩进
vmap <S-Tab> <

"去空行
map <F2> <Esc>:g/^\s*$/d<CR>
imap <F2> <Esc>:g/^\s*$/d<CR>a

map <F3> <Esc>:NERDTreeToggle<CR>
imap <F3> <Esc>:NERDTreeToggle<CR>a

"C，C++ 按F5编译运行
map <F5> <Esc>:call CompileRunGcc()<CR>
func! CompileRunGcc()
    execute "w"
    if &filetype == 'c'
        execute "!g++ % -o %<"
        execute "!time ./%<"
    elseif &filetype == 'cpp'
        execute "!g++ % -std=c++11 -o %<"
        execute "!time ./%<"
    elseif &filetype == 'java'
        execute "!javac %"
        execute "!time java %<"
    elseif &filetype == 'sh'
        execute "!time bash %"
    elseif &filetype == 'python'
        execute "!time python %"
    elseif &filetype == 'html'
        execute "!atom %"
    elseif &filetype == 'go'
        execute "!go build %<"
        execute "!time go run %"
    elseif &filetype == 'mkd'
        execute "!~/.vim/markdown.pl % > %.html &"
        execute "!firefox %.html &"
    elseif &filetype == 'json'
        execute "%!python -m json.tool"
    endif
endfunc

"代码格式优化
map <F6> <Esc>:call FormartSrc()<CR>
imap <F6> <Esc>:call FormartSrc()<CR>
func! FormartSrc()
    execute "w"
    if &filetype == 'c'
        execute "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        execute "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        execute "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        execute "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        execute "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        execute "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        execute "!astyle --style=gnu --suffix=none %"
    else
        execute "normal gg=G"
        return
    endif
    execute "e! %"
endfunc

"C,C++的调试
map <F8> <Esc>:call Rungdb()<CR>
func! Rungdb()
    execute "w"
    execute "!g++ % -std=c++11 -g -o %<"
    execute "!gdb ./%<"
endfunc

"map <F9> <Esc>:Tlist<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插件管理工具 vundle - Vim bundle
"https://github.com/VundleVim/Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off "必须的,可以完成vundle配置后再恢复

"也可以不用设置runtimepath,直接使用call vundle#begin('~/.vim/bundle/Vundle.vim')
"但是有的机子上不成,而且vundle更新后新版和旧版有些函数不同名了,最好按github上vundle项目仓库里写的步骤来,注意windows上别用'~'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"第一个管理的插件,就是它自己
Plugin 'VundleVim/Vundle.vim'

"快速易用的多文件查找替换,对vim的vimgrep等命令也进行了封装,用着简单
Plugin 'dkprice/vim-easygrep'

"颜色搭配相对好一点的一个jsonify插件
Plugin 'elzr/vim-json'

"各种配色方案,颜控必备:'I'm a slave to aesthetics. If you are too, I hope this helps.'
Plugin 'flazz/vim-colorschemes'

"""多用户同时编辑一个文件,不同用户不同色光标,社交之心呀
""Plugin 'FredKSchott/CoVim'

"与vim-markdown一起用的
Plugin 'godlygeek/tabular'

"自动补全文件
Plugin 'honza/vim-snippets'

"成对输入删除{[('"`的插件,用起来很人性化
Plugin 'jiangmiao/auto-pairs'

"""python自动补全
""Plugin 'jedi-vim'

""Plugin 'jlanzarotta/bufexplorer'

""Plugin 'jsbeautify'
""Plugin 'jslint.vim'

""Plugin 'last_edit_marker.vim'

"""statusline插件,华丽
"Plugin 'Lokaltog/vim-powerline'

"浏览标签的侧边栏,显示ctags产生的文件,跟taglist差不多,对中文支持好一点
Plugin 'majutsushi/tagbar'

"显示文件有改动增减的地方和行数,有点像git两个版本的文件比较
Plugin 'mhinz/vim-signify'

"git插件,支持git几乎所有命令,格式一般像这样:GitAdd GitPush GitLog
Plugin 'motemen/git-vim'

"js自动缩进和语法高亮
Plugin 'pangloss/vim-javascript'

"markdown高亮缩进以及一些有用的命令
Plugin 'plasticboy/vim-markdown'

"文件列表和加注释的快捷键
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

"自动补全终极方案(ultimate solution),这是engine,可以与vim-snippets合作
Plugin 'SirVer/ultisnips'

"undo列表,在一小块buffer里显示像是git log那样的undo树状图
Plugin 'sjl/gundo.vim'

"Tim Pope(pathogen作者)写的一个git提供接口的插件
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

"""快捷键显示quickfix list和location list
""Plugin 'Valloric/ListToggle'
"""自动补全引擎'ycmd'的一个for-vim的client(还有for-emacs的,for-atom的,for-nano的等等各种编辑器的client),使用前需要手动编译(不麻烦)
""Plugin 'Valloric/YouCompleteMe'

"漂亮的statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"这个插件功能可以说非常齐全了,补全缩进高亮等等等等,写python只需要它一个就够了
Plugin 'vim-scripts/Python-mode-klen'

"侧边显示代码结构树(类,函数,变量等)的插件,需要ctags,推荐使用上边的tagbar
Plugin 'vim-scripts/taglist.vim'

"基于vim的嵌入式中文输入法,不需要中英输入切换,似乎很方便,不过好像很久没有维护了?
Plugin 'vim-scripts/VimIM'

"QQ微信
Plugin 'wsdjeg/vim-chat'

"在vim内通过快捷键调用cscope
Plugin 'cscope.vim'

"使用特殊的符号显示缩进,比如'┆'
Plugin 'Yggdroot/indentLine'

call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置插件的一些功能
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Auto_Open = 0
"let Tlist_Ctags_Cmd = 'ctags'      "如果ctags不在PATH中需要用全路径
"let Tlist_Compart_Format = 1       "压缩方式
"let Tlist_Enable_Fold_Column = 0   "不要显示折叠树
"let Tlist_Exit_OnlyWindow = 1      "taglist为最后一窗口时退出vim
"let Tlist_Use_Right_Window = 1     "右侧窗口显示
"let Tlist_Show_One_File = 1        "只显示当前文件的tag
"let Tlist_Sort_Type = "name"       "按照名称排序
""let Tlist_WinHeight = 100          "设置窗口高度
"let Tlist_WinWidth = 30            "设置窗口宽度
let g:tagbar_ctags_bin = 'ctags'   "ctags程序的路径
let g:tagbar_width = 30            "窗口宽度的设置

let NERDTreeWinSize = 26
"let g:NERDTreeStatusline = 
let NERDTreeWinPos = "left"

let g:NERDSpaceDelims = 1          "注释符号后加空格
let g:NERDCompactSexyComs = 1      "多行注释时结构更加紧凑
let g:NERDDefaultAlign = 'left'    "多行注释在同一列添加注释符号
"let g:NERDCustomDelimiters = {'c':{'left':'/**','right': '*/'}} "可以自己定义注释符号
let g:NERDCommentEmptyLines = 1    "允许注释空行,默认否
let g:NERDTrimTrailingWhitespace = 1 "取消注释时删除不必要的空格
let g:vim_json_syntax_conceal = 0  
let g:UltiSnipsExpandTrigger = "<tab>"
let g:indentLine_char = '┊'
" let g:indentLine_char = '|'

let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "2"
let g:jedi#completions_enabled = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:javascript_plugin_jsdoc = 1

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '[%s]'
let g:airline#extensions#tabline#buffers_label = '[b]'
let g:airline#extensions#tabline#tabs_label = '[t]'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline_section_z = '%3p%%%#__accent_bold#%4l,%3v %{g:airline_symbols.maxlinenr}%:%L%#__restore__#'
let g:airline_section_warning = ''
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
let g:airline_left_alt_sep = '>'
" let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_right_alt_sep = '<'
" let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.readonly = '🔒'
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.maxlinenr = ' ␤'
" let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"不使用插件配置一个比较好看的statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"配色方案
highlight mygroup1 cterm=none ctermfg=232 ctermbg=179
highlight mygroup2 cterm=bold ctermfg=214 ctermbg=242
highlight mygroup3 cterm=none ctermfg=251 ctermbg=240
highlight mygroup4 cterm=none ctermfg=169 ctermbg=239
highlight mygroup5 cterm=none ctermfg=208 ctermbg=238
highlight mygroup6 cterm=none ctermfg=246 ctermbg=237
highlight mygroup7 cterm=none ctermfg=249 ctermbg=238
highlight mygroup8 cterm=none ctermfg=250 ctermbg=239

"set statusline =%#mygroup1#[%n]%*             "bufferNumber
"set statusline+=%#mygroup2#%F%*               "Fullpath
"set statusline+=%#mygroup3#%m%r%*             "Modified|Read-only
"set statusline+=%#mygroup4#%y%*               "filetYpe
"set statusline+=%#mygroup5#\ %{Fsize(@%)}\ %* "file size
"set statusline+=%#mygroup6#%=%*               "left-right-seperator
"set statusline+=%#mygroup7#\ %(%l,%v%)%*      "left-aligned-7-len(line,column)
"set statusline+=%#mygroup7#\ %p%%\ %*         "percentage
"set statusline+=%#mygroup8#%{strftime(\"%y/%m/%d-%H:%M\")}%* "year-month-day-hour-minute

"借鉴网上一个函数
function! Fsize(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'k'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'm'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
    endif
endfunction
