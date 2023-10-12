{ pkgs, config, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        # Window Manager
        polybar
        sxhkd
        picom
        pavucontrol
        rofi
        zathura
        feh
        neofetch
        xorg.libX11
        xorg.libX11.dev
        xorg.libxcb
        xorg.libXft
        xorg.libXinerama
        xorg.xinit
        xorg.xinput
        xorg.xbacklight

        vim
        git
        wget
        curl
        python312
        ansible
        gcc
    ];
}