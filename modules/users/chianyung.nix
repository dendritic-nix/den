{__findFile, ...}: {
  den.homes.x86_64-linux.chianyung = {};

  den.aspects.chianyung = {
    includes = [
      <shell/nix-tools>
      <shell/utils>
      <shell/packages>
      <shell/nh>
      <shell/env>
      <shell/xdg>

      <shell/_1password>
      <shell/bash>
      <shell/fish>
      <shell/git/chianyungcode>
      # <shell/kanata>
      <shell/lazygit>
      <shell/neovim>
      <shell/starship>
      <shell/tailscale>
      <shell/tmux>
      <shell/yazi>
    ];

    nixos = {
      pkgs,
      lib,
      ...
    }: {
      users.users.chianyung = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "uinput"
        ];
        hashedPassword = "$6$PtkXxfcmi3/Rb9yo$gm83y9wybcTDqXCKGbji0irKhNLfjCx9NiMtqA7p2734eSUVcPrK3lbv4tlGRAc7n8XPyW9jcl9fmOZpQc0Mt0";
        shell = lib.getExe pkgs.fish;

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAr35LjSF5Av8xcsrswXznvBwt4CNDhtD97IqZp0H4/n"
        ];
      };
    };
  };
}
