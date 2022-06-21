local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('f-hotdogstands:giveHotdog', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("hotdog", 1)
    Player.Functions.RemoveItem("hotdog_sausage", 1)
    Player.Functions.RemoveItem("hotdog_bread", 1)

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['hotdog'], "add")

    -- Waiting a bit here so the UI displayed the added & removed items nicely
    Wait(5000)

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['hotdog_sausage'], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['hotdog_bread'], "remove")
end)
