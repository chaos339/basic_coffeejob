ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
-- DONUT RECIPE FUNCTION
RegisterServerEvent('cooking:combination1') -- Item Combination 1 
AddEventHandler('cooking:combination1', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local xItem1 = xPlayer.getInventoryItem('dough') -- Item 1 
	local xItem2 = xPlayer.getInventoryItem('sugar') -- Item 2 

	if xItem1.count > 1 then  -- Item 1  count 
		if xItem2.count > 1 then -- Item 2 count
			TriggerClientEvent('cooking:animation' , source) -- Play animation 
			Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms , the value is 10000 so , its 10 seconds
			xPlayer.addInventoryItem('bm_donut', 1)	-- add the cooked item to inventory
			xPlayer.removeInventoryItem('dough', 2) -- removing the Dough (Item 1)
			xPlayer.removeInventoryItem('sugar', 2) -- removing the Sugar  (Item 2 )
		else 
			TriggerClientEvent('esx:showNotification', source, 'You do not have enough Sugar. [Need 2]')
		end
	else 
		TriggerClientEvent('esx:showNotification', source, 'You do not have enough Dough. [Need 2]')
	end 
end)

-- COOKIE RECIPE FUNCTION
RegisterServerEvent('cooking:combination2') -- Item Combination 2
AddEventHandler('cooking:combination2', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local xItem1 = xPlayer.getInventoryItem('dough') -- Item 1 
	local xItem2 = xPlayer.getInventoryItem('sugar') -- Item 2 
	local xItem3 = xPlayer.getInventoryItem('chocolate_chips') -- Item 3
	
	if xItem1.count > 3 then  -- Item 1  count 
		if xItem2.count > 1 then -- Item 2 count
			if xItem3.count > 1 then -- Item 3 count
					TriggerClientEvent('cooking:animation' , source) -- Play animation function
					Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms.
					xPlayer.addInventoryItem('bm_cookie', 1) -- Puts the cooked item into your inventory
					xPlayer.removeInventoryItem('dough', 4) -- removing the Dough (Item 1)
					xPlayer.removeInventoryItem('sugar', 2) -- removing the Sugar  (Item 2)
					xPlayer.removeInventoryItem('chocolate_chips', 2) -- removing the Chocolate Chips (Item 3)
			else
				TriggerClientEvent('esx:showNotification', source, 'You do not have enough Chocolate Chips. [Need 2]')
			end
		else 
			TriggerClientEvent('esx:showNotification', source, 'You do not have enough Sugar. [Need 2]')
		end
	else 
		TriggerClientEvent('esx:showNotification', source, 'You do not have enough Dough. [Need 4]')
	end 
end)

-- COFFEE RECIPE FUNCTION
RegisterServerEvent('brewing:combination3') -- Item Combination 3
AddEventHandler('brewing:combination3', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local xItem1 = xPlayer.getInventoryItem('coffee_bean') -- Item 1 
	local xItem2 = xPlayer.getInventoryItem('sugar') -- Item 2
	local xItem3 = xPlayer.getInventoryItem('water') -- Item 3

	if xItem1.count > 3 then  -- Item 1  count 
		if xItem2.count > 1 then -- Item 2 count
			if xItem3.count > 1 then -- Item 3 count
					TriggerClientEvent('brewing:animation' , source) -- Play animation function
					Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms.
					xPlayer.addInventoryItem('bm_coffee', 1) -- Puts the brewed item into your inventory
					xPlayer.removeInventoryItem('coffee_bean', 4) -- removing the Coffee Bean (Item 1)
					xPlayer.removeInventoryItem('sugar', 2) -- removing the Sugar  (Item 2)
					xPlayer.removeInventoryItem('water', 2) -- removing the Water (Item 3)
			else
				TriggerClientEvent('esx:showNotification', source, 'You do not have enough Water. [Need 2]')
			end
		else 
			TriggerClientEvent('esx:showNotification', source, 'You do not have enough Sugar. [Need 2]')
		end
	else 
		TriggerClientEvent('esx:showNotification', source, 'You do not have enough Coffee Bean. [Need 4]')
	end 
end)
 
-- FRAPPE RECIPE FUNCTION
RegisterServerEvent('brewing:combination4') -- Item Combination 4
AddEventHandler('brewing:combination4', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local xItem1 = xPlayer.getInventoryItem('coffee_bean') -- Item 1 
	local xItem2 = xPlayer.getInventoryItem('sugar') -- Item 2 
	local xItem3 = xPlayer.getInventoryItem('water') -- Item 3
	
	if xItem1.count > 1 then  -- Item 1  count 
		if xItem2.count > 1 then -- Item 2 count
			if xItem3.count > 0 then -- Item 3 count
					TriggerClientEvent('brewing:animation' , source) -- Play animation function
					Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms.
					xPlayer.addInventoryItem('bm_frappe', 1) -- Puts the brewed item into your inventory
					xPlayer.removeInventoryItem('coffee_bean', 2) -- removing the Coffee Bean (Item 1)
					xPlayer.removeInventoryItem('sugar', 2) -- removing the Sugar  (Item 2)
					xPlayer.removeInventoryItem('water', 1) -- removing the Water (Item 3)
			else
				TriggerClientEvent('esx:showNotification', source, 'You do not have enough Water. [Need 1]')
			end
		else 
			TriggerClientEvent('esx:showNotification', source, 'You do not have enough Sugar. [Need 2]')
		end
	else 
		TriggerClientEvent('esx:showNotification', source, 'You do not have enough Coffee Bean. [Need 2]')
	end 
end)


-- RegisterServerEvent('cooking:combination5') -- Item Combination 5
-- AddEventHandler('cooking:combination5', function()
--     local xPlayer = ESX.GetPlayerFromId(source)
-- 	local xItem1 = xPlayer.getInventoryItem('bread') -- Item 1 
-- 	local xItem2 = xPlayer.getInventoryItem('water') -- Item 2 
	
-- 	if xItem1.count > 0 then  -- Item 1  count 
-- 		if xItem2.count > 0 then -- Item 2 count
-- 			TriggerClientEvent('cooking:animation' , source) -- Play animation 
-- 			Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms , the value is 10000 so , its 10 seconds
-- 			xPlayer.addInventoryItem('chocolate_cupcake', 1)	-- add the combination Items 
-- 			xPlayer.removeInventoryItem('chocolate', 1) -- removing the water (Item 1)
-- 			xPlayer.removeInventoryItem('cupcake', 1) -- removing the bread  (Item 2 )
-- 		else 
-- 			TriggerClientEvent('esx:showNotification', source, 'You dont have x1 Water.')
-- 		end
-- 	else 
-- 		TriggerClientEvent('esx:showNotification', source, 'You dont have x1 Bread.')
-- 	end 
-- end)

