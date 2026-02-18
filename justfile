rebuild host:
    nh os switch .#{{ host }}

up:
    nix flake update

upp target:
    nix flake update {{ target }}

repl:
    nh os repl

clean:
    sudo nix-collect-garbage -d

check:
    nix flake check

fmt:
    alejandra .

anywhere host target:
    nix run github:nix-community/nixos-anywhere -- --flake {{ host }} --host-target {{ target }}

disko-install host disk target:
    sudo nix --extra-experimental-features "nix-command flakes" run 'github:nix-community/disko/latest#disko-install' -- --flake .#{{ host }} --disk {{ disk }} {{ target }}
