{
  den.aspects.system._.bluetooth.nixos =
    { pkgs, ... }:
    {
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
      services.blueman.enable = true;

      environment.systemPackages = with pkgs; [
        bluetui
        bluetuith
      ];
    };
}
