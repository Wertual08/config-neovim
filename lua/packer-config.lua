local Module = {}

function Module.setup()
    local conf = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    }

    local function packer_init()
        local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        local result = false
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
            vim.fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            }
            vim.cmd [[packadd packer.nvim]]
            result = true
        end

        vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"

        return result
    end

    local packer_bootstrap = packer_init()

    local function plugins(use)
        use { "wbthomason/packer.nvim" }

        require("plugins").setup(use)

        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end
    end

    local packer = require("packer")
    packer.init(conf)
    packer.startup(plugins)
end

return Module
