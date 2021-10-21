-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader key to space.
vim.g.mapleader = ' '


-- Set cl for clearing highlights after searching word in file.
map('n', 'cl', '<cmd>noh<CR>')


-- Split navigations.
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-h>', '<C-w><C-h>')


-- Buffer resizing.
map('n', '<S-h>', '<cmd>:call ResizeLeft(3)<CR>')
map('n', '<S-l>', '<cmd>:call ResizeRight(3)<CR>')
map('n', '<S-k>', '<cmd>:call ResizeUp(1)<CR>')
map('n', '<S-j>', '<cmd>:call ResizeDown(1)<CR>')


-- Buffer switching.
map('n', '<A-l>', '<cmd>:BufferLineCycleNext<CR>')
map('n', '<A-h>', '<cmd>:BufferLineCyclePrev<CR>')

-- Buffer closing.
map('n', '<leader>bc', '<cmd>:BufferLinePickClose<CR>')

-- Buffer moving.
map('n', '<leader>bl', '<cmd>:BufferLineMoveNext<CR>')
map('n', '<leader>bh', '<cmd>:BufferLineMovePrev<CR>')


-- NvimTree toggle
map('n', 'nt', '<cmd>NvimTreeToggle<CR>')


-- Telescop.
map("n", "<Leader>fw", ":Telescope live_grep<CR>")
map("n", "<Leader>gt", ":Telescope git_status<CR>")
map("n", "<Leader>cm", ":Telescope git_commits<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fp", ":lua require('telescope').extensions.media_files.media_files()<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fo", ":Telescope oldfiles<CR>")
map("n", "<Leader>th", ":Telescope themes<CR>")


-- Dashboard
map("n", "<Leader>db", ":Dashboard<CR>")
map("n", "<Leader>fn", ":DashboardNewFile<CR>")
map("n", "<Leader>bm", ":DashboardJumpMarks<CR>")
map("n", "<C-s>l", ":SessionLoad<CR>")
map("n", "<C-s>s", ":SessionSave<CR>")


-- Lsp
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')


-- ToggleTerm
vim.cmd
[[
  let g:toggleterm_terminal_mapping = '<C-t>'
  nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
  inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]]
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<a-h>', [[<c-\><c-n><c-w>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<a-j>', [[<c-\><c-n><c-w>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<a-k>', [[<c-\><c-n><c-w>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<a-l>', [[<c-\><c-n><c-w>l]], opts)

  vim.api.nvim_buf_set_keymap(0, 't', '<S-h>', [[<c-\><C-n>:call ResizeLeft(3)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<S-j>', [[<c-\><C-n>:call ResizeDown(1)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<S-k>', [[<c-\><C-n>:call ResizeUp(1)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<S-l>', [[<c-\><C-n>:call ResizeRight(3)<CR>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Remove unnecessary white spaces.
map('n', '<leader>cw', '<cmd>:let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>')


-- TrueZen focus mode.
map('n', '<leader>fs', '<cmd>:TZFocus<CR>')


-- Toggle fold.
map('n', '<leader>ft', 'za')


-- comment
map("n", "ct", ":CommentToggle<CR>")
map("v", "ct", ":'<,'>CommentToggle<CR>")
