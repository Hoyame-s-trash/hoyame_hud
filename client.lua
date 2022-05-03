local uiFaded = false
local ESX = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.eventESX, function(obj) ESX = obj end)
		Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Wait(10)
	end

	while ESX.GetPlayerData().job2 == nil do
		Wait(10)
	end

	local xPlayer = ESX.GetPlayerData()
	local cash, dirtycash, bank = 0, 0, 0

	for i = 1, #xPlayer.accounts, 1 do
		if xPlayer.accounts[i].name == 'cash' then
			cash = ESX.Math.GroupDigits(xPlayer.accounts[i].money)
		elseif xPlayer.accounts[i].name == 'dirtycash' then
			dirtycash = ESX.Math.GroupDigits(xPlayer.accounts[i].money)
		elseif xPlayer.accounts[i].name == 'bank' then
			bank = ESX.Math.GroupDigits(xPlayer.accounts[i].money)
		end
	end

	SendNUIMessage({
		type = "money",
		money = cash
	})

	SendNUIMessage({
		type = "bank",
		money = bank
	})

	SendNUIMessage({
		type = "black_money",
		money = dirtycash
	})

end)

RegisterNetEvent('ZgegFramework:playerLoaded')
AddEventHandler('ZgegFramework:playerLoaded', function(xPlayer)
	local cash, dirtycash, bank = 0, 0, 0

	for i = 1, #xPlayer.accounts, 1 do
		if xPlayer.accounts[i].name == 'cash' then
			cash = ESX.Math.GroupDigits(xPlayer.accounts[i].money)
		elseif xPlayer.accounts[i].name == 'dirtycash' then
			dirtycash = ESX.Math.GroupDigits(xPlayer.accounts[i].money)
		elseif xPlayer.accounts[i].name == 'bank' then
			bank = ESX.Math.GroupDigits(xPlayer.accounts[i].money)
		end
	end

	SendNUIMessage({
		type = "money",
		money = cash
	})

	
	SendNUIMessage({
		type = "bank",
		money = bank
	})

	SendNUIMessage({
		type = "black_money",
		money = dirtycash
	})
end)



RegisterNetEvent('ZgegFramework:setAccountMoney')
AddEventHandler('ZgegFramework:setAccountMoney', function(account)
	if account.name == 'dirtycash' then
		SendNUIMessage({
			type = "black_money",
			money = account.money
		})
	elseif account.name == 'bank' then
		SendNUIMessage({
			type = "bank",
			money = account.money
		})
	elseif account.name == 'cash' then
		SendNUIMessage({
			type = "money",
			money = account.money
		})
	end

end)

CreateThread(function()
	while true do
		TriggerServerEvent('hoyame_hud:getPlayers')
		Wait(5000)
	end
end)
RegisterNetEvent("hoyame_hud:updatePlayers")
AddEventHandler("hoyame_hud:updatePlayers", function(players)
    SendNUIMessage({
		type = "online-count",
		onlineCount = players
	})

	SendNUIMessage({
		type = "online-id",
		onlineID = GetPlayerServerId(PlayerId())
	})
end)

AddEventHandler('hoyame_hud:toogleHud', function(v)
	if v then
		SendNUIMessage({action = 'fadeUi', value = true})
	else
		SendNUIMessage({action = 'fadeUi', value = false})
	end
end)

CreateThread(function()
	local uiComponents = {'infos', 'statuts'}
	local inFrontend = false

	SendNUIMessage({action = 'hideUi', value = false})

	while true do
		Citizen.Wait(250)

		HideHudComponentThisFrame(1) -- Wanted Stars
		HideHudComponentThisFrame(2) -- Weapon Icon
		HideHudComponentThisFrame(3) -- Cash
		HideHudComponentThisFrame(4) -- MP Cash
		HideHudComponentThisFrame(6) -- Vehicle Name
		HideHudComponentThisFrame(7) -- Area Name
		HideHudComponentThisFrame(8) -- Vehicle Class
		HideHudComponentThisFrame(9) -- Street Name
		HideHudComponentThisFrame(13) -- Cash Change
		HideHudComponentThisFrame(17) -- Save Game
		HideHudComponentThisFrame(20) -- Weapon Stats

		if not uiFaded then
			if IsPauseMenuActive() or IsPlayerSwitchInProgress() then
				if not inFrontend then
					inFrontend = true
					SendNUIMessage({action = 'hideUi', value = true})
				end
			else
				if inFrontend then
					inFrontend = false
					SendNUIMessage({action = 'hideUi', value = false})
				end
			end
		end
	end
end)