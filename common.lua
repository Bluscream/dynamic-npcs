Dispatch = {
    PoliceAutomobile = 1,
    PoliceAutomobileWaitPulledOver = 9,
    PoliceAutomobileWaitCruising = 10,
    PoliceRoadBlock = 8,
    PoliceRiders = 6,
    PoliceVehicleRequest = 7,
    PoliceHelicopter = 2,
    PoliceBoat = 13,
    SwatAutomobile = 4,
    SwatHelicopter = 12,
    ArmyVehicle = 14,
    FireDepartment = 3,
    AmbulanceDepartment = 5,
    Gangs = 11,
    BikerBackup = 15,
}
updateDataEvent = GetCurrentResourceName() .. ':updateData'
requestDataEvent = GetCurrentResourceName() .. ':requestData'
function tprint (tbl, indent)
	if not indent then indent = 0 end
	for k, v in pairs(tbl) do
		formatting = string.rep("  ", indent) .. k .. ": "
		if type(v) == "table" then
		print(formatting)
		tprint(v, indent+1)
		elseif type(v) == 'boolean' then
		print(formatting .. tostring(v))      
		else
		print(formatting .. v)
		end
	end
end
function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
function sortedKeys(query, sortFunction)
    local keys, len = {}, 0
    for k,_ in pairs(query) do
        len = len + 1
        keys[len] = k
    end
    table.sort(keys, sortFunction)
    return keys
end