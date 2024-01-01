{config,lib,pkgs,...}:
{
services.emacs = {
enable = true;
};
programs.emacs = {
enable = true;
};
home.file.".config/emacs/" = {source = ./emacs-config; recursive = true;};
}
