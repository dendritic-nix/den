{
  den.aspects.system._.wsl =
    { inputs, ... }:
    {
      nixos = {
        imports = with inputs; [ inputs.nixos-wsl.nixosModules.wsl ];

        wsl = {
          enable = true;
          defaultUser = "chianyung";
          docker-desktop.enable = true;
        };
      };
    };
}
