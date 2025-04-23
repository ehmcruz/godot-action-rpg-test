# Action RPG Game using Godot

This is a simple test of a 2D action RPG game I am developing using Godot to learn the tool.

# Dependencies

I used Godot 4.4.1.

# Main Feature

- Simple quest system.

- Object oriented based programming.

- Avoided the pixel unit logic, the standard of Godot. Honestly it doesn't make sense that Godot basically tries to force the usage of pixels as the game distance unit. To avoid that, I used a custom distance unit in game logic, scale all sprites when loading so that they are measured in game logic distance units, and then I use a sub-viewport and camera to convert everything to pixels for rendering.

# Downloading assets

I don't like to store assets in GitHub.
So download them from my drive:

**https://drive.google.com/drive/folders/1nHD4zHC7VIxOMfqsrWcQIGVBdn8CEa_9?usp=sharing**

Just put the assets folder in project's root directory.
