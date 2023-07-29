-- Configurations
local watermarkText = "QB-CORE"  -- Replace with your desired text watermark
local opacity = 200             -- You can adjust the opacity (0-255) of the text watermark here

-- Screen resolution (modify these values to fit your desired screen position)
local screenWidth = 1920
local screenHeight = 1080

-- Font settings
local font = 4  -- See available fonts at https://docs.fivem.net/docs/game-references/fonts/
local fontSize = 36

-- Calculate watermark position
local textWidth = GetTextWidth(watermarkText, font, fontSize)
local watermarkX = screenWidth - textWidth - 10
local watermarkY = screenHeight - fontSize - 10

-- Main loop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Draw the watermark text on the screen
        SetTextFont(font)
        SetTextScale(0.0, fontSize / 1000)
        SetTextColour(255, 255, 255, opacity)
        SetTextEntry("STRING")
        AddTextComponentString(watermarkText)
        DrawText(watermarkX, watermarkY)
    end
end)
