# Maker Hub Kiosks

Web-pages that are displayed on the screens in the Maker Hub.

## Deployment Instructions

1. Complete the installation and configuration of [chilipie-kiosk][1]
2. Switch to the console by pressing `Ctrl + Alt + F3`
3. Install `git`
```
sudo apt-get install git
```
4. Clone this repository to the device
```
git clone https://github.com/GeorgetownMakerHubOrg/lenstable
```
5. Initialize the `crontab`
```
crontab /home/pi/lenstable/cron/crontab
```
6. Switch back to the browser by pressing `Ctrl + Alt + F1`


## Controlling Chrome

- To focus the navigation bar, press `F11`, and then `Ctrl + L`

[1]: https://github.com/futurice/chilipie-kiosk
