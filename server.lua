RegisterNetEvent('hoyame_hud:getPlayers')
AddEventHandler('hoyame_hud:getPlayers', function()
    local c = 0

    for k, v in inpairs(GetPlayers()) do c = c + 1 end
    
    TriggerClientEvent("hoyame_hud:updatePlayers", source, c)
end)