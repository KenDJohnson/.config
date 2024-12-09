{ pkgs, ... }: {
  environment = {
    shells = builtins.attrValues {
      inherit (pkgs) bash zsh;
    };
    systemPackages = [
      pkgs.coreutils
      pkgs.emacs
    ];
    systemPath = [ "/usr/local/bin" ];
    # pathsToLink = [ "/Applications" ];
  };
}
