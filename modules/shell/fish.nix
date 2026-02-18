{
  den.aspects.shell._.fish.homeManager = {pkgs, ...}: {
    programs = {
      command-not-found.enable = false;
      nix-index-database.comma.enable = true;

      fish = {
        enable = true;
        interactiveShellInit = ''
          ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
        '';
      };
    };
  };
}
