{
  den.aspects.shell._.tmux.homeManager = {
    programs.tmux.enable = true;
    xdg.configFile."tmux/tmux.conf".source = ../../dots/config/tmux/tmux.conf;
  };
}
