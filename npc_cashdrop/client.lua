local drops = {}

-- Detect NPC death
CreateThread(function()
    while true do
        Wait(200)

        local player = PlayerPedId()
        local coords = GetEntityCoords(player)

        for _, ped in pairs(GetGamePool('CPed')) do
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                if IsPedDeadOrDying(ped, true) and not drops[ped] then
                    drops[ped] = true
                    TriggerServerEvent('npcdrop:tryDropCash', NetworkGetNetworkIdFromEntity(ped))
                end
            end
        end
    end
end)

-- Spawn cash drop
RegisterNetEvent('npcdrop:spawnDrop', function(coords, amount, dropId)
    local prop = CreateObject(Config.CashProp, coords.x, coords.y, coords.z - 1.0, true, true, false)
    PlaceObjectOnGroundProperly(prop)

    local id = dropId
    local pickupCoords = coords

    CreateThread(function()
        while true do
            Wait(0)
            local player = PlayerPedId()
            local pCoords = GetEntityCoords(player)

            if #(pCoords - pickupCoords) < Config.PickupRange then
                TriggerServerEvent('npcdrop:pickupCash', id)
                DeleteObject(prop)
                break
            end
        end
    end)
end)
