{config,lib,pkgs,dotfilesDir,...}:
{  
  programs.rofi = {
  enable = true;	
  theme = dotfilesDir + "user/app/rofi/style.rasi" ;
  };
}
