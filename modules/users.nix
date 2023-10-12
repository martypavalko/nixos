{ config, ... }:

{
    users.users.marty = {
        isNormalUser = true;
        description = "Marty Pavalko";
        extraGroups = ["networkmanager" "wheel" ];
        # openssh.authorizedKeys.keys = [
            
        # ];
    };
}