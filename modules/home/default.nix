{ pkgs, ... }:
let
  neovim-config = pkgs.fetchFromGitHub {
    owner = "martypavalko";
    repo = "nvim";
    rev = "9f0a0b68b8fa9a6ffad1d06d7738ac251cc4d3c3";
  };
in
{
 xdg.configFile."nvim".source = neovim-config;
 programs.neovim.enable = true;
}
