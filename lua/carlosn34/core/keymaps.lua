-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", {
    desc = "Exit insert mode with jk"
})

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", {
    desc = "Clear search highlights"
})

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", {
    desc = "Increment number"
}) -- increment
keymap.set("n", "<leader>-", "<C-x>", {
    desc = "Decrement number"
}) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", {
    desc = "Split window vertically"
}) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", {
    desc = "Split window horizontally"
}) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", {
    desc = "Make splits equal size"
}) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", {
    desc = "Close current split"
}) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {
    desc = "Open new tab"
}) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {
    desc = "Close current tab"
}) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {
    desc = "Go to next tab"
}) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {
    desc = "Go to previous tab"
}) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {
    desc = "Open current buffer in new tab"
}) --  move current buffer to new tab

keymap.set("n", "<leader>.", "<cmd>tabn<CR>", {
    desc = "Go to next tab"
}) --  go to next tab
keymap.set("n", "<leader>,", "<cmd>tabp<CR>", {
    desc = "Go to previous tab"
}) --  go to previous tab
-- Keymaps for better default experience
-- See `:help keymap.set()`
keymap.set({'n', 'v'}, '<Space>', '<Nop>', {
    silent = true
})



-- LazyGit
keymap.set("n", "<leader>gg", ":LazyGit<CR>", {
    silent = true
})

-- Remap for dealing with word wrap
-- keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {
--     expr = true,
--     silent = true
-- })
-- keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {
--     expr = true,
--     silent = true
-- })

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, {
    desc = 'Go to previous diagnostic message'
})
keymap.set('n', ']d', vim.diagnostic.goto_next, {
    desc = 'Go to next diagnostic message'
})
keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
    desc = 'Open floating diagnostic message'
})
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
    desc = 'Open diagnostics list'
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {
    clear = true
})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*'
})

-- Formatting
keymap.set("n", "<leader>ll", ":Format<CR>")
keymap.set("n", "<leader>lp", ":FormatWrite<CR>")

-- Typescript specifics
keymap.set("n", "<leader>mi", ":TSToolsAddMissingImports<CR>")
keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>")
keymap.set("n", "<leader>si", ":TSToolsSortImports<CR>")
keymap.set("n", "<leader>gd", ":TSToolsGoToSourceDefinition<CR>")
keymap.set("n", "<leader>ru", ":TSToolsRemoveUnused<CR>")
keymap.set("n", "<leader>ri", ":TSToolsRemoveUnusedImports<CR>")
keymap.set("n", "<leader>rf", ":TSToolsRenameFile<CR>")

-- Tailwind
keymap.set("n", "<leader>tls", ":TailwindSort<CR>")
keymap.set("n", "<leader>tlst", ":TailwindSortOnSaveToggle<CR>")


keymap.set("n", "C-s>", ":w<CR>")

vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true

keymap.set('i', '<C-l>', 'copilot#Accept()', {
    expr = true,
    silent = true,
    noremap = true,
})
keymap.set('i', '<C-j>', 'copilot#Previous()', {
    expr = true,
    silent = true
})
keymap.set('i', '<C-k>', 'copilot#Next()', {
    expr = true,
    silent = true
})
