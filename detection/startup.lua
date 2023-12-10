local webhookURL = "your-discord-webhook-url"

-- Function to send a Discord message in embed mode with an avatar
local function sendDiscordEmbedMessageWithAvatar(title, description, color, avatarURL)
    local embed = {
        title = title,
        description = description,
        color = color
    }

    local payload = {
        content = "",
        embeds = {embed},
        avatar_url = avatarURL  -- Add the avatar URL here
    }

    http.post(webhookURL, textutils.serializeJSON(payload), {["Content-Type"] = "application/json"})
end

-- Function to get and display GPS coordinates
local function printGPSCoordinates()
    local x, y, z = gps.locate()

    if x and y and z then
        return "GPS Coordinates: X=" .. x .. ", Y=" .. y .. ", Z=" .. z
    else
        return "GPS Coordinates unavailable"
    end
end

-- Function to check all sides for a redstone signal
local function checkRedstoneSignal()
    local sides = {"top", "bottom", "front", "back", "left", "right"}

    for _, side in ipairs(sides) do
        if rs.getInput(side) then
            return true  -- If a signal is detected, return true and exit the function
        end
    end

    return false  -- If no signal is detected on any side
end

-- Check for the redstone signal and send the message if activated
while true do
    if checkRedstoneSignal() then
        -- Send Discord message in embed mode with GPS coordinates and avatar
        local title = "Redstone Detection"
        local description = "A redstone signal has been detected!\n" .. printGPSCoordinates()
        local color = 0xFF0000  -- Red color
        local avatarURL = "https://media.energetic.pw/pm5sfo-82l.jpg"  -- Replace with your avatar URL

        sendDiscordEmbedMessageWithAvatar(title, description, color, avatarURL)
        
        os.sleep(5)  -- Wait for a few seconds to avoid multiple message sends while the signal is active
    end
    os.sleep(1)  -- Wait for one second before checking again
end
