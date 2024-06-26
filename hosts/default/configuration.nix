# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  #
  # # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  #
  # Configure keymap in X11
  services.xserver = {
    xkb = {
      variant = "";
      layout = "us";
    };
    enable = true;
    displayManager.gdm.enable = true;
    # touchpad support
    libinput.enable = true;
  };

  #HyprLand Config

  programs.hyprland = {
      enable = true;
      # nvidiaPatches = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      xwayland.enable = true;
  };

  hardware.opengl.enable = true;

  # End HyprLand

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marty = {
    isNormalUser = true;
    useDefaultShell = true;
    description = "marty";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      obsidian
      firefox
    ];
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "marty" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # HyprLand
    waybar
    gtk3
    gtk2
    #(waybar.overrideAttrs (oldAttrs: {
    #    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #  })
    #)
    
    dunst
    libnotify
    swww
    rofi-wayland
    networkmanagerapplet
    wl-clipboard
    grim
    slurp

    pavucontrol

    # shell
    thefuck
    zsh-powerlevel10k

    # utils
    unzip
    lf
    # xclip

    # tmux
    tmux
    neovim
    wget
    git
    curl
    kitty

    # dev
    gcc
    go
    fd
    ripgrep
    python3
    lazygit
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

}
