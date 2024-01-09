{ config, lib, pkgs, name, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = name;
  programs.git.extraConfig = {
    init.defaultBranch = "main";
  };
}
