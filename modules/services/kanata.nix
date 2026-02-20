{
  den.aspects.services._.kanata = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [kanata-with-cmd];
      environment.etc."kanata/row.kbd".source = ../../dots/config/kanata/row.kbd;

      systemd.services.kanata = {
        description = "Kanata Keyboard Remapper";
        wantedBy = ["multi-user.target"];
        after = ["systemd-udevd.service"];

        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.kanata-with-cmd}/bin/kanata -c /etc/kanata/row.kbd";
          Restart = "always";
        };
      };
    };
    darwin = {};
    homeManager = {};
    includes = [];
  };
}
