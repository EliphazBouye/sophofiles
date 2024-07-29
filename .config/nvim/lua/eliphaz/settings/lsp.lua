local M = {}

function M.on_attach (client, bufnr)
  -- Lsp
  vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set("n", "gD", vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })

  -- Diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr })
  vim.keymap.set("n", "gf", vim.diagnostic.open_float, { buffer = bufnr })
  vim.keymap.set("n", "d]", vim.diagnostic.goto_next, { buffer = bufnr })
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { buffer = bufnr })

  -- Auto command util
  -- vim.api.nvim_create_autocmd(
  --   { "CursorHold",},
  --   {
  --     pattern = {"*"},
  --     group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  --     callback = function()
  --       local options = {
  --         focus=false,
  --         border = "rounded",
  --         close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" }
  --       }
  --       if not require('cmp').visible() then
  --         vim.lsp.buf.hover(options)
  --       end
  --     end
  --   }
  -- )
end

return M
