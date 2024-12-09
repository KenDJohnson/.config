{ pkgs, ... }:
let
  homeDir = "/Users/kjohnson";
  in-home = path: "${homeDir}/${path}";
in

{

  imports = [
    ./settings/zsh.nix
  ];

  manual = {
    json.enable = true;
    manpages.enable = true;
  };
  home = {
    username = "kjohnson";
    homeDirectory = "/Users/kjohnson";
    packages = with pkgs; [
        curl
        fd
        jq
        less
        ripgrep
        rustup
        tree-sitter
        wget
    ];
    # extra things to add to $PATH
    sessionPath = [
      (in-home "bin")
      (in-home ".local/bin")
      (in-home ".cargo/bin")
      (in-home ".idapro/idasdk/bin")
      # TODO emacs
      # TODO remove macports
      "/opt/local/bin"
      "/opt/local/sbin"

      "/Applications/IDA Home (ARM) 9.0.app/Contents/MacOS"
      "/opt/cross/bin" # TODO migrate to nix
      (in-home ".config/emacs/bin")
      # TODO racket
    ];
    sessionVariables = {
      PAGER = "less";
      CLICOLOR = 1;
      EDITOR = "emacsclient";
      RUSTFLAGS = "-L/usr/lib/libiconv";
      # for IDA SDK. Better way to do this?
      __MAC__ = 1;
    };
  };
  fonts.fontconfig = {
    enable = true;
    # defaultFonts = {
    #   emoji = [];
    #   monospace = [];
    #   sansSerif = [];
    #   serif = [];
    # };
  };
  programs = {
    home-manager.enable = true;
    git.enable = true;
    emacs = {
      enable = true;
      extraPackages = epkgs: [ epkgs.doom ];
    };
    # dircolors = {
    #   enable = true;
    #   enableZshIntegration = true;
    # };
    bat = {
      enable = true;
      config = {
        # map-syntax = [
        #   "*.jenkinsfile:Groovy"
        # ];
        theme = "OneHalfDark";
        # see https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bat.syntaxes
        # syntaxes = {};
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      # use nix-direnv instead
      # nix-direnv.enable = true;
      # silent = true;
    };

    fzf = {
      enable = true;
      # enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      colors = "auto";
    };

    jq = {
      enable = true;
    };

    ssh = {
      enable = true;
      addKeysToAgent = "yes";
      compression = true;
      # TODO import from ~/.ssh/config
      # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.ssh.matchBlocks
      matchBlocks = {};
    };
  };
  services = {
    emacs = {
      enable = true;
      client = {
        enable = true;
        arguments = [
          "-c"
        ];
      };
      # defaultEditor = true;
      startWithUserSession = "graphical";
    };

    # yabai.enable = true; TODO tiling wm to try


    # https://nix-community.github.io/home-manager/options.xhtml#opt-services.git-sync.enable
    # git-sync = {};
    # gpg-agent = {};
  };
  # https://nix-community.github.io/home-manager/options.xhtml#opt-targets.darwin.defaults
  # targets.darwin.currentHostDefaults = {};

  # this is internal compatibility configuration
  # for home-manager, don't change this!
  home.stateVersion = "23.05";
}
