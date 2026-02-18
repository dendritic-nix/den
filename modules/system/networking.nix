{
  den.aspects.system._.networking = {
    networking = {
      networkmanager.enable = true;
      wireless.enable = false;
      nameservers = [
        "1.1.1.1" # Cloudflare
        "8.8.8.8" # Google
      ];
    };
  };
}
