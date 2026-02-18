{
  den.aspects.shell._.kanata = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ kanata-with-cmd ];
        systemd.services.kanata = {
          description = "Kanata Keyboard Remapper";
          wantedBy = [ "multi-user.target" ];
          after = [ "systemd-udevd.service" ];

          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.kanata}/bin/kanata -c /home/chianyung/.config/kanata/row.kbd";
            Restart = "always";
          };
        };
      };
    darwin = { };
    homeManager = {
      xdg.configFile."kanata/row.kbd".source = ../../dots/config/kanata/row.kbd;
    };
    includes = [ ];
  };
}
