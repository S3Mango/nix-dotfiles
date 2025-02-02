{ lib, config, self, ... }: {

  options = {
    neovim_keymaps.enable = lib.mkOption {
      default = true;
      description = "Enable keymaps in Neovim";
    };
  };

  config = lib.mkIf config.neovim_keymaps.enable {
    programs.nixvim = {
      keymaps = [
        {
          mode = "i";
          key = "<C-c>";
          action = "<Esc>";
        }
        {
          mode = ["n" "v"];
          key = "H";
          action = "6h";
        }
        {
          mode = ["n" "v"];
          key = "K";
          action = "6k";
        }
        {
          mode = ["n" "v"];
          key = "J";
          action = "6j";
        }
        {
          mode = ["n" "v"];
          key = "L";
          action = "6l";
        }
        {
          mode = ["n" "v"];
          key = "<C-h>";
          action = "^";
        }
        {
          mode = ["n" "v"];
          key = "<C-k>";
          action = "16kzz";
        }
        {
          mode = ["n" "v"];
          key = "<C-j>";
          action = "16jzz";
        }
        {
          mode = ["n" "v"];
          key = "<C-l>";
          action = "$";
        }
        {
          mode = "n";
          key = "<C-i>";
          action = "viwo<C-c>i";
        }
        {
          mode = "n";
          key = "<C-i>";
          action = "viwo<C-c>i";
        }
        {
          mode = "n";
          key = "<C-a>";
          action = "viw<C-c>a";
        }
        {
          mode = ["n" "v"];
          key = "Q";
          action = "ggv0G$";
        }
        {
          mode = "v";
          key = "<tab>";
          action = "mj>g'j";
        }
        {
          mode = "n";
          key = "<tab>";
          action = "V>";
        }
      ];
    };
  };
}
