# mpris-track-info-tail

Show the information of current MPRIS track.

## Dependencies

- `bash`
- `playerctl`

## Module

```json
{
  "custom/mpris-track-info": {
    "exec": "SEPARATOR=' — ' /path/to/waybar-scripts/mpris-track-info-tail/mpris-track-info-tail.bash",
    "return-type": "json",
    "format": "{icon}{}",
    "format-icons": {
      "stopped": "",
      "playing": "▶ ",
      "paused": "⏸ "
    },
    "tooltip": false,
    "escape": true
  }
}
```

## Environment Variables

| Variable    | Text                                                                                                 |
| :---------- | :--------------------------------------------------------------------------------------------------- |
| `SEPARATOR` | A separator between the track title and the artist name. If omitted, the artist name won't be shown. |

## Example

| State     | Text               |
| :-------- | :----------------- |
| `stopped` | (nothing)          |
| `playing` | `▶ Title — Artist` |
| `paused`  | `⏸ Title — Artist` |
