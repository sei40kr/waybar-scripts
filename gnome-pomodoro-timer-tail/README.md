# gnome-pomodoro-timer-tail

Show the timer of GNOME Pomodoro.

## Dependencies

- [A Pomodoro Timer for GNOME](https://gnomepomodoro.org)
- `bash`
- `jq`
- `dconf`
- `busctl`

## Module

```json
{
  "custom/gnome-pomodoro-timer": {
    "exec": "/path/to/waybar-scripts/gnome-pomodoro-timer-tail/gnome-pomodoro-timer-tail.bash",
    "return-type": "json",
    "format": "{icon}{}",
    "format-icons": {
      "null": "",
      "pomodoro": "🕓 ",
      "short-break": "☕ ",
      "long-break": "☕ ",
      "paused": "⏸ "
    },
    "tooltip": false
  }
}
```

## Example

| State         | Output     |
| :------------ | :--------- |
| `null`        | (nothing)  |
| `pomodoro`    | `🕓 25:00` |
| `short-break` | `☕ 5:00`  |
| `long-break`  | `☕ 15:00` |
| `paused`      | `⏸ 25:00`  |
