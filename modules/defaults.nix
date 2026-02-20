{
  den,
  __findFile,
  inputs,
  ...
}: {
  den.default = {
    darwin = {
      system.stateVersion = 6;

      home-manager.backupFileExtension = "backup";
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    nixos = {
      system.stateVersion = "25.11";

      imports = [
        inputs.nix-index-database.nixosModules.nix-index
        inputs.disko.nixosModules.disko
      ];

      nixpkgs.config.allowUnfree = true;
      programs.nix-index-database.comma.enable = true;
      programs.nix-ld.enable = true;

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
      };

      nix = {
        settings = {
          warn-dirty = false;
          extra-system-features = ["recursive-nix"];
          experimental-features = [
            "nix-command"
            "flakes"
            "pipe-operators"
            "recursive-nix"
          ];
          trusted-users = [
            "root"
            "@wheel"
          ];
          substituters = [
            "https://cache.nixos.org/"
            "https://nix-community.cachix.org"
          ];
          trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
        };
      };
    };

    homeManager = {config, ...}: {
      home.stateVersion = "25.11";
      imports = [inputs.nix-index-database.homeModules.nix-index];
      systemd.user.startServices = "sd-switch";

      # Keep pre-26.05 behavior and silence the Home Manager transition warning.
      programs.zsh.dotDir = config.home.homeDirectory;
    };
  };

  den.default.includes = [
    # Enable home-manager on all hosts.
    <den/home-manager>

    <den/define-user>

    # Automatically create the user on host.
    <den/primary-user>

    # Autoset hostname
    <lib/define-hostname>
  ];
}
