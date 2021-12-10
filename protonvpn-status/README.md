# protonvpn-status

Show the status of ProtonVPN.

## Dependencies

- `protonvpn`
- `bash`
- `awk`

## Module

### Icon and text

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

### Icon only

```json
{
  "custom/protonvpn-status-icon-only": {
    "exec": "/path/to/waybar-scripts/protonvpn-status/protonvpn-status.bash",
    "return-type": "json",
    "interval": 5,
    "format": "{icon}{}",
    "format-icons": {
      "disconnected": "",
      "connected": "🛡"
    },
    "escape": true
  }
}
```

### Example

| State          | Output    |
| :------------- | :-------- |
| `disconnected` | (nothing) |
| `connected`    | `🛡 JP#01` |
