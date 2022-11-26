Citizen.CreateThread(function()
    local blip = AddBlipForCoord(xChasse.Blips.Pos.x, xChasse.Blips.Pos.y, xChasse.Blips.Pos.z)
    SetBlipSprite(blip, xChasse.Blips.Id)
    SetBlipDisplay(blip, xChasse.Blips.Display)
    SetBlipScale(blip, xChasse.Blips.Scale)
    SetBlipColour(blip, xChasse.Blips.Colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(xChasse.Blips.Title)
    EndTextCommandSetBlipName(blip)
    -- Vente
    local blip = AddBlipForCoord(xChasse.Blips_Vente.Pos.x, xChasse.Blips_Vente.Pos.y, xChasse.Blips_Vente.Pos.z)
    SetBlipSprite(blip, xChasse.Blips_Vente.Id)
    SetBlipDisplay(blip, xChasse.Blips_Vente.Display)
    SetBlipScale(blip, xChasse.Blips_Vente.Scale)
    SetBlipColour(blip, xChasse.Blips_Vente.Colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(xChasse.Blips_Vente.Title)
    EndTextCommandSetBlipName(blip)
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM