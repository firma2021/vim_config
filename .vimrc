"如果重定义了下面的函数，则会发出警告并覆盖该函数
" function MyFunction()
"   " 函数体
" endfunction
"如果重定义了下面的函数，只会覆盖该函数而不发出警告
" function! MyFunction()
"   " 函数体
" endfunction
" 编译并执行 C++ 文件

 " 停止正在运行的 Job
" function! StopCompileAndRunCppJob()
"   if exists('g:CompileAndRunCppJobId')
"     call jobstop(g:CompileAndRunCppJobId)
"     unlet g:CompileAndRunCppJobId
"   endif
" endfunction

" function! CompileAndRunCpp()
"   " 定义两个局部变量，保存当前文件绝对路径和不带扩展的文件名。l:前缀表示局部变量。
"   let l:filename = expand('%:r')
"   let l:filepath = expand('%:p')
 
"   let l:compile_cmd = 'g++ -std=c++20 -Wall -Wextra -Werror ' . l:filepath . ' -o ' . l:filename
"   let l:run_cmd = '.' . '/' . l:filename
   
"   echo l:compile_cmd
"   echo l:run_cmd

"   " channel表示通道类型, a:用于访问函数参数
"   function! PrintJobStdout(channel, data)
"     echo "stdout:\n"
"     echomsg a:data
"   endfunction

"   function! PrintJobStderr(channel, data)
"     echo "stderr:\n"
"     echomsg a:data
"   endfunction
"   let l:c =  l:compile_cmd . ' && ' . l:run_cmd
"   echo l:c
"   let l:job = job_start('echo "Hello World!" && ls -l', {'out_cb': 'PrintJobStdout','err_cb': 'PrintJobStderr'})
      
"    " 存储 Job 对象的 ID
"   "let g:CompileAndRunCppJobId = l:job.id
" endfunction

" call CompileAndRunCpp()



" "rc" 通常表示 "run commands"，是一种配置文件的命名约定。
"在vim中通过:help option-list命令查看所有可配置的选项

"=======================编码=================================
set encoding=utf-8 "vim内部使用的字符编码
set fileencodings=utf-8,gbk,utf-16 "打开文件时, 尝试用列表中指定的编码格式解析文件
set fileencoding=utf-8 "文件保存时的字符编码
set termencoding=utf-8 "终端的编码

"=======================鼠标设置=================================
"启用鼠标
set mouse=a

"点击鼠标右键后，弹出菜单，光标移动到点击处(setpos)
set mousemodel=popup_setpos 

"定义可视模式下的弹出菜单
" "+表示系统剪贴板, vim不一定支持使用该剪贴板,故未使用
" "_表示黑洞寄存器
"PopUp.复制(到系统粘贴板)是菜单选项文本,  y是执行的命令
vnoremenu PopUp.复制(到vim默认剪贴板) y 
vnoremenu PopUp.粘贴(从vim默认剪贴板) p
vnoremenu PopUp.剪切(到vim默认剪贴板) d 
vnoremenu PopUp.删除(到黑洞寄存器) "_d 

"定义普通模式下的弹出菜单
":!执行外部命令，将结果输出到vim命令行中；:r! 将外部命令的输出插入到文本中
nnoremenu PopUp.全选 ggVG
nnoremenu PopUp.插入当前文件名 :r! echo %<cr>
nnoremenu PopUp.插入当前文件绝对路径 :r! echo %:p<cr>
nnoremenu PopUp.============== :<cr> 
nnoremenu PopUp.粘贴到光标后 p
nnoremenu PopUp.粘贴到光标前 P
nnoremenu PopUp.粘贴到下一行 o<ESC>p
nnoremenu PopUp.后退到上一个标记行 <c-o>zz
nnoremenu PopUp.前进到下一个标记行 <c-i>zz
nnoremenu PopUp.折叠代码块 zC
nnoremenu PopUp.展开代码块  zO
nnoremenu PopUp.~~~~~~~~~~~~~~~ :<cr> 
"b是buffer的缩写
nnoremenu PopUp.列出所有缓冲区 :ls<cr>
nnoremenu PopUp.跳转到上一个缓冲区 :bpre<cr>
nnoremenu PopUp.跳转到下一个缓冲区 :bnext<cr>
nnoremenu PopUp.跳转到第一个缓冲区 :bfirst<cr>
nnoremenu PopUp.跳转到末一个缓冲区 :blast<cr>
nnoremenu PopUp.+++++++++++++++ :<cr> 

nnoremenu PopUp.水平分割窗口 <c-w>s
nnoremenu PopUp.垂直分割窗口 <c-w>v
nnoremenu PopUp.循环切换窗口 <c-w>w

nnoremenu PopUp.--------------- :<cr> 


nnoremenu PopUp.禁用鼠标 :set mouse=""<cr>


