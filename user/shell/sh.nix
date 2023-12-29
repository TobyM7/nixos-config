{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
  };
home.file."/home/dan/".source = ./bash/.bashrc;
home.file.".config/bash/.bash_prompt".source = ./bash/.bash_prompt;
home.file.".config/bash/.bash_profile".source = ./bash/.bash_profile;
home.file.".config/bash/.aliases".source = ./bash/.aliases;
home.file.".config/bash/.functions".source = ./bash/.functions;
home.file.".config/bash/.exports".source = ./bash/.exports;
  home.packages = with pkgs; [
    disfetch lolcat cowsay onefetch
    gnugrep gnused
    bat eza bottom fd
    direnv nix-direnv
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
