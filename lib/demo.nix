{ pkgs }:

{
  mkDemo = { config, style ? "" }:
    let
      configJson = pkgs.writeTextFile {
        name = "waybar-config";
        destination = "/etc/xdg/waybar/config";
        text = builtins.toJSON ({ height = 48; } // config);
      };
      styleCss = pkgs.writeTextFile {
        name = "waybar-style";
        destination = "/etc/xdg/waybar/style.css";
        text = ''
          window#waybar {
            background: #000;
            color: #fff;
            font: 11pt sans-serif;
          }

          ${style}
        '';
      };
    in pkgs.writeShellScriptBin "waybar-start" ''
      ${pkgs.waybar}/bin/waybar -c ${configJson}/etc/xdg/waybar/config \
        -s ${styleCss}/etc/xdg/waybar/style.css
    '';
}
