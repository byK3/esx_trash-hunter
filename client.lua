local firstSpawn = true
local isSearching = false
local blocked = {}
local props = {}

AddEventHandler("playerSpawned", function()
    if firstSpawn then
        startThread()
        firstSpawn = false
    end
end)

function startThread()
    CreateThread(function()
        while true do
            Wait(math.random(1,3))

            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            props = {}

            for k, v in pairs(Config.General.props) do
                local trash = GetClosestObjectOfType(coords["x"],coords["y"],coords["z"], 4.0, GetHashKey(v), false, false, false)
                if DoesEntityExist(trash) then
                    table.insert(props, trash)
                end
            end

            local trashFound = false

            for i = 1, #props do
                local trash = props[i]
                local trashCoords = GetEntityCoords(trash)
                local dist = #(coords - trashCoords)

                if not isSearching and dist <= Config.General.maxRange and not IsPedInAnyVehicle(ped, false) and not blocked[trash] then
                    trashFound = true
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to search the trash")

                    if IsControlJustPressed(0, 38) then
                        isSearching = true
                        SearchTrash(trash, trashCoords)
                    end
                end
            end

            if not trashFound then
                Wait(1000)
            end
        end
    end)
end

function SearchTrash(trash, tcoords)
    if isSearching then 
        local ped = PlayerPedId()
        local lib, anim = 'amb@prop_human_bum_bin@base', 'base'
        local duration = Config.General.searchTime * 1000


        ESX.Streaming.RequestAnimDict(lib, function()
            TaskPlayAnim(ped, lib, anim, 8.0, -8.0, duration, 1, 0, false, false, false)

            Wait(1)
            while IsEntityPlayingAnim(ped, lib, anim, 3) do
                Citizen.Wait(0)
                DisableAllControlActions(0)
                FreezeEntityPosition(ped, true)
            end

            ClearPedTasksImmediately(ped)
            FreezeEntityPosition(ped, false)
            isSearching = false
            blocked[trash] = true
            TriggerServerEvent('k3_trash:giveReward', trash, tcoords)
        end)
    else
        return
    end
end

CreateThread(function()
    while true do
        Wait(Config.General.refreshTime * 1000 * 60)
        
        for k, v in pairs(blocked) do
            if v then
                blocked[k] = nil
            end
        end
    end
end)
