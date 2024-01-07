{ config, pkgs, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./gnome-keyring.nix
              ./fonts.nix
            ];

  # Configure X11
  services.xserver = {
    enable = true;
    layout = "gb";
    xkbVariant = "";
<<<<<<< HEAD
    xkbOptions = "caps:escape";
=======
>>>>>>> ba065d2 (changed user)
    excludePackages = [ pkgs.xterm ];
    displayManager = {
      lightdm.enable = true;
      sessionCommands = ''
      xset -dpms
      xset s blank
      xset r rate 350 50
      xset s 300
      ${pkgs.lightlocker}/bin/light-locker --idle-hint &
    '';
    };
    libinput = {
      touchpad.disableWhileTyping = true;
    };
  };
}
