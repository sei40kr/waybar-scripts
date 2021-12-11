{ pkgs ? import <nixpkgs> { } }:

let
  demoLib = import ../lib/demo.nix { inherit pkgs; };
  waybar-scripts = ./..;
  waybar-start = demoLib.mkDemo {
    config = {
      modules-center =
        [ "custom/protonvpn-status" "custom/protonvpn-status-icon" ];
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
      "custom/protonvpn-status-icon" = {
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
      #custom-protonvpn-status-icon {
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
