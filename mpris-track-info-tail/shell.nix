{ pkgs ? import <nixpkgs> { } }:

let
  demoLib = import ../lib/demo.nix { inherit pkgs; };
  waybar-scripts = ./..;
  waybar-start = demoLib.mkDemo {
    config = {
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
  buildInputs = with pkgs; [ bash playerctl ];
  shellHook = ''
    exec ${waybar-start}/bin/waybar-start
  '';
}
