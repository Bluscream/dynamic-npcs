-- Density values from 0.0 to 1.0.
VehicleDensityMultiplier = 0
PedDensityMultiplier = 0.1
DisableCops = true
DisableDispatch = true
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(0)
		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(VehicleDensityMultiplier) -- set traffic density to 0 
		SetRandomVehicleDensityMultiplierThisFrame(VehicleDensityMultiplier) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(VehicleDensityMultiplier) -- set random parked vehicles (parked car scenarios) to 0
		SetPedDensityMultiplierThisFrame(PedDensityMultiplier) -- set npc/ai peds density to 0
		SetScenarioPedDensityMultiplierThisFrame(PedDensityMultiplier, PedDensityMultiplier) -- set random npc/ai peds or scenario peds to 0
		if DisableDispatch then
			for i = 1, 12 do
				EnableDispatchService(i, false)
			end
		end
		if DisableCops then
			SetPlayerWantedLevel(PlayerId(), 0, false)
			SetPlayerWantedLevelNow(PlayerId(), false)
			SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
			SetCreateRandomCops(false) -- disable random cops walking/driving around.
			SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
			SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		end
		if VehicleDensityMultiplier == 0 then
			SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
			SetRandomBoats(false) -- Stop random boats from spawning in the water.
			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
			ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
			RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
		end
	end
end)

RegisterCommand('npcs', function(source, args, rawCommand)
	print("[NPCS] VehicleDensityMultiplier: " .. VehicleDensityMultiplier)
	print("[NPCS] PedDensityMultiplier: " .. PedDensityMultiplier)
	print("[NPCS] DisableCops: " .. tostring(DisableCops))
	print("[NPCS] DisableDispatch: " .. tostring(DisableDispatch))
end)
RegisterCommand('npcvehicles', function(source, args, rawCommand)
	local float = tonumber(args[1])
	if float then --  and float > -1 and float < 1
		VehicleDensityMultiplier = float
		print("[NPCS] VehicleDensityMultiplier is now " .. VehicleDensityMultiplier)
	else
		print("[NPCS] Must be number from 0.0 to 1.0")
	end
end)
RegisterCommand('npcpeds', function(source, args, rawCommand)
	local float = tonumber(args[1])
	if float then
		PedDensityMultiplier = float
		print("[NPCS] PedDensityMultiplier is now " .. PedDensityMultiplier)
	else
		print("[NPCS] Must be number from 0.0 to 1.0")
	end
end)
RegisterCommand('npccops', function(source, args, rawCommand)
    DisableCops = not DisableCops
	print("[NPCS] Cops are now " .. tostring(DisableCops))
end)
RegisterCommand('npcdispatch', function(source, args, rawCommand)
    DisableDispatch = not DisableDispatch
	print("[NPCS] Dispatch is now " .. tostring(DisableDispatch))
end)