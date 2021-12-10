# mpris-track-info-tail

Show the current track of MPRIS.

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

## Example

| State     | Output             |
|:----------|:-------------------|
| `stopped` | (nothing)          |
| `playing` | `▶ Title — Artist` |
| `paused`  | `⏸ Title — Artist` |
