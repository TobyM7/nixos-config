{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      python3Full
<<<<<<< HEAD
      imath
      pystring
=======
>>>>>>> ba065d2 (changed user)
  ];
}
