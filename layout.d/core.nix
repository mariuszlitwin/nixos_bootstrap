{ config, pkgs, ... }:

{
  time.timeZone = "UTC";

  nix.useSandbox = true;
  nix.buildCores = 0;
  nixpkgs.config.allowUnfree = true;
  security.sudo = {
    enable = true;
    extraConfig = ''
      ALL ALL=(root) NOPASSWD: ${pkgs.rfkill}/rfkill
    '';
  };

  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  services.locate.enable = true;
  services.haveged.enable = true;

  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
  };

  environment = {
    sessionVariables = {
      EDITOR = "vim";
      PYTHONDONTWRITEBYTECODE = "1";
    };
    # Basic packages
    systemPackages = with pkgs; [
      hfsprogs ntfs3g exfat
      gcc
      iptables
      file 
      zip unzip unrar p7zip 
      wget curl
      gitFull
      nix-repl
      mc
      jq bc
      openssl openssl.dev libffi gnupg20 kpcli
      htop
      iptraf-ng
      sshfs-fuse

      (
        with import <nixpkgs> {};

        vim_configurable.customize {
          name = "vi";
          vimrcConfig.customRC = ''
            syntax enable
            filetype on

            set expandtab
            set bs=2

            set tabstop=2
            set softtabstop=2
            set shiftwidth=2

            set autoindent
            set smartindent
            set smartcase
            set ignorecase
            set modeline
            set encoding=utf-8
            set number

            set foldmethod=indent
            set foldlevel=99
            nnoremap <space> za

            " Python options
            au BufNewFile,BufRead *.py
               \ set tabstop=4
               \ set softtabstop=4
               \ set shiftwidth=4
               \ set textwidth=79
               \ set expandtab
               \ set autoindent
               \ set fileformat=unix
          '';
          # Use the default plugin list shipped with nixpkgs
          vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
          vimrcConfig.vam.pluginDictionaries = [
            { names = [
              "Syntastic"
              "youcompleteme"
              "vim-css-color"
              "vim-nix"
            ]; }
          ];
        }
      )
    ];
  };
}
