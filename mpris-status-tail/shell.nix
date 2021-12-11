{ pkgs ? import <nixpkgs> { } }:

let
  demoLib = import ../lib/demo.nix { inherit pkgs; };
  waybar-scripts = ./..;
  waybar-start = demoLib.mkDemo {
    config = {
      modules-center = [
        "custom/mpris-previous"
        "custom/mpris-play-pause"
        "custom/mpris-next"
      ];
      "custom/mpris-previous" = {
        exec = "${waybar-scripts}/mpris-status-tail/mpris-status-tail.bash";
        return-type = "json";
        format = "{icon}";
        format-icons = {
          stopped = "";
          playing = "⏮";
          paused = "⏮";
        };
        tooltip = false;
        on-click = "playerctl previous";
      };
      "custom/mpris-play-pause" = {
        exec = "${waybar-scripts}/mpris-status-tail/mpris-status-tail.bash";
        return-type = "json";
        format = "{icon}";
        format-icons = {
          stopped = "";
          playing = "⏸";
          paused = "▶";
        };
        tooltip = false;
        on-click = "playerctl play-pause";
      };
      "custom/mpris-next" = {
        exec = "${waybar-scripts}/mpris-status-tail/mpris-status-tail.bash";
        return-type = "json";
        format = "{icon}";
        format-icons = {
          stopped = "";
          playing = "⏭";
          paused = "⏭";
        };
        tooltip = false;
        on-click = "playerctl next";
      };
    };
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [ playerctl ];
  shellHook = ''
    exec ${waybar-start}/bin/waybar-start
  '';
}
