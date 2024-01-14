{ config, lib, pkgs, name, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
}
