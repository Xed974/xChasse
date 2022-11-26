local blip, animal = nil, nil

local function setBlip(x, y, z)
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 3)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.5)
    SetBlipColour(blip, 0)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Zone Chasse | Animal")
    EndTextCommandSetBlipName(blip)
end

local function animalDead(pos)
    CreateThread(function()
        while true do
            local wait = 1000
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = Vdist(pPos.x, pPos.y, pPos.z, pos.x, pos.y, pos.z)

            if dst <= 2.0 then
                wait = 0
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour dépecer l'animal. (Requis: ~r~1 couteau~s~)")
                if IsControlJustPressed(1, 51) then
                    ESX.TriggerServerCallback("xChasse:depecer", function(result) 
                        if result then
                            FreezeEntityPosition(PlayerPedId(), true)
                            TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, 1)
                            exports['progressBars']:startUI(5000, "Dépeçage de l'animal en cours...")
                            Wait(5000)
                            ClearPedTasks(PlayerPedId())
                            DeletePed(animal)
                            FreezeEntityPosition(PlayerPedId(), false)
                            Chasse()
                        end 
                    end)
                    break
                end
            end
            
            Wait(wait)
        end
    end)
end

local function onChasse()
    local isDead = false
    while not isDead do
        if IsEntityDead(animal) then
            ESX.ShowNotification("(~y~Information~s~)\nApprochez vous de l\'animal pour le dépecer.")
            animalDead(GetEntityCoords(animal), animal)
            RemoveBlip(blip)
            isDead = true
            break
        end
        Wait(0)
    end
end

function Chasse()
    local ped, pos = math.random(#xChasse.Animal), math.random(#xChasse.Position.Animal)
    local hash = GetHashKey(xChasse.Animal[ped])
    while not HasModelLoaded(hash) do RequestModel(hash) Wait(20) end
	animal = CreatePed("PED_TYPE_CIVMALE", xChasse.Animal[ped], xChasse.Position.Animal[pos].x, xChasse.Position.Animal[pos].y, xChasse.Position.Animal[pos].z, GetEntityHeading(PlayerPedId()), false, true)
    TaskWanderStandard(animal, 10, 10)
    SetNewWaypoint(xChasse.Position.Animal[pos].x, xChasse.Position.Animal[pos].y, xChasse.Position.Animal[pos].z)
    ESX.ShowNotification("(~y~Information~s~)\nAllez vers l'animal.")
    setBlip(xChasse.Position.Animal[pos].x, xChasse.Position.Animal[pos].y, xChasse.Position.Animal[pos].z)
    onChasse()
end

function startChasse()
    ESX.TriggerServerCallback("xChasse:start/stop", function(result) 
        if result then
            Chasse()
        else
            RemoveBlip(blip)
            DeletePed(animal)
        end
    end)
end

--- Xed#1188 | https://discord.gg/HvfAsbgVpM