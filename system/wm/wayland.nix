{ config, lib, pkgs, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./gnome-keyring.nix
              ./fonts.nix
            ];


  # Configure xwayland
  services.xserver = {
    enable = true;
    layout = "gb";
    xkbVariant = "";
<<<<<<< HEAD
    xkbOptions = "caps:escape";
=======
>>>>>>> ba065d2 (changed user)
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
