{
  den.aspects.shell._.neovim.homeManager = {pkgs, ...}: {
    programs.neovim = {
      enable = true;

      plugins = with pkgs.vimPlugins; [
        (nvim-treesitter.withAllGrammars)
      ];
    };
  };
}
