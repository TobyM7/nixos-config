{
  description = "Flake of LibrePhoenix";

  outputs = { self, nixpkgs, home-manager, nix-doom-emacs, stylix, eaf, eaf-browser, org-nursery, org-yaap, org-timeblock, phscroll, blocklist-hosts, rust-overlay, hyprland-plugins, ... }@inputs:
  let
    # ---- SYSTEM SETTINGS ---- #
    system = "x86_64-linux"; # system arch
    hostname = "dan"; # hostname
    profile = "work"; # select a profile defined from my profiles directory
    timezone = "Europe/London"; # select timezone
    locale = "en_GB.UTF-8"; # select locale

    # ----- USER SETTINGS ----- #
    username = "dan"; # username
    name = "TobyM7"; # name/identifier
    email = "tobywjmonaghan@gmail.com"; # email (used for certain configurations)
    dotfilesDir = "~/.config/nix-os/"; # absolute path of the local repo
    theme = (builtins.readFile "/home/dan/.config/nix-os/currenttheme"); # selcted theme from my themes directory (./themes/)
    wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
    wmType = "wayland"; # x11 or wayland
    browser = "brave"; # Default browser; must select one from ./user/app/browser/
    editor = "emacsclient"; # Default editor;
    defaultRoamDir = "Personal.p"; # Default org roam directory relative to ~/Org
    term = "kitty"; # Default terminal command;
    font = "Intel One Mono"; # Selected font
    fontPkg = pkgs.intel-one-mono; # Font package

    # editor spawning translator
    # generates a command that can be used to spawn editor inside a gui
    # EDITOR and TERM session variables must be set in home.nix or other module
    # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
    spawnEditor = if (editor == "emacsclient") then "emacsclient -c -a 'emacs'"
                  else (if ((editor == "vim") || (editor == "nvim") || (editor == "nano")) then "exec " + term + " -e " + editor else editor);

    # create patched nixpkgs
    nixpkgs-patched = (import nixpkgs { inherit system; }).applyPatches {
      name = "nixpkgs-patched";
      src = nixpkgs;
      patches = [ ./patches/emacs-no-version-check.patch
                  ./patches/nixos-nixpkgs-268027.patch ];
    };

    # configure pkgs
    pkgs = import nixpkgs-patched {
      inherit system;
      config = { allowUnfree = true;
                 allowUnfreePredicate = (_: true); };
      overlays = [ rust-overlay.overlays.default ];
    };

    # configure lib
    lib = nixpkgs.lib;

  in {
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ (./. + "/profiles"+("/"+profile)+"/home.nix") ]; # load home.nix from selected PROFILE
          extraSpecialArgs = {
            # pass config variables from above
            inherit username;
            inherit name;
            inherit hostname;
            inherit profile;
            inherit email;
            inherit dotfilesDir;
            inherit defaultRoamDir;
            inherit theme;
            inherit font;
            inherit fontPkg;
            inherit wm;
            inherit wmType;
            inherit browser;
            inherit editor;
            inherit term;
            inherit spawnEditor;
            inherit (inputs) nix-doom-emacs;
            inherit (inputs) stylix;
            inherit (inputs) eaf;
            inherit (inputs) eaf-browser;
            inherit (inputs) org-nursery;
            inherit (inputs) org-yaap;
            inherit (inputs) org-side-tree;
            inherit (inputs) org-timeblock;
            inherit (inputs) phscroll;
            inherit (inputs) hyprland-plugins;
          };
      };
    };
    nixosConfigurations = {
      system = lib.nixosSystem {
        inherit system;
        modules = [ (./. + "/profiles"+("/"+profile)+"/configuration.nix") ]; # load configuration.nix from selected PROFILE
        specialArgs = {
          # pass config variables from above
          inherit username;
          inherit name;
          inherit hostname;
          inherit timezone;
          inherit locale;
          inherit theme;
          inherit font;
          inherit fontPkg;
          inherit wm;
          inherit (inputs) stylix;
          inherit (inputs) blocklist-hosts;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-doom-emacs.url = "github:librephoenix/nix-doom-emacs?ref=pgtk-patch";
    stylix.url = "github:danth/stylix";
    rust-overlay.url = "github:oxalica/rust-overlay";
    eaf = {
      url = "github:emacs-eaf/emacs-application-framework";
      flake = false;
    };
    eaf-browser = {
      url = "github:emacs-eaf/eaf-browser";
      flake = false;
    };
    org-nursery = {
      url = "github:chrisbarrett/nursery";
      flake = false;
    };
    org-yaap = {
      url = "gitlab:tygrdev/org-yaap";
      flake = false;
    };
    org-side-tree = {
      url = "github:localauthor/org-side-tree";
      flake = false;
    };
    org-timeblock = {
      url = "github:ichernyshovvv/org-timeblock";
      flake = false;
    };
    phscroll = {
      url = "github:misohena/phscroll";
      flake = false;
    };
    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      flake = false;
    };
  };
}
