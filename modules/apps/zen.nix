{inputs, ...}: {
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
      home.sessionVariables.BROWSER = "zen";
    };
  };
}
