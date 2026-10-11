local Creator = loadstring(game:HttpGet(
    "https://pastebin.com/raw/0fSnvfGt"
))()

local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

-- Damper model: use the direct GitHub raw file URL
local DamperModel =
    "https://raw.githubusercontent.com/Ilikerobloxdoors/Damper/main/Damper.rbxm"

-- Matcher Spawn Effect (NO SOUND)
local function MatcherSpawnEffect()
    local colorCorrection =
        Lighting:FindFirstChild("MainColorCorrection")

    if not colorCorrection then
        warn("MainColorCorrection was not found in Lighting")
        return
    end

    colorCorrection.TintColor = Color3.fromRGB(212, 255, 0)
    colorCorrection.Contrast = 0.3

    TweenService:Create(
        colorCorrection,
        TweenInfo.new(0.5),
        {
            TintColor = Color3.fromRGB(255, 255, 255),
            Contrast = 0,
        }
    ):Play()
end

-- Create Damper
local entity = Creator.createEntity({
    CustomName = "Damper",

    Model = DamperModel,

    Speed = 450,
    DelayTime = 3.75,
    HeightOffset = 0,

    CanKill = true,
    KillRange = 40,

    BreakLights = true,
    BackwardsMovement = true,

    FlickerLights = {
        true,
        1,
    },

    Cycles = {
        Min = 5,
        Max = 10,
        WaitTime = 0.05,
    },

    CamShake = {
        true,
        {13, 15, 0.1, 1},
        100,
    },

    Jumpscare = {
        true,
        {
            Image1 = "rbxassetid://10888294219",
            Image2 = "rbxassetid://10888294219",

            Shake = true,

            Sound1 = {
                93093877629089,
                {Volume = 0.5},
            },

            Sound2 = {
                93093877629089,
                {Volume = 0.5},
            },

            Flashing = {
                true,
                Color3.fromRGB(255, 255, 255),
            },

            Tease = {
                false,
                Min = 4,
                Max = 4,
            },
        },
    },

    CustomDialog = {
        "You died to Damper...",
        "Damper caught you.",
    },
})

-- Advanced callbacks

entity.Debug.OnEntitySpawned = function(entityTable)
    print("Damper has spawned:", entityTable.Model)

    -- Play the visual spawn effect only; no spawn sound.
    MatcherSpawnEffect()
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("Damper has despawned:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("Damper has started moving:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("Damper has finished rebound:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Damper entered room:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("Player looked at Damper:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("Player has died to Damper.")
end

-- Run Damper
Creator.runEntity(entity)
