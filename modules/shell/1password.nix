{
  den.aspects.shell._._1password = {
    nixos = {
      programs._1password.enable = true;
      programs._1password-gui = {
        enable = true;
        # Certain features, including CLI integration and system authentication support,
        # require enabling PolKit integration on some desktop environments (e.g. Plasma).
        polkitPolicyOwners = ["chianyung"];
      };
    };
    homeManager = {
      pkgs,
      lib,
      ...
    }: {
      xdg.configFile."1Password/ssh/agent.toml".source = ../../dots/config/1Password/ssh/agent.toml;
      programs.ssh = {
        enable = true;
        extraConfig =
          if pkgs.stdenv.hostPlatform.isDarwin
          then ''
            IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
          ''
          else if pkgs.stdenv.hostPlatform.isLinux
          then ''
            IdentityAgent "~/.1password/agent.sock"
          ''
          else "";
      };
    };
  };
}
