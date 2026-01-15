{ lib, config, pkgs, ... }: {

  options = {
    kernel_nixos.enable = 
      lib.mkEnableOption "Enables specified kernel with NixOS modules";
  };

  config = lib.mkIf config.kernel_nixos.enable {
    boot = {
      kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
     };
    };
}
