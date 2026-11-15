local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end    
]])

return require('packer').startup(function(use)
    -- 放入Plugin區域
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'
  use "blazkowolf/gruber-darker.nvim"
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  --vim.pack.add({
  --{
  --  src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
  --  version = vim.version.range('3')
  --},
  
  -- dependencies
  --"https://github.com/nvim-lua/plenary.nvim",
  --"https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  --"https://github.com/nvim-tree/nvim-web-devicons",
  --})

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
            
 -- use "neovim/nvim-lspconfig" -- 內建 LSP 基礎設定
 -- use "williamboman/mason.nvim" -- 管理 LSP 伺服器
 -- use "williamboman/mason-lspconfig.nvim" -- 連結 Mason 與 lspconfig

  -- 自動補全相關插件
  --use "hrsh7th/nvim-cmp" -- 補全引擎
  --use "hrsh7th/cmp-nvim-lsp" -- LSP 補全來源
  --use "L3MON4D3/LuaSnip" -- 程式碼片段引擎
  --use "saadparwaiz1/cmp_luasnip" -- 片段補全來源
  --use "rafamadriz/friendly-snippets" -- 常用程式碼片段



  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  } --括號補全

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  vim.pack.add({
  "https://github.com/sphamba/smear-cursor.nvim",
  })

  use {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
  end,
  }

  --use {
  --'jinzhongjia/zig-lamp',
  --ft = { 'zig', 'zon' }, 
  --requires = {
  --  'nvim-lua/plenary.nvim',
  --  'neovim/nvim-lspconfig',
 --},
  --config = function()
  --  vim.g.zig_lamp_zls_auto_install = 1 
  --end
  --}

   --use {
   -- 'nvim-treesitter/nvim-treesitter',
   -- run = function()
   --   local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
   --   ts_update()
   -- end,
   -- config = function()
   --   -- 🛡️ 安全防護：嘗試載入 treesitter，如果還沒下載好就直接跳出，不跳紅色報錯
   --   local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
   --   if not status_ok then
   --     return
   --   end

     -- treesitter.setup({
     --   ensure_installed = { 
    --      "c", "java", "rust", "zig", "lua", "markdown", "markdown_inline", "vim", "vimdoc", "query" 
     --   },
     --   highlight = {
       --   enable = true,
       --   additional_vim_regex_highlighting = false, 
       -- },
      --})
   -- end
 -- }


  if packer_bootstrap then
    require('packer').sync()
  end
end)
