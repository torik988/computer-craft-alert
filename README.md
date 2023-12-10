# Redstone Discord Notifier

## Overview

This Lua script is designed to detect a redstone signal in Minecraft and notify a Discord channel using a webhook. It sends a message in embed mode, including GPS coordinates and an avatar.

## Prerequisites

Before using this script, make sure you have the following:

- ComputerCraft or CC: Tweaked installed in your Minecraft world.
- A Discord webhook URL for the channel where you want to receive notifications.

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
