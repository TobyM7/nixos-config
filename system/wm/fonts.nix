{ config, pkgs, ... }:

{
  # Fonts are nice to have
  fonts.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "Inconsolata" ]; })
    powerline
    inconsolata
    inconsolata-nerdfont
    victor-mono
    iosevka
    font-awesome
    ubuntu_font_family
    terminus_font
  ];

}