"=======================基本设置=================================
set nocompatible "关闭与Vi兼容的模式,可以使用更多的 Vim 命令和功能，以及更多的插件和脚本 
syntax on "在vim启动时自动启用语法高亮
filetype on "根据后缀名或内容识别文件类型，自动加载相应的语法高亮、自动缩进等
filetype plugin on "自动加载与文件类型相关的插件，如代码补全、调试
set nu "显示行号
set relativenumber "显示相对行号
set cursorline " 高亮当前行
set background=light "设置高亮行的背景色, 可设置为light或dark
set ruler "总在底部状态栏显示光标位置
set hidden "允许在不保存当前文件的情况下切换到其他文件
set showcmd "在底部状态栏显示正在执行的命令，如选中几行后，显示选中的行数
set cmdheight=1 "底部状态栏最多可以显示1行
set matchpairs+=<:> "将<和>作为一对匹配的括号字符, 高亮显示之
set virtualedit=block,onemore "可以将光标移动到行末的下一个位置
set whichwrap+=h,l "当光标在文本行的开头或结尾时，按下这些键可以换行。

"set showmatch 输入右括号后，光标跳到左括号，持续0.5秒 
"set matchtime=5

"set ttimeoutlen=0 "设置终端响应时间为无限制, 避免使用某些插件或执行某些命令时，终端响应时间不足


set autoread "文件被外部程序修改后, 自动重新读取文件
set autowrite "切换缓冲区或退出Vim时, 自动保存当前文件
set confirm "在用户执行一些可能会导致数据丢失或不可逆操作时，提示用户进行确认
"set nobackup " 备份文件通常以~结尾，包含了文件的上一次保存状态
"set noswapfile "交换文件通常以.swp结尾, 在编辑器正常关闭时自动删除, 在Vim崩溃或编辑器意外关闭时恢复文件

" 设置缩进
set tabstop=8 "\t宽度为8
set expandtab "在插入模式下，用多个空格代替Tab；按下ctrl v后，再按Tab，才会输入\t符
set softtabstop=4 "插入模式下按Tab键添加缩进，缩进宽度为4
set shiftwidth=4 "普通模式和可视模式下，缩进宽度为4.(普通模式下用>> << ==  添加、删除、对齐缩进，可视模式下用> < = 处理缩进)
set autoindent "换行时，复制上一行的缩进
set smartindent "编写代码时智能缩进
"set cindent “启用c语言风格的缩进,比smartindent更严格
set smarttab " 根据已有的缩进来确定新行的缩进
retab " 将文件中的\t替换为空格

set hlsearch "普通模式下, 使用/或?命令, 向前或向后搜索文本时，高亮显示匹配的文本
set incsearch "启用增量搜索: 输入每个字符后都更新搜索结果
set smartcase "如果搜索模式包含至少一个大写字母, 则区分大小写, 否则不区分

runtime macros/matchit.vim 



"=======================快捷键设置=================================
" imap: 插入模式下的普通模式映射
" inoremap: insert mode recursive mapping, 递归映射, 用来执行多条命令

"设置leader键
let mapleader = "\<space>"

"在插入模式或选择模式下, 使用 Ctrl+q 快捷键删除当前行
"(按下Ctrl+o键可以暂时退出插入模式并进入普通模式, 执行一个命令后返回插入模式)
inoremap <c-q> <c-o>dd 
snoremap <c-q> <c-o>dd 

"在插入模式下移动光标
imap <c-j> <down>
imap <c-k> <up>
imap <c-h> <left>
imap <c-l> <right>

