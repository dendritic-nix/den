{
  den.aspects.shell._.lazygit.homeManager = {
    programs.lazygit = {
      enableFishIntegration = true;
      settings = {
        git = {
          pagers = {
            pager = "delta --dark --paging=never";
          };
        };
      };
    };
  };
}
