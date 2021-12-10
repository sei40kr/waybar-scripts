# protonvpn-status

Show the status of ProtonVPN.

## Dependencies

- `protonvpn`
- `bash`
- `awk`

## Module

### Icon + Text

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

### Icon Only

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

| State          | Output    | Tooltip              |
| :------------- | :-------- | :------------------- |
| `disconnected` | (nothing) | `Disconnected`       |
| `connected`    | `🛡 JP#01` | `Connected to JP#01` |
