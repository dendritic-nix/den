{
  den.aspects.system._.audio.nixos =
    {
      pkgs,
      ...
    }:
    {
      services.pipewire = {
        enable = true;
        audio.enable = true;
        pulse.enable = true;
        jack.enable = true;
      };

      environment.systemPackages = with pkgs; [
        pavucontrol # PulseAudio volume control
        playerctl # Media player control
        pulseaudio # For pactl command
      ];
    };
}
