local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        { "catppuccin/nvim", name = "mocha", priority = 1000 }
    },
    {
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }
    },
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                'js-debug-adapter'
            }
        }
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',              branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-treesitter/nvim-treesitter-context' },
    {
        'nvimtools/none-ls.nvim',
        event = 'VeryLazy'
    },
    {
        'mfussenegger/nvim-dap'
    },
    {
        'rcarriga/nvim-dap-ui',
        event = 'VeryLazy',
        dependencies = 'mfussenegger/nvim-dap',
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            require("dapui").setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
})
