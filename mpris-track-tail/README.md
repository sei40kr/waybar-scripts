# mpris-track-tail

Show the current track of MPRIS.

## Dependencies

- `bash`
- `playerctl`

## Module

```json
{
  "custom/mpris-track": {
    "exec": "/path/to/waybar-scripts/mpris-track-tail/mpris-track-tail.bash",
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

| State     | Output    |
| :-------- | :-------- |
| `stopped` | (nothing) |
| `playing` | `▶ Title` |
| `paused`  | `⏸ Title` |
