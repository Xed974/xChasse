CreateThread(function()
    while true do
        local wait = 1000

        for k in pairs(xChasse.Position.Chasse) do
            local pos = xChasse.Position.Chasse
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = Vdist(pPos.x, pPos.y, pPos.z, pos[k].x, pos[k].y, pos[k].z)

            if dst <= 3.0 then
                wait = 0
                DrawMarker(xChasse.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, xChasse.MarkerSizeLargeur, xChasse.MarkerSizeEpaisseur, xChasse.MarkerSizeHauteur, xChasse.MarkerColorR, xChasse.MarkerColorG, xChasse.MarkerColorB, xChasse.MarkerOpacite, xChasse.MarkerSaute, true, p19, xChasse.MarkerTourne)
            end
            if dst <= 1.0 then
                wait = 0
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour commencer/arrêter de chasser.")
                if IsControlJustPressed(1, 51) then
                    startChasse()
                end
            end
        end
        for k in pairs(xChasse.Position.Vente) do
            local pos = xChasse.Position.Vente
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = Vdist(pPos.x, pPos.y, pPos.z, pos[k].x, pos[k].y, pos[k].z)

            if dst <= 3.0 then
                wait = 0
                DrawMarker(xChasse.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, xChasse.MarkerSizeLargeur, xChasse.MarkerSizeEpaisseur, xChasse.MarkerSizeHauteur, xChasse.MarkerColorR, xChasse.MarkerColorG, xChasse.MarkerColorB, xChasse.MarkerOpacite, xChasse.MarkerSaute, true, p19, xChasse.MarkerTourne)
            end
            if dst <= 1.0 then
                wait = 0
                ESX.ShowHelpNotification(("Appuyez sur ~INPUT_CONTEXT~ pour vendre vos morceaux de viandes. (~g~%s$/u~s~)"):format(xChasse.PriceViande))
                if IsControlJustPressed(1, 51) then
                    TriggerServerEvent("xChasse:sell")
                end
            end
        end
        Wait(wait)
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM