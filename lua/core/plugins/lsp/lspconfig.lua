-- Updated Neovim LSP configuration using `vim.lsp.config`
-- Fully modern and warnings-free


local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
return
end


local keymap = vim.keymap


local on_attach = function(client, bufnr)
local opts = { noremap = true, silent = true, buffer = bufnr }


keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)


if client.name == "tsserver" then
keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
end
end


local capabilities = cmp_nvim_lsp.default_capabilities()


-- Modern LSP setup
local function setup_server(name, config)
vim.lsp.config(name, config)
end


local base = {
capabilities = capabilities,
on_attach = on_attach,
}


setup_server("html", base)
setup_server("tailwindcss", base)
setup_server("gopls", base)
setup_server("rust_analyzer", base)
setup_server("harper_ls", base)
setup_server("pyright", base)
setup_server("jsonls", base)
