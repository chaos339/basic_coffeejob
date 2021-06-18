local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData              = {}
local isBlip              = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	PlayerData.job = job
	Citizen.Wait(5000)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)
end)

-- MAP BLIP
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
	if PlayerData.job ~= nil and PlayerData.job.name == 'x' and not isBlip then 
	isBlip = true
	blip = AddBlipForCoord(-628.8,233.91,81.88) -- Blip on Map Position
	SetBlipSprite  (blip, 106) -- Blip Model , you can change it from : https://wiki.gtanet.work/index.php?title=Blips
	SetBlipDisplay (blip, 4)
	SetBlipScale   (blip, 0.9)
	SetBlipCategory(blip, 3)
	SetBlipColour  (blip, 73) -- Blip Color , you can change it from : https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Bean Machine") -- Blip name on map.
	EndTextCommandSetBlipName(blip)
  end
  end
end)


local inKitchen = false

-- Kitchen Menu Spot No. 1
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		if PlayerData.job ~= nil and PlayerData.job.name == 'x' then 
		DrawMarker(21, -631.43,224.47,81.88, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 255,0,0, 100, false, true, 2, false, false, false, false) -- Cooking Marker Position.
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -631.43,224.47,81.88, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('Press [E] To Cook Food')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMenu()
		end
		end
	end
end)


-- Drinks Menu Spot
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		if PlayerData.job ~= nil and PlayerData.job.name == 'x' then 
		DrawMarker(21, -627.71,223.89,81.88, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 255,0,0, 100, false, true, 2, false, false, false, false) -- Brewing Marker Position
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -627.71,223.89,81.88, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('Press [E] To Brew A Drink')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMenu2()
		end
		end
	end
end)


RegisterNetEvent('cooking:animation')
AddEventHandler('cooking:animation', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BBQ", 0, true) -- Cooking Animation 
	Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms
	ClearPedTasksImmediately(PlayerPedId()) -- Stops the animation after 10 Seconds.
end)

RegisterNetEvent('brewing:animation')
AddEventHandler('brewing:animation', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BBQ", 0, true) -- Brewing Animation. You can change the animation to something else to be more realistic. Eg: champagnespray.
	Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms
	ClearPedTasksImmediately(PlayerPedId()) -- Stops the animation after 10 Seconds.
end)


-- COOKING MENU FOR FOODS
function openMenu()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'cooking',
        {
            title    = 'Bean Machine Kitchen',
            align    = 'top-right',
            elements = { 
                { label = 'Donut ', value = 'food1' }, -- You can change the "label" into whatever you want. You can also change the value but make sure to change everything that is binded to it.
                { label = 'Cookie ', value = 'food2' }
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'food1' then
            menu.close()
            TriggerServerEvent('cooking:combination1')
		elseif value == 'food2' then
            menu.close()
            TriggerServerEvent('cooking:combination2')
        end
    end,
    function(data, menu)
        menu.close()
    end)
end


-- BREWING MENU FOR DRINKS -- 
function openMenu2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'brewing',
        {
            title    = 'Bean Machine Drinks',
            align    = 'top-right',
            elements = { 
                { label = 'Coffee ', value = 'drink1' }, -- You can change the "label" into whatever you want. You can also change the value but make sure to change everything that is binded to it.
                { label = 'Frappukeano ', value = 'drink2' }
            }
        },
    function(data, menu)
        local value = data.current.value

		if value == 'drink1' then
            menu.close()
            TriggerServerEvent('brewing:combination1')
		elseif value == 'drink2' then
            menu.close()
            TriggerServerEvent('brewing:combination2')
        end
    end,
    function(data, menu)
        menu.close()
    end)
end
