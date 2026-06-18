-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Enter insert mode on BufEnter when running inside VSCode
if vim.g.vscode then
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      vim.cmd("startinsert")
    end,
  })
end

-- Disable diagnostics for .env files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env*",
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

-- Auto-save on buffer change
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--   group = vim.api.nvim_create_augroup("autosave", { clear = true }),
--   callback = function(event)
--     if vim.bo[event.buf].modified and vim.bo[event.buf].buftype == "" then
--       vim.cmd("silent! write")
--     end
--   end,
-- })
-- -- Disable treesitter highlighting and matchparen for large files
-- local group = vim.api.nvim_create_augroup("LargeFile", { clear = true })
-- vim.api.nvim_create_autocmd("BufReadPre", {
--   group = group,
--   callback = function()
--     local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
--     if stats and stats.size > 1024 * 40 then -- 40 KB
--       vim.cmd("setlocal eventignore+=BufEnter,BufWritePost,CursorHold,CursorHoldI,InsertEnter")
--       pcall(vim.cmd, "TSBufDisable highlight")
--       pcall(vim.cmd, "TSBufDisable indent")
--       pcall(vim.cmd, "NoMatchParen")
--       vim.cmd("setlocal nocursorline")
--       vim.cmd("setlocal nocursorcolumn")
--       vim.cmd("syntax sync minlines=100") -- Drastically reduces sync time
--     end
--   end,
-- })
