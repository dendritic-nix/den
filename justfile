rebuild host:
    nh os switch . -H {{ host }}

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

disko-install host disk target flake='.':
    sudo nix --extra-experimental-features "nix-command flakes" run 'github:nix-community/disko/latest#disko-install' -- --flake '{{ flake }}#{{ host }}' --disk {{ disk }} {{ target }}

disko-install-remount host flake='.' rw_store_size='20G':
    sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount --flake '{{ flake }}#{{ host }}'
    sudo mount -o remount,size={{ rw_store_size }},noatime /nix/.rw-store
    sudo nixos-install --flake '{{ flake }}#{{ host }}'
