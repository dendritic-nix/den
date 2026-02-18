{
  inputs,
  den,
  ...
}: {
  # imports = [ (inputs.den.namespace "eg" true) ];
  _module.args.__findFile = den.lib.__findFile;

  systems = builtins.attrNames den.hosts;
  imports = [inputs.den.flakeModule];
}
