{
  __findFile,
  inputs,
  ...
}: {
  den.aspects.secrets._.sops = {
    darwin = {pkgs, ...}: {
      imports = [inputs.sops-nix.darwinModules.sops];

      environment.systemPackages = with pkgs; [
        sops
        age
        age-plugin-yubikey
        yubikey-manager # optional but handy (ykman)
        yubico-piv-tool # optional but handy (PIV debugging)
        pcsclite
      ];
    };
  };
}
