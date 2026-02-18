{
  den.aspects.system._.podman.nixos = {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      autoPrune.enable = true;
    };
    virtualisation.oci-containers.backend = "podman";
  };
}
