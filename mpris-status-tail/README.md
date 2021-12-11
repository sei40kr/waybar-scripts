# mpris-status-tail

Just show the current status of MPRIS.

## Dependencies

- `bash`
- `playerctl`

## Module

```json
{
  "custom/mpris-previous": {
    "exec": "/path/to/waybar-scripts/mpris-status-tail/mpris-status-tail.sh",
    "return-type": "json",
    "format": "{icon}",
    "format-icons": {
      "stopped": "",
      "playing": "⏮",
      "paused": "⏮"
    },
    "on-click": "playerctl previous"
  },
  "custom/mpris-play-pause": {
    "exec": "/path/to/waybar-scripts/mpris-status-tail/mpris-status-tail.sh",
    "return-type": "json",
    "format": "{icon}",
    "format-icons": {
      "stopped": "",
      "playing": "⏸",
      "paused": "▶"
    },
    "on-click": "playerctl play-pause"
  },
  "custom/mpris-next": {
    "exec": "/path/to/waybar-scripts/mpris-status-tail/mpris-status-tail.sh",
    "return-type": "json",
    "format": "{icon}",
    "format-icons": {
      "stopped": "",
      "playing": "⏭",
      "paused": "⏭"
    },
    "on-click": "playerctl next"
  }
}
```

## Example

| State     | Text      |
| :-------- | :-------- |
| `stopped` | (nothing) |
| `playing` | `⏮⏸⏭`     |
| `paused`  | `⏮▶⏭`     |
