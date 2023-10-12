{ config, ... }:

{
    services.xserver = {
        enable = true;
        # windowManager.dwm.enable = true;
        windowManager.bspwm.enable = true;
        services.xserver.layout = "us";
        # videoDrivers = [ "nvidia" ];
        # videoDrivers = [ "amdgpu-pro" ];
        displayManager {
            lightdm.enable = true;
            autoLogin = {
                enable = false;
                user = "marty";
            };
        }
    };

    services.picom =  {
        enable = true;
        fade = true;
        inactiveOpacity = 0.9;
        shadow = true;
        fadeDelta = 4;
    };
}