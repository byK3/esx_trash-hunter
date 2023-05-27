RegisterServerEvent('k3_trash:giveReward')
AddEventHandler('k3_trash:giveReward', function(obj, coords)
    local xPlayer = ESX.GetPlayerFromId(source)
    local ped = GetPlayerPed(source)
    local xCoords = GetEntityCoords(ped)
    local dist = #(xCoords - coords)

    if obj == nil then
        print ('[k3_trash] [WARNING] Player ' .. GetPlayerName(source) .. ' tried to cheat! (obj is nil)')
        return
    end

    if dist > 5 then
        print ('[k3_trash] [WARNING] Player ' .. GetPlayerName(source) .. ' tried to cheat! (too far away from trash | dist > 5 | dist = ' .. dist .. ')')
        return
    end

    local reward = Config.General.rewards
    local randomType = math.random(1, 10)

    if randomType <= 5 then
        local randomMoney = math.random(reward.money.min, reward.money.max)
        xPlayer.addMoney(randomMoney)
        Config.serverNotify(source, 'You found ' .. randomMoney .. ' $')
    else
        local randomItem = math.random(1, #reward.items)
        local item = reward.items[randomItem]
        xPlayer.addInventoryItem(item.name, item.amount)
        Config.serverNotify(source, 'You found ' .. item.amount .. ' ' .. item.name)
    end
end)
