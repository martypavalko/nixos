{ inputs, pkgs, config, ... }:

{
    imports = [
        ./pkgs.nix
        ./sound.nix
        ./users.nix
        ./vm.nix
        ./wms.nix
    ]
}