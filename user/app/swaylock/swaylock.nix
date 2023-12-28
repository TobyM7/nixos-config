{config,lib,pkgs,...}:
{
  programs.swaylock = {
    enable = true;
    };
home.file.".config/swaylock/config".source = ./config;  
}
