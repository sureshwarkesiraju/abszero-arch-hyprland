#!/usr/bin/env python3
import json, subprocess

def run(cmd):
    try:
        return subprocess.check_output(cmd, shell=True, stderr=subprocess.DEVNULL).decode().strip()
    except:
        return ""

status = run("playerctl status 2>/dev/null")

if status.lower() in ["", "stopped"]:
    out = {"icon": "🎜", "text": ""}
else:
    artist = run("playerctl metadata xesam:artist") or ""
    title  = run("playerctl metadata xesam:title") or ""
    player = run("playerctl -l | head -1").lower()
    icon = "" if "spotify" in player else "🎜"
    out = {"icon": icon, "text": f"{artist} - {title}"}

print(json.dumps(out))

