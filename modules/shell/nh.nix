{
  den.aspects.shell._.nh.homeManager =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        nh
        nix-output-monitor
        nix-fast-build
        nix-tree
        nvd
        nix-diff
      ];

      programs.nh = {
        enable = true;
        osFlake = "${config.home.homeDirectory}/den";
      };
    };
}
