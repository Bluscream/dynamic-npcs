local OnlinePlayers = GetNumPlayerIndices()
local MaxPlayers = GetConvarInt("sv_maxclients", 48)

local function stringSplit(inputstr, sep)
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

function UpdateData()
    local OnlinePlayersPercent = 100 * OnlinePlayers / (OnlinePlayers + MaxPlayers)
    print("[NPCS] Online Players: " .. OnlinePlayers .. " / " .. MaxPlayers .. " (" .. tostring(OnlinePlayersPercent) .. ")")
    for _, v in pairs(sortedKeys(config)) do
        local command = stringSplit(v, "_")
        -- print("[NPCS] command: " .. command[2] .. " " .. command[3] .. " " .. command[4])
        local type = (command[2] == "players" and OnlinePlayers or OnlinePlayersPercent)
        -- print("[NPCS] type: " .. tostring(type))
        local count = tonumber(command[4])
        -- print("[NPCS] count: " .. tostring(count))
        if command[3] == "under" then
            if type < count then
                print("[NPCS] " .. v .. " matched!")
                TriggerClientEvent(GetCurrentResourceName() .. ':updateData', -1, config[v])
                return
            end
        elseif type > count then
            print("[NPCS] " .. v .. " matched!")
            TriggerClientEvent(GetCurrentResourceName() .. ':updateData', -1, config[v])
            return
        end
    end
    print("[NPCS] Nothing was matched!")
end

AddEventHandler('esx:playerLoaded', function(source)
	OnlinePlayers = OnlinePlayers + 1
    UpdateData()
end)

AddEventHandler('esx:playerDropped', function(playerId)
	OnlinePlayers = OnlinePlayers - 1
    UpdateData()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    UpdateData()
end)
RegisterServerEvent(GetCurrentResourceName() .. ':requestData')
AddEventHandler(GetCurrentResourceName() .. ':requestData', function(playerId)
	print("Update request recieved from player " .. tostring(playerId))
    UpdateData()
end)

-- TriggerEvent('es:addCommand', 'npcu', function(source, args, user)
--     UpdateData()
-- end)