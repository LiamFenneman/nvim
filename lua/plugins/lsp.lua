local ensure_installed = {
  "lua_ls",
  "rust_analyzer",
  "tsserver",
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local handlers = {
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local nmap = function(keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end

      vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

    nmap("gl", vim.diagnostic.open_float, "Open diagnositic floating window")
    -- See: trouble.lua
    -- nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
    -- nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")

    -- Create a command `:Format` local to the LSP buffer
    -- vim.api.nvim_buf_create_user_command(ev.buf, "Format", function(_)
    --   vim.lsp.buf.format()
    -- end, { desc = "LSP: Format current buffer" })
    -- nmap("<leader>f", vim.lsp.buf.format, "[F]ormat current buffer")
  end,
})

return {
  "neovim/nvim-lspconfig",
  priority = 40,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    if vim.g.mason then
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        automatic_installation = { exclude = { "rust_analyzer" } },
        handlers = handlers,
      })
    end
    require("fidget").setup()

    -- manually setup rust_analyzer since its not being handled by Mason
    require("lspconfig").rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
          },
        },
      },
    })
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
          telemetry = { enable = false },
        },
      },
    })
  end,
}
