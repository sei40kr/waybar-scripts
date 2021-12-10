{ pkgs ? import <nixpkgs> { } }:

let
  waybar-scripts = ./..;
  waybarConfig = pkgs.writeTextFile {
    name = "config";
    destination = "/etc/xdg/waybar/config";
    text = builtins.toJSON {
      height = 32;
      modules-center = [ "custom/protonvpn-status" ];
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
    };
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [ waybar protonvpn-cli ];
  shellHook = ''
    exec waybar -c ${waybarConfig}/etc/xdg/waybar/config -s /dev/null
  '';
}
