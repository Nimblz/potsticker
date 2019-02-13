local HttpService = game:GetService("HttpService")

-- TODO: change to an actual endpoint.
local DUMP_URL = "https://gist.githubusercontent.com/Nimblz/cb92c17a2c57f751f558da96f660a9a1/raw/ffad00a785d89a8d32335102898d812bc0e0615c/megadump.json"

local Dumpling = {}

local _cachedDump = nil

-- returns the offline dump source
local function getOfflineDump()
    local offlineDump = script:FindFirstChild("Offline Dump")
    assert(offlineDump, "Offline dump not found, try updating the plugin.")
    return offlineDump.Source
end

-- retrieves dump from DUMP_URL
local function getWebDump()
    local success, dump = pcall(function()
        return HttpService:GetAsync(DUMP_URL, false)
    end)
    return success, dump
end

-- attempts to get dump from DUMP_URL, and failing that, falls back to the offline dump.
-- if this has been done before it will return the cached copy
function Dumpling.getDump()
    if not _cachedDump then
        local success, dump = getWebDump()

        if not success then
            warn("Unable to retrieve api from web: " .. dump)
            warn("Falling back to offline copy")

            dump = getOfflineDump()
        end

        dump = HttpService:JSONDecode(dump)

        _cachedDump = dump
    end

    return _cachedDump
end


return Dumpling