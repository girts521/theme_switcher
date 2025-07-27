# A simple theme switcher.

This is a small and simple script that I use to switch the theme of my desktop.
The script first selects a random image from a provided image folder. 
Then it uses pywal to generate a color scheme based on a random image.
I dont use pywal for my background images, instead I use th ewww daemon. Thus, the script adds arguments to skip setting image with pywal and does it with ewww.
A fdew things need to be reloaded to take effect, like hyprland and waybar, so thats the next step in the script. 

# Adittionally, a script that downloads images from a speciffic user collection on https://wallhaven.cc

Wallhaven provides a nice API that lets explore user settings, collections and other things. So, I am using its API to gather the urls of images added to a speciffic (hardcoded) collection. 
The images from those urls get downloaded to the folder. The script uses the id of the image to check if its already in the folder(thus not redownloading it but only pulling the new ones.)
This is useful to add to the theme switcher, since then its easy to get new images used in the theme.
