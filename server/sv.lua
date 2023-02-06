ESX.RegisterServerCallback("xChasse:start/stop", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end
    if xPlayer.getInventoryItem(xChasse.ItemChasse).count > 0 then
        xPlayer.removeInventoryItem(xChasse.ItemChasse, xPlayer.getInventoryItem(xChasse.ItemChasse).count)
        xPlayer.removeInventoryItem(xChasse.ItemAmmoChasse, xPlayer.getInventoryItem(xChasse.ItemAmmoChasse).count)
        TriggerClientEvent('esx:showNotification', source, '(~g~Succès~s~)\nVous avez arrêté(e) votre session de chasse.')
        cb(false)
    else
        xPlayer.addInventoryItem(xChasse.ItemChasse, 1)
        xPlayer.addInventoryItem(xChasse.ItemAmmoChasse, 250)
        TriggerClientEvent('esx:showNotification', source, '(~g~Succès~s~)\nVous avez commencé(e) votre session de chasse.')
        cb(true)
    end
end)

ESX.RegisterServerCallback("xChasse:depecer", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(1, 3)

    if (not xPlayer) then return end
    if xPlayer.getInventoryItem(xChasse.ItemForDepecer).count > 0 then
        xPlayer.addInventoryItem(xChasse.ItemViande, random)
        TriggerClientEvent('esx:showNotification', source, ('(~g~Succès~s~)\nAnimal dépecer, vous avez reçu ~r~x%s~s~ morceau de viande.'):format(random))
        cb(true)
    else
        TriggerClientEvent('esx:showNotification', source, '(~r~Erreur~s~)\nVous n\'avez pas de couteau sur vous, la viande est devenue avariée.')
        cb(false)
    end
end)

RegisterNetEvent("xChasse:sell")
AddEventHandler("xChasse:sell", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end
    if xPlayer.getInventoryItem(xChasse.ItemViande).count > 0 then
        TriggerClientEvent('esx:showNotification', xPlayer.source, ('(~g~Succès~s~)\nVous avez vendu ~r~x%s~s~ morceau de viande et vous avez gagné(e) ~g~%s$~s~.'):format(xPlayer.getInventoryItem(xChasse.ItemViande).count), xPlayer.getInventoryItem(xChasse.ItemViande).count * xChasse.PriceViande)
        xPlayer.addMoney(xPlayer.getInventoryItem(xChasse.ItemViande).count * xChasse.PriceViande)
        xPlayer.removeInventoryItem(xChasse.ItemViande, xPlayer.getInventoryItem(xChasse.ItemViande).count)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, '(~r~Erreur~s~)\nVous n\'avez pas de morceau de viande sur vous.')
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM
