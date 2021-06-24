npc_data = {
	VehicleDensityMultiplier = 0,
	ParkedVehicleDensityMultiplier = 0,
	PedDensityMultiplier = 0,
	ScenarioPedDensityMultiplier = 0,
	DisabledDispatchServices = { Dispatch.All },
	DisableCops = true
}

Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(0)
		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(npc_data.VehicleDensityMultiplier) -- set traffic density to 0 
		SetRandomVehicleDensityMultiplierThisFrame(npc_data.VehicleDensityMultiplier) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(npc_data.ParkedVehicleDensityMultiplier) -- set random parked vehicles (parked car scenarios) to 0
		SetPedDensityMultiplierThisFrame(npc_data.PedDensityMultiplier) -- set npc/ai peds density to 0
		SetScenarioPedDensityMultiplierThisFrame(npc_data.ScenarioPedDensityMultiplier, npc_data.ScenarioPedDensityMultiplier) -- set random npc/ai peds or scenario peds to 0
		if npc_data.DisableCops then
			-- local playedId = PlayerId()
			-- SetPlayerWantedLevel(playedId, 0, false)
			-- SetPlayerWantedLevelNow(playedId, false)
			-- SetPlayerWantedLevelNoDrop(playedId, 0, false)
			SetCreateRandomCops(false) -- disable random cops walking/driving around.
			SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
			SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		end
		if npc_data.VehicleDensityMultiplier == 0 then
			SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
			SetRandomBoats(false) -- Stop random boats from spawning in the water.
		end
		if npc_data.VehicleDensityMultiplier == 0 and npc_data.ParkedVehicleDensityMultiplier == 0 then
			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
			ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
			RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
		end
	end
end)
-- local next = next 
RegisterNetEvent(updateDataEvent)
AddEventHandler(updateDataEvent, function(data)
	npc_data = data
	if npc_data.DisabledDispatchServices then -- and next(npc_data.DisabledDispatchServices) ~= nil
		for i,v in ipairs(npc_data.DisabledDispatchServices) do
			EnableDispatchService(v, false)
		end
	end
	if npc_data.DisableCops then SetMaxWantedLevel(0) else SetMaxWantedLevel(5) end
end)

-- AddEventHandler('onResourceStart', function(resourceName)
--     if (GetCurrentResourceName() ~= resourceName) then return end
--     TriggerServerEvent(requestDataEvent)
-- end)

RegisterCommand('npcs', function(source, args, rawCommand)
	tprint(npc_data)
end)

RegisterCommand('npcu', function(source, args, rawCommand)
	print("[NPCS] Requesting new data ...")
	TriggerServerEvent(requestDataEvent)
end)

TriggerServerEvent(requestDataEvent)