{config, lib, pkgs, ...}:
{
  home.packages = with pkgs;
    [
      wlogout
    ];
  home.file.".config/wlogout/icons/lock.png".source = ./lock.png;
  home.file.".config/wlogout/icons/lock-hover.png".source = ./lock-hover.png;
  home.file.".config/wlogout/icons/logout.png".source = ./logout.png;
  home.file.".config/wlogout/icons/logout-hover.png".source = ./logout-hover.png;
  home.file.".config/wlogout/icons/power.png".source = ./power.png;
  home.file.".config/wlogout/icons/power-hover.png".source = ./power-hover.png;
  home.file.".config/wlogout/icons/restart.png".source = ./restart.png;
  home.file.".config/wlogout/icons/restart-hover.png".source = ./restart-hover.png;
  home.file.".config/wlogout/icons/sleep-hover.png".source = ./sleep-hover.png;
  home.file.".config/wlogout/icons/sleep.png".source = ./sleep.png;
  home.file.".config/wlogout/layout".source = ./layout;
  home.file.".config/wlogout/style.css".source = ./style.css;


}

