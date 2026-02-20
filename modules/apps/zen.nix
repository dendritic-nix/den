{
  inputs,
  pkgs,
  ...
}: {
  den.aspects.apps._.zen = {
    nixos = {
      environment.etc = {
        "1password/custom_allowed_browsers" = {
          text = ''
            zen
          ''; # or just "zen" if you use unwrapped package
          mode = "0755";
        };
      };
    };
    homeManager = {
      imports = [inputs.zen-browser.homeModules.default];
      programs.zen-browser.enable = true;
      programs.zen-browser.suppressXdgMigrationWarning = true;
      programs.zen-browser.darwinDefaultsId = pkgs.lib.mkIf pkgs.stdenv.isDarwin "org.mozilla.firefox.plist";
      home.sessionVariables.BROWSER = "zen";
      programs.zen-browser.profiles."*".search = {
        force = true; # Needed for nix to overwrite search settings on rebuild
        default = "ddg"; # Aliased to duckduckgo, see other aliases in the link above
        engines = {
          # My NixOS Option and package search shortcut
          mynixos = {
            name = "My NixOS";
            urls = [
              {
                template = "https://mynixos.com/search?q={searchTerms}";
                params = [
                  {
                    name = "query";
                    value = "searchTerms";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@nx"]; # Keep in mind that aliases defined here only work if they start with "@"
          };
        };
      };
    };
  };
}
