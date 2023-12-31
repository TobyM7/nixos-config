{config,lib,pkgs,...}:
{
services.emacs = {
enable = true;
install = true;
startWithGraphical = true;
startWithUserSession = true;
socketActivation.enable = true;
};
programs.emacs = {
enable = true:
};
home.file.".config/emacs/" = {source = ./emacs-config; recursive = true;};
}
