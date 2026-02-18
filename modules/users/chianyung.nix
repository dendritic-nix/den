{
  __findFile,
  ...
}:
{
  den.homes.x86_64-linux.chianyung = { };

  den.aspects.chianyung = {
    includes = [
      <shell/distrobox>
      # <shell/git>
      <shell/nh>
      <shell/nix-tools>
      <shell/utils>
      <shell/packages>
      <shell/aliases>
      <shell/fish>
      <shell/nushell>
      <shell/yazi>
      <shell/env>

      <shell/_1password>
      <shell/bash>
      <shell/fish>
      <shell/git>
      # <shell/kanata>
      <shell/lazygit>
      <shell/neovim>
      <shell/starship>
      <shell/tailscale>
      <shell/tmux>
    ];

    nixos =
      { pkgs, lib, ... }:
      {
        users.users.chianyung = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
            "uinput"
          ];
          hashedPassword = "$6$5LmYUUbAfFd.ru3K$aCWG8.Vw2WXtkiWFav/Z/Vu44x65oRb5TU41s.QG3nrFrACCPovyRdFuqIixo0hPAbAVY9cgr36gu6l4Kvtqt0";
          shell = lib.getExe pkgs.fish;

          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAr35LjSF5Av8xcsrswXznvBwt4CNDhtD97IqZp0H4/n"
          ];

        };
      };
  };
}
