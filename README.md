# Redstone Discord Notifier

## Overview

This Lua script is designed to detect a redstone signal in Minecraft and notify a Discord channel using a webhook. It sends a message in embed mode, including GPS coordinates and an avatar.

## Prerequisites

Before using this script, make sure you have the following:

- ComputerCraft or CC: Tweaked installed in your Minecraft world.
- A Discord webhook URL for the channel where you want to receive notifications.

## GPS Configuration

The script includes a function to obtain and display GPS coordinates in the Discord message.

To use the GPS functionality, follow these steps:

1. Set up three computers (computers A, B, and C) with an ender-modem attached to each.
2. Arrange them as shown in the [image](https://github.com/torik988/computer-craft-alert/assets/136936205/bc533f88-0fa1-40f1-aa72-b0bbc49c87ea).
   Upload the GPS/startup.lua script to each computer and specify the coordinates of each computer.

## Setup

1. Open the Lua script in your ComputerCraft computer.
2. Replace `"your-discord-webhook-url"` with your Discord webhook URL in the `webhookURL` variable.
3. Optionally, replace the `avatarURL` variable with the URL of your desired avatar.

## Usage

- The script continuously checks for a redstone signal.
- If a redstone signal is detected, it sends a Discord message with embed mode, displaying the GPS coordinates and the detection message.
- To avoid spam, it waits for a few seconds (configurable) before checking for the signal again.

```lua
-- Example Configuration
local webhookURL = "your-discord-webhook-url"
local avatarURL = "https://media.energetic.pw/pm5sfo-82l.jpg"

-- ... (rest of the configuration)

-- Example Usage
sendDiscordEmbedMessageWithAvatar("Redstone Detection", "A redstone signal has been detected!\n" .. printGPSCoordinates(), 0xFF0000, avatarURL)
