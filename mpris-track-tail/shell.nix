{ pkgs ? import <nixpkgs> { } }:

let
  waybar-scripts = ./..;
  waybarConfig = pkgs.writeTextFile {
    name = "config";
    destination = "/etc/xdg/waybar/config";
    text = builtins.toJSON {
      height = 48;
      modules-center = [ "custom/mpris-track" ];
      "custom/mpris-track" = {
        exec = "${waybar-scripts}/mpris-track-tail/mpris-track-tail.bash";
        return-type = "json";
        format = "{icon}{}";
        format-icons = {
          stopped = "";
          playing = "▶ ";
          paused = "⏸ ";
        };
        tooltip = false;
        escape = true;
      };
    };
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [ waybar bash playerctl ];
  shellHook = ''
    exec waybar -c ${waybarConfig}/etc/xdg/waybar/config
  '';
}
