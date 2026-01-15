{ lib, config, pkgs, ... }: {

  options = {
    searxng_nixos.enable =
      lib.mkEnableOption "Enables SearXNG with NixOS modules";
  };

  config = lib.mkIf config.searxng_nixos.enable {

    environment.systemPackages = with pkgs; [
      searxng
      uwsgi
      nginx
    ];

    # SearXNG Service
    services.searx = {
      enable = true;
      redisCreateLocally = true;  # start a local Redis instance
      configureUwsgi = true;

      uwsgiConfig = {
        socket = "/run/searx/searxng.sock";
        chmod-socket = "660";  # nginx can access it
        processes = 1;
        threads = 2;
      };

      settings = {
        general = {
          debug = false;
          instance_name = "Private SearXNG";
          donation_url = false;
          contact_url = false;
          privacypolicy_url = false;
          enable_metrics = false;
        };

        server = {
          bind_address = "127.0.0.1";
          port = 8080;          # fallback HTTP if needed
          secret_key = "CHANGE_THIS_TO_A_RANDOM_SECRET";
          limiter = true;
          public_instance = false;
        };

        ui = {
          default_theme = "simple";
        };

        search = {
          method = "GET";
          safe_search = 0;
        };

        engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
          "duckduckgo".disabled = false;
        };

        outgoing = {
          request_timeout = 5.0;
          max_request_timeout = 10.0;
        };

        enabled_plugins = [
          "https_rewrite"
        ];
      };
    };

    # Nginx Reverse Proxy
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;

      virtualHosts."search.localhost" = {
        locations."/" = {
          extraConfig = ''
            include ${pkgs.nginx}/conf/uwsgi_params;
            uwsgi_pass unix:${config.services.searx.uwsgiConfig.socket};
          '';
        };
      };
    };

    # Systemd overrides to allow nginx access to home/runtime directories
    systemd.services.nginx = {
      serviceConfig = {
        ProtectHome = false;
        SuppllementaryGroups = [ "searx" ];
      };

      wants = [ "uwsgi.service" ];
    };

    # User management
    users.groups.searx.members = ["nginx"];

    # Make sure local hostname resolves
    networking.hosts = {
      "127.0.0.1" = [ "search.localhost" ];
    };
  };
}
