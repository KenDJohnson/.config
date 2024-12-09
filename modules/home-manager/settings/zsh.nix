{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
      share = false;
    };
    initExtra = ''
      bindkey jf vi-cmd-mode
    '';

    shellAliases = {
      nixswitch = "darwin-rebuild switch --flake ~/.config/nix-darwin/.#";
      nixup = "pushd ~/.config/nix-darwin; nix flake update; nixswitch; popd";
      ls = "ls --color=auto";
      ll = "ls -lahrts";
      l = "ls -l";
      ec = "emacsclient -t";
      cat = "bat";
    };

    oh-my-zsh = {
      enable = true;
      theme = "sunaku";
      plugins = [
        "gitfast"
        "vi-mode"
      ];
    };
  };
}
