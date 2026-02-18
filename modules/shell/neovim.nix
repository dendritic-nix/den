{
  den.aspects.shell._.neovim.homeManager = {pkgs, ...}: {
    programs.neovim = {
      enable = false;

      plugins = with pkgs.vimPlugins; [
        (nvim-treesitter.withAllGrammars)
      ];
    };
  };
}
