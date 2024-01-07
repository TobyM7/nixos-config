# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, blocklist-hosts, username, name, hostname, timezone, locale, wm, theme, ... }:
{
  imports =
    [ ../../system/hardware-configuration.nix
      ../../system/hardware/systemd.nix # systemd config
      ../../system/hardware/kernel.nix # Kernel config
      ../../system/hardware/opengl.nix
      ../../system/hardware/printing.nix
      ../../system/hardware/bluetooth.nix
      (./. + "../../../system/wm"+("/"+wm)+".nix") # My window manager
      ../../system/security/gpg.nix
      ../../system/security/firewall.nix
      ../../system/style/stylix.nix
    ];

  # Fix nix path
  nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
                  "nixos-config=$HOME/dotfiles/system/configuration.nix"
                  "/nix/var/nix/profiles/per-user/root/channels"
                ];

  # Ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;
<<<<<<< HEAD
boot.loader.grub = {
enable = true;
device = "/dev/sda";
useOSProber = true;
=======
boot.loader = {
systemd-boot.enable = true;
efi.canTouchEfiVariables = true;
>>>>>>> ba065d2 (changed user)
};
  # Networking
  networking.hostName = hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager

  # Timezone and locale
  time.timeZone = timezone; # time zone
  i18n.defaultLocale = locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  # User account
  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    uid = 1000;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    cryptsetup
    home-manager
  ];


  fonts.fontDir.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

system.autoUpgrade = {
enable = true;
allowReboot = true;
dates = "weekly";
};
nix = {
settings.auto-optimise-store = true;
gc = {
 automatic = true;
 dates = "weekly";
 options = "--delete-older-than 7d";
 };
};
programs = { 
  thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };
};

  services.tumbler.enable = true;
  services.gvfs.enable = true;
  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "22.11";

}
