# fcitx5-status

Show the status of Fcitx 5.

## Dependencies

- `fcitx5-remote`
- `bash`

## Module

```json
{
  "custom/fcitx5-status": {
    "exec": "/path/to/waybar-scripts/fcitx5-status/fcitx5-status.bash",
    "return-type": "json",
    "interval": 1,
    "tooltip": false
  }
}
```

## Example

| State      | Text      |
| :--------- | :-------- |
| `close`    | (nothing) |
| `inactive` | `Aa`      |
| `active`   | `あ`      |
