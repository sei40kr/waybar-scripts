# protonvpn-status

Show the status of ProtonVPN.

## Dependencies

- `protonvpn`
- `bash`
- `awk`

## Module

```json
{
  "custom/protonvpn-status": {
    "exec": "/path/to/waybar-scripts/protonvpn-status/protonvpn-status.bash",
    "return-type": "json",
    "interval": 5,
    "format": "{icon}{}",
    "format-icons": {
      "disconnected": "",
      "connected": "🛡 "
    },
    "tooltip": false,
    "escape": true
  }
}
```

## Example

| State          | Output    |
| :------------- | :-------- |
| `disconnected` | (nothing) |
| `connected`    | `🛡 JP#01` |
