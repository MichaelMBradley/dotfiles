set number
tnoremap <Esc> <C-\><C-n>

call plug#begin()
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'navarasu/onedark.nvim'
Plug 'gpanders/editorconfig.nvim'
call plug#end()

nnoremap <C-v> <cmd>CHADopen<cr>
"let g:coq_settings = { 'auto_start': 'shut-up' }
let g:onedark_config = { 'style': 'warmer', 'transparent': v:true }
colorscheme onedark
