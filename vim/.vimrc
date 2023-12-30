set hlsearch
set number
set noswapfile
set ic
set expandtab		" 使用空格代替制表符
set tabstop=4		" 制表符宽度设为 4 个空格宽
set shiftwidth=4	" 缩进宽度设为 4 个空格宽
set softtabstop=4	" 在插入模式下，按退格键时可以删除 4 个空格


syntax on
set background=dark
colorscheme vorange

call plug#begin('~/.vim/plugged')

" NERDTree - 文件系统浏览器
Plug 'preservim/nerdtree'

" vim-fugitive - Git 集成工具
Plug 'tpope/vim-fugitive'

" CtrlP - 全功能文件、缓冲区、MRU、标签等搜索
Plug 'ctrlpvim/ctrlp.vim'

" vim-airline - 状态栏和 tab 栏
Plug 'vim-airline/vim-airline'
" 安装 airline 主题
Plug 'vim-airline/vim-airline-themes'

" LSP
Plug 'prabirshrestha/vim-lsp'			" LSP 客户端
Plug 'mattn/vim-lsp-settings'			" 自动配置 Vim LSP 客户端
Plug 'prabirshrestha/asyncomplete.vim'		" Vim 的自动补全框架
Plug 'prabirshrestha/asyncomplete-lsp.vim'	" asyncomplete.vim 的扩展
Plug 'piec/vim-lsp-clangd'			" 用于支持 clangd 语言服务器

call plug#end()

" LSP
if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cc', 'cpp', 'h', 'hh', 'hpp'],
        \ })
endif

" 绑定 LSP 功能到快捷键
nnoremap <silent> gd :LspDefinition<CR>			" 跳转到定义
nnoremap <silent> gr :LspReferences<CR>			" 显示所有引用
nnoremap <silent> gi :LspImplementation<CR>		" 跳转到实现
nnoremap <silent> K :LspHover<CR>			" 显示悬浮信息（如类型信息、文档）
nnoremap <silent> <F2> :LspRename<CR>			" 重命名 
nnoremap <silent> <F8> :LspDiagnostics<CR>		" 显示代码诊断信息
nnoremap <silent> [d :LspNextDiagnostic<CR>		" 跳转到下一个诊断
nnoremap <silent> ]d :LspPreviousDiagnostic<CR>		" 跳转到上一个诊断
nnoremap <silent> <leader>f :LspDocumentFormat<CR>	" 代码格式化

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40
