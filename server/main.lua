
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local ItemList = Config.SellItems


RegisterServerEvent("qb-blackmarket:server:sellItems")
AddEventHandler("qb-blackmarket:server:sellItems", function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], 'remove')
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "solgt ting i det sorte markede")
        TriggerClientEvent('QBCore:Notify', src, "Du har solgt dine ting.")
    end
end)

RegisterServerEvent("qb-blackmarket:server:buyItems")
AddEventHandler("qb-blackmarket:server:buyItems", function()
    local src = source
    local price = 5500
    local Player = QBCore.Functions.GetPlayer(src)
    --if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        --for k, v in pairs(Player.PlayerData.items) do 
            --if Player.PlayerData.items[k] ~= nil then 
                Player.Functions.AddItem('trojan_usb', 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["trojan_usb"], "add")
            --end
        --end
        Player.Functions.RemoveMoney("bank", price, "købt ting i det sorte markede")
        TriggerClientEvent('QBCore:Notify', src, "Du har købt et Trojan USB")
    --end
end)

RegisterServerEvent("qb-blackmarket:server:buy1Items")
AddEventHandler("qb-blackmarket:server:buy1Items", function()
    local src = source
    local price = 8500
    local Player = QBCore.Functions.GetPlayer(src)
    --if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        --for k, v in pairs(Player.PlayerData.items) do 
            --if Player.PlayerData.items[k] ~= nil then 
                Player.Functions.AddItem('electronickit', 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["electronickit"], "add")
            --end
        --end
        Player.Functions.RemoveMoney("bank", price, "købt ting i det sorte markede")
        TriggerClientEvent('QBCore:Notify', src, "Du har købt et Electronic Kit")
    --end
end)

RegisterServerEvent("qb-blackmarket:server:buy2Items")
AddEventHandler("qb-blackmarket:server:buy2Items", function()
    local src = source
    local price = 20000
    local Player = QBCore.Functions.GetPlayer(src)
    --if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        --for k, v in pairs(Player.PlayerData.items) do 
            --if Player.PlayerData.items[k] ~= nil then 
                Player.Functions.AddItem('cokekey', 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["cokekey"], "add")
            --end
        --end
        Player.Functions.RemoveMoney("bank", price, "købt ting i det sorte markede")
        TriggerClientEvent('QBCore:Notify', src, "Du har købt en CokeLab Nøgle")
    --end
end)

RegisterServerEvent("qb-blackmarket:server:buy3Items")
AddEventHandler("qb-blackmarket:server:buy3Items", function()
    local src = source
    local price = 20000
    local Player = QBCore.Functions.GetPlayer(src)
    --if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        --for k, v in pairs(Player.PlayerData.items) do 
            --if Player.PlayerData.items[k] ~= nil then 
                Player.Functions.AddItem('mwkey', 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["mwkey"], "add")
            --end
       -- end
        Player.Functions.RemoveMoney("bank", price, "købt ting i det sorte markede")
        TriggerClientEvent('QBCore:Notify', src, "Du har købt en Hvidvasknings Nøgle")
    --end
end)

RegisterServerEvent("qb-blackmarket:server:buy4Items")
AddEventHandler("qb-blackmarket:server:buy4Items", function()
    local src = source
    local price = 20000
    local Player = QBCore.Functions.GetPlayer(src)
    --if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        --for k, v in pairs(Player.PlayerData.items) do 
            --if Player.PlayerData.items[k] ~= nil then 
                Player.Functions.AddItem('weedkey', 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weedkey"], "add")
           -- end
        --end
        Player.Functions.RemoveMoney("bank", price, "købt ting i det sorte markede")
        TriggerClientEvent('QBCore:Notify', src, "Du har købt en WeedLab Nøgle")
    --end
end)

RegisterServerEvent("qb-blackmarket:server:buy5Items")
AddEventHandler("qb-blackmarket:server:buy5Items", function()
    local src = source
    local price = 20000
    local Player = QBCore.Functions.GetPlayer(src)
    --if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        --for k, v in pairs(Player.PlayerData.items) do 
            --if Player.PlayerData.items[k] ~= nil then 
                Player.Functions.AddItem('methkey', 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["methkey"], "add")
            --end
        --end
        Player.Functions.RemoveMoney("bank", price, "købt ting i det sorte markede")
        TriggerClientEvent('QBCore:Notify', src, "Du har købt en MethLab Nøgle")
    --end
end)

RegisterServerEvent("qb-blackmarket:server:buy6Items")
AddEventHandler("qb-blackmarket:server:buy6Items", function()
    local src = source
    local price = 10000
    local Player = QBCore.Functions.GetPlayer(src)
    --if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        --for k, v in pairs(Player.PlayerData.items) do 
            --if Player.PlayerData.items[k] ~= nil then 
                Player.Functions.AddItem('weapon_handcuffs', 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weapon_handcuffs"], "add")
            --end
        --end
        Player.Functions.RemoveMoney("bank", price, "købt ting i det sorte markede")
        TriggerClientEvent('QBCore:Notify', src, "Du har købt et par håndjern")
    --end
end)