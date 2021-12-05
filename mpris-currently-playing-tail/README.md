# mpris-currently-playing-tail

Show the current track of MPRIS.

## Dependencies

- `bash`
- `playerctl`

## Module

```json
{
  "custom/mpris-currently-playing": {
    "exec": "/path/to/waybar-scripts/mpris-currently-playing-tail/mpris-currently-playing-tail.bash",
    "return-type": "json",
    "format": "{icon}{}",
    "format-icons": {
      "stopped": "",
      "playing": "▶ ",
      "paused" = "⏸ "
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
