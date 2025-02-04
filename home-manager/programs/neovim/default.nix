{ lib, config, pkgs, ... }: {

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

    programs.nvf = {
      enable = true;

      settings = {
        vim = {
          autocomplete.nvim-cmp.enable = true;
          statusline.lualine.enable = true;
          telescope.enable = true;
          undoFile.enable = true;
          treesitter.enable = true;

          theme = {
            enable = true;
            name = "catppuccin";
            style = "mocha";
          };

          languages = {
            enableLSP = true;
	          enableTreesitter = true;
	          nix.enable = true;
          };
          
	        options = {
            tabstop = 2;
            shiftwidth = 2;
            wrap = false;
          };

	        lineNumberMode = "relNumber";

          luaConfigPost = ''
            local builtin = require('telescope.builtin')
            vim.keymap.set("n", "<C-f>", builtin.find_files)
            vim.keymap.set("n", "<C-g>", builtin.live_grep)

            vim.keymap.set("n", "<C-e>", vim.cmd.Ex)
            vim.keymap.set("x", "p", [["_dP]])
            vim.keymap.set({"n", "v"}, "<C-s>", [["+y]])
          '';
        };
      };
    };
  };
}
