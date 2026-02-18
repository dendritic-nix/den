{
  den.aspects.desktop._.sddm.nixos = {pkgs, ...}: let
    flavor = "mocha";
    accent = "lavender";
  in {
    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        accent = "lavender";
      })
    ];
    services.displayManager.sddm = {
      enable = true;
      extraPackages = [pkgs.sddm-astronaut];
      theme = "catppuccin-${flavor}-${accent}";
      # X11 greeter is more reliable across mixed GPU setups during initial bootstrap.
      wayland.enable = false;
    };
  };
}
