{ pkgs ? import <nixpkgs> { } }:

let
  waybar-scripts = ./..;
  waybarConfig = pkgs.writeTextFile {
    name = "config";
    destination = "/etc/xdg/waybar/config";
    text = builtins.toJSON {
      height = 32;
      modules-center = [ "custom/mpris-track-info" ];
      "custom/mpris-track-info" = {
        exec =
          "SEPARATOR=' — ' ${waybar-scripts}/mpris-track-info-tail/mpris-track-info-tail.bash";
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
    exec waybar -c ${waybarConfig}/etc/xdg/waybar/config -s /dev/null
  '';
}