"在插入模式和命令模式下, 输出左括号后自动输入右括号
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
cnoremap ( ()<left>
cnoremap [ []<left>
cnoremap { {}<left>


"复制文本到系统剪贴板 / 将系统剪贴板中的文本粘贴到当前光标位置
nnoremap <leader><leader>y "+y
nnoremap <leader><leader>p "+p
nnoremap <leader><leader>P "+P
vnoremap <leader><leader>y "+y
vnoremap <leader><leader>p "+p
vnoremap <leader><leader>P "+P

"设置配色方案，并设置背景透明
"在命令模式下, 输入:colorscheme 空格 ctrl-d 来查看所有可用的配色方案
"好看的浅色方案delek zelloer
"好看的深色方案sorbet habamax slate
colorscheme  morning 
hi Normal guibg=NONE ctermbg=NONE "设置正常文本背景透明
hi EndOfBuffer guibg=NONE ctermbg=NONE "假设文本有3行，而屏幕能显示10行，设置剩余7行的背景透明

"开启真彩色
set termguicolors

"开启英文的拼写检查
set spell spelllang=en_us



" 按下leader,后显示不可见字符
nnoremap <leader>l :set list

" 粘贴模式的开关快捷键
map <M-p> :set paste<CR>
map <M-S-p> :set nopaste<CR>


set nowrap "文本超出屏幕宽度时不换行
set textwidth=0 "文本超出80个字符时不换行
set sidescroll=1 "设置侧向滚动的列数为1, 水平滚动屏幕以查看长行时，更加平滑



" undo文件和backup文件的保存位置
set undodir=~/.vim/undofile
set backupdir=~/.vim/backupfile

" 光标设置
let &t_SI.="\e[5 q" "将插入模式下的终端光标样式设置为竖线闪烁
let &t_SR.="\e[3 q" "将替换模式下的终端光标样式设置为下划线
let &t_EI.="\e[1 q" "将离开插入或替换模式后的终端光标样式设置为竖线


" 在命令模式中输出命令时，按Tab键自动补全命令和参数
set wildmenu

" insert模式下的移动
imap <C-l> <Right>

" leader
let mapleader = "\<space>"



" 在插入模式下移动光标
imap <c-j> <down>
imap <c-k> <up>
imap <c-l> <right>
imap <c-h> <left>

" 打开文件时自动跳转到上一次编辑的位置并居中
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \   execute "normal! zz" |
    \ endif

"编译并运行c++代码
"检查当前文件的扩展名是否为 c、cc、cxx 或 cpp
"执行外部命令， %表示当前文件的完整路径， %<表示当前文件不包含扩展名的文件名
"重绘屏幕
"设置输出颜色为警告色，用管道连接到后面的echo语句
func! Run()
        if expand("%:e") == "c" || expand("%:e") == "cc" || expand("%:e") == "cxx" || expand("%:e") == "cpp"
        echo "编译文件"
        :! g++ "%" -o "%<" -Wall -Wextra -std=c++20 && "./%<"
        redraw!
        echohl WarningMsg | echo "运行结束!"
        endif
endfunction

map  <F5>  :w<CR>:call CompileAndRunCpp()<CR>
imap <F5>  <ESC>:w<CR>:call CompileAndRunCpp()<CR>

autocmd FileType c nnoremap <buffer> <F6> :w <RETURN> :!gcc % -o wef -g && ./wef <RETURN>
autocmd FileType cpp nnoremap <buffer> <F6> :w <RETURN> :!g++ % -o wef -g && ./wef <RETURN>

"在粘贴模式下，Vim 会暂时关闭自动缩进、自动换行等功能，以便你可以粘贴文本而不会出现格式混乱的问题
set pastetoggle=<F2>
"设置折叠方式
set foldmethod=indent
"在插入模式和普通模式下，输入<leader>w 保存当前编辑的文件
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>


" ---------neoclide/coc.nvim--------
set pumheight=10
set updatetime=100
set signcolumn=no
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
autocmd CursorHold * silent call CocActionAsync('highlight')



  

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline




" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"#后面指定插件的安装路径
call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
"使用非默认的分支
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
call plug#end()

nnoremap <LEADER>e :NERDTreeToggle<CR>
" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd vimenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q |endif









set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

"进入插入模式时，取消当前行高亮
augroup insert_curline
  autocmd InsertEnter,InsertLeave * set cul!
augroup end







  " function! RunCpp()
  "   let filename = expand('%')
  "   let cmd = 'g++ -o ' . filename . '.out ' . filename . ' && clear && ./' . filename . '.out'
  "   silent exec 'belowright terminal ++rows=10 ++cols=80 bash -c "' . cmd . '; read -n 1 -s -r -p \"\nPress any key to continue...\"; exit"'
  " endfunction
  " nmap <leader>r :call RunCpp()<CR>


" 打开 termdebug 窗口并启用鼠标支持
function! OpenTermdebug()
    set mouse=a
    packadd termdebug
    Termdebug
endfunction  

nnoremap <leader><leader>d :call OpenTermdebug()<cr>
nnoremap <F5> :call OpenTermdebug()<cr>
let g:termdebug_wide=1
nnoremap <F6> :Break<cr>
nnoremap <F7> :Over<cr>
nnoremap <F8> :Step<cr>


func! Tapi_EditFile(bufnum,arglist)
	execute ":wincmd p"
	if isdirectory(a:arglist[0])
		execute ":cd " . a:arglist[0]|echo "cd ".a:arglist[0]." success"
	else
		execute ":edit " . a:arglist[0]|echo "open ".a:arglist[0]." success"
	endif
	if len(a:arglist)>1|call term_sendkeys(a:bufnum,a:arglist[1]."\<cr>")|endif
	if len(gettabinfo())>1|tabclose|if filereadable(a:arglist[0])|execute ":edit " . a:arglist[0]|endif|endif
endfunc


"在下面打开终端 (默认在上方打开终端)
nnoremap <leader><leader>T :botright term ++rows=8<CR>
"在右侧打开终端
nnoremap <leader><leader>t :rightbelow vert term<CR>

nnoremap <leader><leader>s :source $MYVIMRC<cr>

function! CompileCPlusPlus()
  " 打开终端窗口
  bo term

  " 执行编译命令
  call term_sendkeys("g++ -o myprogram myfile.cpp\<CR>")

  " 等待编译完成
  while !term_getline(1)[-2] =~ 'finished'
    sleep 100m
  endwhile

  " 运行可执行文件
  call term_sendkeys("./myprogram\<CR>")
endfunction

" 映射快捷键
nnoremap <leader>cc :call CompileCPlusPlus()<CR>

"bufnr('$')获取现有缓冲区中最大的缓冲区编号，具有较小编号的缓冲区并不一定存在，可能已被删除
"v:表示vim内部变量，v:val表示当前迭代的缓冲区编号。
let g:open_buf_count = 0
function GetOpenBufCount()
  let g:open_buf_count =  len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

call GetOpenBufCount()

let g:file_size = 0
function GetFileSize(fname)

  "expand返回绝对路径 
  let l:size = getfsize(expand(a:fname))

  "如果fname是目录，返回0；不存在，返回-1；文件过大，返回-2
  if l:size == 0 || l:size == -1 || l:size == -2
    let g:file_size = 0
    return
  endif

  if l:size < 1024
    let g:file_size = l:size.'b'
  elseif l:size < 1024*1024
    let g:file_size =  printf('%.2f', l:size/1024.0).'kib'
  elseif l:size < 1024*1024*1024
    let g:file_size = printf('%.2f', l:size/1024.0/1024.0) . 'mib'
  else
    let g:file_size = printf('%.3f', l:size/1024.0/1024.0/1024.0) . 'gib'
  endif

endfunction

call GetFileSize(@%)
call GetOpenBufCount()


let g:vim_mode= ""
function HighlightModeColor()
  "获取当前的模式
	let m = mode()
  "replace模式
	if m == 'R'
		let s:color='#FFC0CB'
		let g:vim_mode= 'Replace'
  "Visual模式
	elseif m == 'v'
		let s:color='#F7768E'
		let g:vim_mode= 'Visual'
  "Insert模式
	elseif m == 'i'
		let s:color='#7AA2F7'
		let g:vim_mode= 'Insert'
  "Terminal模式
	elseif m == 't'
		let s:color='#00008B'
		let g:vim_mode= 'Terminal'
  "Normal模式
	else
		let s:color='#9ECE6A'
		let g:vim_mode= 'Normal'
	endif
  "设置高亮组的前景色和背景色
	exec 'highlight User1 font=#000000 guifg=#1a1b26 guibg=' . s:color
  "重绘vim屏幕，可能导致屏幕闪烁
endfunction
call HighlightModeColor()

let g:git_branch_name = ""

function GetGitBranchName()
  "rev-parse命令用于解析Git对象的标识符，--abbrev-ref选项用于缩写分支名称，HEAD参数用于指定当前分支, 执行该命令后，将输出当前分支的名称
  "git branch --show-current是新版git命令
  if g:git_branch_name == ""
    let branch = system('git branch --show-current')
    if v:shell_error != 0
      let g:git_branch_name = "unknown"
    else
      let g:git_branch_name = substitute(branch, '\n', '', '')
    endif
  endif

  return g:git_branch_name
endfunction

call GetGitBranchName()


"最后一个窗口是否有状态栏？ 0：总没有 1：有两个及以上窗口时才有 2：总有 
set laststatus=2 


"%<表示如果状态行过长，在开头换行; \表示转义字符
set statusline=%<
"显示模式. %1* ... %*中的内容，用User1颜色组来高亮
set statusline=%1*\ %{g:vim_mode}
"显示当前缓冲区号-打开的缓冲区数
set statusline+=%1*\ [buf\ %n-%{g:open_buf_count}]
 
"显示当前文件名(绝对路径)，文件大小，@%表示当前文件名(不带路径前缀)
"git分支名、文件修改标记、只读标记、帮助标记、是否为预览窗口、文件类型， %=表示左对齐和右对齐的分界线
set statusline+=%1*\ %y\ %F\ %{g:file_size}\ %{g:git_branch_name}\ %m%r%h%w%=

"显示文件格式(dos->\r\n，unix->\n，mac->\r);编码;如果当前文件以BOM开头，输出,B
"&fenc和&enc别表示当前文件的文件编码和当前终端的编码
set statusline+=%=%1*\ [%{&ff}\|%{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}]
"显示当前行号-总行号 列号 当前行占文件的百分比
set statusline+=%1*[%l-%L\ %v\ %p%%]

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=orange guifg=white
hi statusline guibg=black