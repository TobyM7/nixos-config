{ config, lib, pkgs, stdenv, toString, browser, term, spawnEditor, font, hyprland-plugins, dotfilesDir, ... }:

{
  imports = [
    ../../app/terminal/alacritty.nix
    ../../app/waybar/waybar.nix
    ../../app/wlogout/wlogout.nix
    ../../app/rofi/rofi.nix
    ../../app/thunar/thunar.nix
    ../../app/terminal/kitty.nix
    ../../app/fnott/fnott.nix
    ../../app/nvim/nvim.nix
    ../../app/emacs/emacs.nix
<<<<<<< HEAD
=======
    ../../lang/python/python.nix
>>>>>>> ba065d2 (changed user)
    ../../app/swaylock/swaylock.nix
    ./hyprconf.nix
    ./pkg.nix
    (import ../../app/dmenu-scripts/networkmanager-dmenu.nix {
      dmenu_command = "rofi -show drun";
      inherit config lib pkgs;
    })
    (import ./hyprprofiles/hyprprofiles.nix {
      dmenuCmd = "rofi -show drun"; inherit config lib pkgs;
    })
  ];

  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    size = 36;
  };


  home.file.".config/hypr/pyprland.json".source = ./pyprland.json;

}
