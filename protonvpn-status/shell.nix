{ pkgs ? import <nixpkgs> { } }:

let
  waybarLib = import ../lib/demo.nix { inherit pkgs; };
  waybar-scripts = ./..;
  waybar-start = waybarLib.mkDemo {
    config = {
      modules-center =
        [ "custom/protonvpn-status" "custom/protonvpn-status-icon-only" ];
      "custom/protonvpn-status" = {
        exec = "${waybar-scripts}/protonvpn-status/protonvpn-status.bash";
        return-type = "json";
        interval = 5;
        format = "{icon}{}";
        format-icons = {
          disconnected = "";
          connected = "🛡 ";
        };
        tooltip = false;
        escape = true;
      };
      "custom/protonvpn-status-icon-only" = {
        exec = "${waybar-scripts}/protonvpn-status/protonvpn-status.bash";
        return-type = "json";
        interval = 5;
        format = "{icon}";
        format-icons = {
          disconnected = "";
          connected = "🛡";
        };
        escape = true;
      };
    };
    style = ''
      #custom-protonvpn-status,
      #custom-protonvpn-status-icon-only {
        margin: 0 8px;
      }
    '';
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [ protonvpn-cli ];
  shellHook = ''
    exec ${waybar-start}/bin/waybar-start
  '';
}
