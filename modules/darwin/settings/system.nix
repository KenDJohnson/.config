{ pkgs, ... }: {

  system = {
    defaults = {

      dock = {
        tilesize = 24;
        mru-spaces = false;
        # disable hot corners
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  services.nix-daemon.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
