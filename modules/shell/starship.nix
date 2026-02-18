{
  den.aspects.shell._.starship.homeManager = {
    programs.starship = {
      enable = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        add_newline = true;

        format = ''
          $hostname\
          $directory\
          $git_branch\
          $git_state\
          $git_status\
          $git_metrics\
          $nodejs\
          $bun\
          $fill\
          $cmd_duration $jobs $time\
          $line_break\
          $character
        '';

        character = {
          error_symbol = "[➜](bold red)";
          success_symbol = "[➜](bold green)";
        };

        time = {
          disabled = false;
          format = "[$time]($style) ";
          style = "bold gray";
          time_format = "%T";
          use_12hr = false;
          utc_time_offset = "+7";
        };

        fill.symbol = " ";

        jobs = {
          format = "[$symbol]($style)";
          number_threshold = 1;
          style = "bold red";
          symbol = "";
        };

        git_state = {
          format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
          style = "bright-black";
        };

        git_metrics.disabled = false;

        cmd_duration = {
          format = "[$duration]($style)";
          style = "yellow";
        };

        custom.stunnel = {
          command = "ps -o etime= -p $(ps aux | grep stunnel | grep -v grep | awk '{print $2}')";
          format = "[TUNNEL OPEN for $output]($style)";
          style = "red";
          when = "ps aux | grep stunnel | grep -v grep";
        };

        package = {
          disabled = true;
          symbol = "󰏗 ";
        };

        aws.symbol = "  ";
        buf.symbol = " ";
        c.symbol = " ";
        conda.symbol = " ";
        crystal.symbol = " ";
        dart.symbol = " ";
        directory.read_only = " 󰌾";
        docker_context.symbol = " ";
        elixir.symbol = " ";
        elm.symbol = " ";
        fennel.symbol = " ";
        fossil_branch.symbol = " ";
        git_branch.symbol = " ";
        golang.symbol = " ";
        guix_shell.symbol = " ";
        haskell.symbol = " ";
        haxe.symbol = " ";
        hg_branch.symbol = " ";

        hostname = {
          disabled = false;
          format = "[$ssh_symbol](bold blue) on [$hostname](bold red) ";
          ssh_only = true;
          ssh_symbol = "🌏 ";
        };

        java.symbol = " ";
        julia.symbol = " ";
        kotlin.symbol = " ";
        lua.symbol = " ";
        memory_usage.symbol = "󰍛 ";
        meson.symbol = "󰔷 ";
        nim.symbol = "󰆥 ";
        nix_shell.symbol = " ";
        nodejs.symbol = " ";
        bun.format = "via [🍔 $version](bold green) ";
        ocaml.symbol = " ";

        os.symbols = {
          AlmaLinux = " ";
          Alpaquita = " ";
          Alpine = " ";
          Amazon = " ";
          Android = " ";
          Arch = " ";
          Artix = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = "󰛓 ";
          Gentoo = " ";
          HardenedBSD = "󰞌 ";
          Illumos = "󰈸 ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          OpenBSD = "󰈺 ";
          OracleLinux = "󰌷 ";
          Pop = " ";
          Raspbian = " ";
          RedHatEnterprise = " ";
          Redhat = " ";
          Redox = "󰀘 ";
          RockyLinux = " ";
          SUSE = " ";
          Solus = "󰠳 ";
          Ubuntu = " ";
          Unknown = " ";
          Void = " ";
          Windows = "󰍲 ";
          openSUSE = " ";
        };

        perl.symbol = " ";
        php.symbol = " ";
        pijul_channel.symbol = " ";
        python.symbol = " ";
        rlang.symbol = "󰟔 ";
        ruby.symbol = " ";
        rust.symbol = " ";
        scala.symbol = " ";
        swift.symbol = " ";
        zig.symbol = " ";
      };
    };
  };
}
