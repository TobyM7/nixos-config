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
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
