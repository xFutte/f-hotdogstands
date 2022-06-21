local QBCore = exports['qb-core']:GetCoreObject()

local prop = 'prop_hotdogstand_01'
local modelHash = GetHashKey(prop)

local function spawnHotdogStand(x, y, z)
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Citizen.Wait(1)
        end
    end

    CreateObject(modelHash, x, y, z, true)
end

local function hotdogComplete()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    TriggerServerEvent('f-hotdogstands:giveHotdog')

    QBCore.Functions.Notify("Hotdog made - enjoy!")
end

-- Cook a hotdog
local function cookHotdog()
    local cookTime = 10000

    TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})

    QBCore.Functions.Progressbar("cook_hotdog", "Making an awesome hotdog", cookTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {}, {}, {}, function() -- Done

        hotdogComplete()
    end, function() -- Cancel
        QBCore.Functions.Notify("Burned the sausage to charcoal!", "error")
    end)
end

-- Check if player has a hotdog sausage (no, not if the player is a male 😂)
local function checkForSausage()
    return QBCore.Functions.HasItem('hotdog_sausage')
end

-- Check if player has a hotdog bread
local function checkForBread()
    return QBCore.Functions.HasItem('hotdog_bread')
end

exports['qb-target']:AddTargetModel(prop, {
    options = {{
        label = 'Make hotdog',
        icon = 'fas fa-hotdog',
        action = function(entity)

            if IsPedAPlayer(entity) then
                return false
            end

            if checkForSausage() and checkForBread() then
                cookHotdog()
            else
                QBCore.Functions.Notify("Missing ingredients for making a hotdog", "error")
            end
        end
    }},
    distance = 1.5
})

-- Spawns at Legion Square opposite the garage
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    spawnHotdogStand(189.97, -860.56, 30.4)
end)
