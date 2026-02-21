{
  __findFile,
  inputs,
  ...
}: {
  den.aspects.secrets._.sops = {
    nixos = {pkgs, ...}: {
      imports = [inputs.sops-nix.nixosModules.sops];

      environment.systemPackages = with pkgs; [
        sops
        age
        age-plugin-yubikey
        yubikey-manager # optional but handy (ykman)
        yubico-piv-tool # optional but handy (PIV debugging)
        pcsclite
      ];
      services.pcscd.enable = true;

      # Point ke identity file YubiKey (system-wide, sama di macOS & NixOS)
      sops.age.keyFile = "/etc/sops/age/yubikey-identity.txt";

      # (Opsional tapi umum) default file sops untuk host ini
      # Bisa kamu override per-secret juga.
      sops.defaultSopsFile = ../../secrets/secrets.yaml;
    };

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

      # Point ke identity file YubiKey (system-wide, sama di macOS & NixOS)
      sops.age.keyFile = "/etc/sops/age/yubikey-identity.txt";

      # (Opsional tapi umum) default file sops untuk host ini
      # Bisa kamu override per-secret juga.
      sops.defaultSopsFile = ../../secrets/secrets.yaml;
    };
  };
}
