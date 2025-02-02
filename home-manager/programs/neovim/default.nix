{ lib, config, pkgs, self, ... }: {

  imports = [
    ./keymaps.nix
  ];

  options = {
    neovim_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Neovim with home-manager";
    };
  };

  config = lib.mkIf config.neovim_home-manager.enable {
    home.packages = with pkgs; [
      neovim
    ];

    programs.nixvim = {
      enable = true;   
      defaultEditor = true;
      colorschemes.catppuccin = {
        enable = true;
        settings = {
          flavour = "mocha";
          transparent_background = true;
        };
      };

      plugins = {
        web-devicons.enable = false;

        telescope = {
          enable = true;
          keymaps = {
            "<C-f>" = "find_files";
            "<C-g>" = "live_grep";
          };
        };

        lsp = {
          enable = true;
          servers = {
            nil_ls.enable = true;
          };
        };
	
        cmp-nvim-lsp.enable = true;

        undotree.enable = true;
        treesitter.enable = true;
	lualine.enable = true;
      };

      clipboard.providers.wl-copy.enable = true;

      globalOpts = {
        number = true;
        relativenumber = true;

        tabstop = 2;
        shiftwidth = 2;
        softtabstop = 0;
      };

      extraConfigLua = ''
        vim.keymap.set("n", "<C-e>", vim.cmd.Ex)
        vim.keymap.set("x", "p", [["_dP]])
        vim.keymap.set({"n", "v"}, "<C-s>", [["+y]])
      '';
    };
  };
}
