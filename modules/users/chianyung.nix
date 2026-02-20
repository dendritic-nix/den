{
  __findFile,
  constants,
  ...
}: {
  den.homes.x86_64-linux.${constants.user_one} = {};

  den.aspects.${constants.user_one} = {
    includes = [
      <shell/yazi>
    ];

    nixos = {
      pkgs,
      lib,
      ...
    }: {
      users.users.${constants.user_one} = {
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
