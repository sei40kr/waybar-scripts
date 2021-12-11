{ pkgs ? import <nixpkgs> { } }:

let
  waybar-scripts = ./..;
  waybarConfig = pkgs.writeTextFile {
    name = "config";
    destination = "/etc/xdg/waybar/config";
    text = builtins.toJSON {
      height = 32;
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
  buildInputs = with pkgs; [ waybar playerctl ];
  shellHook = ''
    exec waybar -c ${waybarConfig}/etc/xdg/waybar/config -s /dev/null
  '';
}
