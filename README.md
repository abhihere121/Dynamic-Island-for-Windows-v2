# Dynamic Island for Windows

Invisible until you move the mouse to the top-centre edge of the screen, then a black pill springs open.

| Tab | What it does | How |
|---|---|---|
| Now | Music + controls, battery, next meeting | Windows media controls (Spotify, YouTube, etc.), Chromium battery API |
| Calendar | 7-day agenda, one-click **Join** for Meet/Zoom/Teams | Your calendar's `.ics` link (⚙ settings) |
| Alerts | WhatsApp, mail and other app notifications | Reads Windows' notification database, read-only |
| Clipboard | Last 3 copied texts/screenshots, drag out into any app | Clipboard polling; Win+Shift+S screenshots included |
| Notes | Auto-saved quick note | Local file |

## Easiest: double-click files
1. `setup.bat` (once)
2. `start.bat` to run
3. `autostart-on.bat` to start with Windows (`autostart-off.bat` to undo). Keep the folder where it is.

## Run from a terminal (on Windows)
```
npm install
npm start
```
Make an installer: `npm run dist`. Tray icon: click to pin open, right-click for menu.

## Notes
- Alerts only show notifications Windows actually displays: keep WhatsApp/Outlook notifications on and Focus Assist off.
- Clipboard text stays in memory; screenshots go to a temp folder that is cleared on quit.
- `npm test` runs service tests anywhere. UI preview without Electron: open `src/renderer/index.html` in a browser (uses mock data).

## Footprint
- Starts with Windows automatically (first launch turns it on; toggle in ⚙ settings or the tray menu). Use the installer from `npm run dist` for this to be permanent.
- While closed the window is hidden, so nothing renders. The only idle work is a cursor check every 90 ms, a clipboard check every 1 s, a notification-file stat every 3 s, and a calendar refresh every 10 min.
- JS heap is capped at 48 MB. GPU rendering stays on for smooth animation.

## Idle pill status
- Charging (`Charging 87%`) and low battery (below 20%) show in the pill; music shows animated bars.
- Claude Code: run `claude-hooks-on.bat` once (adds hooks to `~/.claude/settings.json`, backup saved), then start a new Claude Code session. The pill shows working / needs you / done. `claude-hooks-off.bat` removes them.

## Claude Code: approve and reply from the island
- `claude-hooks-on.bat`: status in the pill, plus **Allow / Deny** for permission prompts (the island pops open; ignore it for 25 s and Claude Code asks in the terminal as usual).
- `claude-reply-on.bat`: everything above, plus a ~9 s window after each turn where you can type a reply that Claude continues with. Run `claude-hooks-on.bat` again to go back to no waiting.
- `claude-hooks-off.bat` removes all of it. Start a new Claude Code session after changing hooks.

## Staying open
The island closes when the mouse leaves, except while a text field is focused (notes, reply, settings), a Claude request is waiting, something is being dragged, or it is pinned.

## Pill and notifications
- The idle pill takes turns showing what's going on: unread notifications, low battery / charging, and the current song (icon + title). While Claude Code is working it only shows that.
- Hovering while Claude is working opens a small "Claude is working" card with a timer; the chevron opens the full island.
- Alerts tab: filter by All / WhatsApp / Mail / Apps. If it stays empty, the placeholder text says why (for example, Windows notification history not found).

## Time tab, timers, weather, mute
- Clock tab: big clock and date, weather (Open-Meteo, no key; set a city in settings or leave blank to use an approximate location from your IP), quick timers (5/10/25 min or custom), and alarms (optional daily).
- A running timer or alarm shows in the idle pill; when one fires the island opens, beeps, and offers Snooze 5 min / Dismiss.
- Speaker button (top right of the island) mutes and unmutes the system volume; the pill shows "Muted" while muted.
- The idle pill cycles through: new notifications, low battery / charging, muted, next timer, current song, temperature, clock.

## Controls tab, Bluetooth, swiping
- Controls tab (sliders icon): volume slider + mute, brightness slider (laptop screens only; external monitors don't allow it), and your paired Bluetooth devices with battery %. Click a device to connect or disconnect it; `+` opens Windows Bluetooth settings to pair a new one.
- Connected Bluetooth devices (with battery) show in the idle pill rotation; red when battery is 15% or less.
- When music is playing and something else (Claude, Bluetooth...) is the main pill item, the album cover appears beside it.
- Inside the open island, drag sideways (or two-finger scroll sideways) to switch tabs.
