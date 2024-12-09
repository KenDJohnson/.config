{ pkgs, ... }: {
      nix.settings.experimental-features = "nix-command flakes";
      # system.configurationRevision = self.rev or self.dirtyRev or null;
      nixpkgs.hostPlatform = "x86_64-darwin";

      users.users.kjohnson = {
        name = "kjohnson";
        home = "/Users/kjohnson";
      };
      programs.zsh.enable = true;

      security.pam.enableSudoTouchIdAuth = true;

      imports = [
        ./settings/system.nix
        ./settings/environment.nix
      ];
}
