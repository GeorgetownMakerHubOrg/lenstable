#!/bin/sh
sed -i 's/"exited_cleanly":[ ]*false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
sed -i 's/"exit_type":[ ]*"Crashed"/"exit_type":"None"/' ~/.config/chromium/Default/Preferences
