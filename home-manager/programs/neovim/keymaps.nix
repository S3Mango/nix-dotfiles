{ lib, config, ... }: {

  options = {
    neovim_keymaps.enable = lib.mkOption {
      default = true;
      description = "Enable keymaps in Neovim";
    };
  };

  config = lib.mkIf config.neovim_keymaps.enable {
    programs.nvf = {
      settings = {
        vim = {
          keymaps = [
            {
              mode = "i";
              key = "<C-c>";
              action = "<Esc>";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "H";
              action = "6h";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "K";
              action = "6k";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "J";
              action = "6j";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "L";
              action = "6l";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "<C-h>";
              action = "^";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "<C-k>";
              action = "16kzz";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "<C-j>";
              action = "16jzz";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "s";
              action = "y";
	            silent = true;
            }
            {
              mode = "n";
              key = "S";
              action = "yy";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "<C-l>";
              action = "$";
	            silent = true;
            }
            {
              mode = "n";
              key = "<C-i>";
              action = "viwo<C-c>i";
	            silent = true;
            }
            {
              mode = "n";
              key = "<C-a>";
              action = "viw<C-c>a";
	            silent = true;
            }
            {
              mode = ["n" "v"];
              key = "Q";
              action = "ggv0G$";
	            silent = true;
            }
            {
              mode = "v";
              key = "<tab>";
              action = "mj>g'j";
	            silent = true;
            }
            {
              mode = "n";
              key = "<tab>";
              action = "V>";
	            silent = true;
            }
          ];
	      };
      };
    };
  };
}
