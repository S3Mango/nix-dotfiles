{ pkgs, ... }: {
  # Define users
  users.users.s3mango = {
    isNormalUser = true;
    description = "s3mango";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" "lp"];
    shell = pkgs.zsh;
  };
}
