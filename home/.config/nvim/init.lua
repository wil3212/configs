        ---------------------------------------------------------------------------------
        -- Bootstrap lazy.nvim
    
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not vim.loop.fs_stat(lazypath) then
          vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
          })
        end
        vim.opt.rtp:prepend(lazypath)
    
        ---------------------------------------------------------------------------------
        -- Setting Markdown as default syntax things
    
        require("lazy").setup({
          {
            "vimwiki/vimwiki",
            init = function()
              vim.g.vimwiki_list = {
        	{
        	  path = '~/vimwiki/',
        	  syntax = 'markdown',
        	  ext = '.md',
        	},
              }
	      vim.g.vimwiki_markdown_link_ext = 1
            end,
          },
        })
   
--      -- Garante que arquivos .md sejam tratados como markdown para highlight
--      vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
--          pattern = "*.md",
--          command = "set filetype=markdown",
--      })



---------------------------------------------------------------------------------

-- Atalho para inserir o timestamp manualmente a qualquer momento (Ctrl + t)
vim.keymap.set('n', '<C-t>', 'i<C-R>=strftime("%H:%M")<CR><Esc>', { desc = 'Insere Horário' })

-- Autocomando para inserir data/hora ao criar um novo arquivo no diário
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*/diary/*.md",
  callback = function()
    local caption = os.date("# %Y-%m-%d %H:%M")
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { caption, "", "" })
  end,
})

-- Atualiza os links do diário automaticamente ao entrar no índice
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "diary.md",
  command = "VimwikiDiaryGenerateLinks",
})




----------------------------------------------------------------


vim.cmd('colorscheme vim')
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true


vim.opt.ignorecase = true      -- Case insensitive searching
vim.opt.smartcase = true       -- ...unless capital letters are used
vim.opt.termguicolors = true   -- Better color support
 

-- This makes the numbers bright yellow (like your Vim)
-- 'guifg' sets the foreground color
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#e3b52d' }) 
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#e3b52d', bold = true })

-- Força o fundo das janelas flutuantes a ser transparente ou igual ao terminal
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#e3b52d" }) -- Usa o seu amarelo nas bordas

-- Optional: If you want the comments or other UI elements to be brighter
-- vim.api.nvim_set_hl(0, 'Comment', { fg = '#888888', italic = true })
  
vim.g.vimwiki_hl_cb_checked = 1
vim.opt.virtualedit = "all"

-- Forçar as cores sempre que o tipo de arquivo for vimwiki ou markdown

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vimwiki", "markdown" },
  callback = function()
    local yellow = "#e3b52d"
    -- Sobrescreve o link que o plugin criou (VimwikiHeader1 -> Title)
    -- e define a cor diretamente
    vim.api.nvim_set_hl(0, 'VimwikiHeader1', { fg = yellow, bold = true })
    vim.api.nvim_set_hl(0, 'VimwikiHeader2', { fg = yellow, bold = true })
    vim.api.nvim_set_hl(0, 'VimwikiHeader3', { fg = yellow, bold = true })
    
    -- Faz o mesmo para os grupos de Markdown puro
    vim.api.nvim_set_hl(0, 'markdownH1', { fg = yellow, bold = true })
    vim.api.nvim_set_hl(0, 'markdownH2', { fg = yellow, bold = true })
  end,
})

    --  -- Força o reconhecimento de arquivos de texto puro
    --  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    --    pattern = "*.txt",
    --    command = "set filetype=text",
    --  })

-- Adicione ao seu init.lua para ver os arquivos abertos
-- vim.opt.showtabline = 2
--
--
-- -- ~/.config/nvim/init.lua

-- Melhora o Enter no Vimwiki para abrir arquivos externos corretamente
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vimwiki",
  callback = function()
    vim.keymap.set('n', '<CR>', function()
      local line = vim.api.nvim_get_current_line()
      -- Se a linha parecer um link de arquivo Markdown padrão [txt](path)
      if line:match("%(.-%.txt%)") or line:match("%(.-%.py%)") then
        return "gf"
      else
        -- Se não, usa o Enter padrão do Vimwiki (VimwikiFollowLink)
        return "<Plug>VimwikiFollowLink"
      end
    end, { buffer = true, expr = true, noremap = false })
  end,
})


-- Mantém 999 linhas de distância das bordas, forçando o cursor ao centro
vim.opt.scrolloff = 999
