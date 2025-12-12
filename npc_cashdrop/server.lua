local QBCore = exports['qb-core']:GetCoreObject()
local drops = {}

RegisterNetEvent('npcdrop:tryDropCash', function(netId)
    local src = source
    local ped = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(ped) then return end

    if math.random() < Config.DropChance then
        local coords = GetEntityCoords(ped)
        local amount = math.random(Config.MinCash, Config.MaxCash)
        local dropId = math.random(111111, 999999)

        drops[dropId] = amount

        TriggerClientEvent('npcdrop:spawnDrop', -1, coords, amount, dropId)
    end
end)

RegisterNetEvent('npcdrop:pickupCash', function(dropId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if drops[dropId] then
        Player.Functions.AddMoney('cash', drops[dropId], 'npc-cash-drop')
        drops[dropId] = nil
    end
end)
