-- Require the original file (adjust the path as necessary)
BWOEvents = BWOEvents or {}

-- Save the original function so you can still use it if necessary
-- local originalStartDay = BWOEvents.StartDay

-- Override the function with your modified version
BWOEvents.StartDay = function(params)
    local player = getSpecificPlayer(0)
    player:playSound("ZSDayStart")

    -- Update texture path to include language-specific suffix
    BWOTex.tex = getTexture("media/textures/day_" .. params.day .. "_" .. getCore():getOptionLanguageName() .. ".png")
    BWOTex.speed = 0.011
    BWOTex.mode = "center"
    BWOTex.alpha = 2.4
end
