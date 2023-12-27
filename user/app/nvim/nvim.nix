{config,lib,pkgs,...}:
{
home.packages = with pkgs;
    [
     vimPlugins.nvchad 
    ];

}
