local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- call vscode commands from neovim

-- general keymaps
keymap({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ "n", "v" }, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ "n", "v" }, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ "n", "v" }, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

-- harpoon keymaps
keymap({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({ "n", "v" }, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({ "n", "v" }, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({ "n", "v" }, "<leader>1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({ "n", "v" }, "<leader>2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({ "n", "v" }, "<leader>3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({ "n", "v" }, "<leader>4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({ "n", "v" }, "<leader>5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({ "n", "v" }, "<leader>6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({ "n", "v" }, "<leader>7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({ "n", "v" }, "<leader>8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({ "n", "v" }, "<leader>9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
keymap({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({ "n", "v" }, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")

-- folding keymaps
-- keymap("n", "j", "gj", { noremap = false, silent = true })
-- keymap("n", "k", "gk", { noremap = false, silent = true })

local vscode = require("vscode")

-- keymap("n", "j", function()
--   if vim.v.count == 0 then
--     vscode.call("cursorDown")
--   else
--     return "j"
--   end
-- end, { expr = true })
--
-- keymap("n", "k", function()
--   if vim.v.count == 0 then
--     vscode.call("cursorUp")
--   else
--     return "k"
--   end
-- end, { expr = true })
--
local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, function()
    vscode.call(rhs)
  end, { silent = true, noremap = true })
end

-- Remap folding keys
map("n", "zM", "editor.foldAll")
map("n", "zR", "editor.unfoldAll")
map("n", "zc", "editor.fold")
map("n", "zC", "editor.foldRecursively")
map("n", "zo", "editor.unfold")
map("n", "zO", "editor.unfoldRecursively")
map("n", "za", "editor.toggleFold")

-- code navigation
-- nvim 0.11 ships default LSP maps under the `gr` prefix (grr/grn/gra/gri).
-- No neovim LSP attaches in vscode mode, and they'd make a bare `gr` wait for
-- timeoutlen, so drop them and hand the prefix to vscode's navigation.
for _, lhs in ipairs({ "grr", "grn", "gra", "gri", "grt" }) do
  pcall(vim.keymap.del, "n", lhs)
end

keymap("n", "gr", function()
  vscode.action("editor.action.goToReferences")
end, opts)

keymap("n", "gR", function()
  vscode.action("references-view.findReferences")
end, opts)

keymap("n", "gI", function()
  vscode.action("editor.action.goToImplementation")
end, opts)

keymap("n", "gy", function()
  vscode.action("editor.action.goToTypeDefinition")
end, opts)

-- note: not <leader>rn -- config/keymaps.lua loads on VeryLazy (after this file)
-- and binds that to :set rnu!, which would clobber anything set here.
keymap("n", "<leader>cr", function()
  vscode.action("editor.action.rename")
end, opts)
