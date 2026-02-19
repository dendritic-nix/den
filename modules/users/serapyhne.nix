{ __findFile, constants, ... }:
{
  den.homes.x86_64-linux.${constants.user_seraphyne} = { };

  den.aspects.seraphyne = {
    includes = [
      # Automatically set default shell
      (<den/user-shell> "zsh")

      <shell/nix-tools>
      <shell/utils>
      <shell/packages>
      <shell/nh>
      <shell/env>

      <shell/_1password>
      <shell/bash>
      <shell/fish>
      <shell/git/seraphyne>
      <shell/lazygit>
      <shell/neovim>
      <shell/starship>
      <shell/tmux>

      <services/tailscale>
      <services/kanata>
    ];

    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        users.users.${constants.user_seraphyne} = {
          extraGroups = [
            "uinput"
          ];

          hashedPassword = "$6$PtkXxfcmi3/Rb9yo$gm83y9wybcTDqXCKGbji0irKhNLfjCx9NiMtqA7p2734eSUVcPrK3lbv4tlGRAc7n8XPyW9jcl9fmOZpQc0Mt0";
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAr35LjSF5Av8xcsrswXznvBwt4CNDhtD97IqZp0H4/n"
          ];
        };
      };
  };
}
