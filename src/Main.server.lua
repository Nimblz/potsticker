local pluginDir = script.Parent.Parent
local source = pluginDir:WaitForChild("plugin")
local lib = pluginDir:WaitForChild("lib")

-- Library
local Roact = require(lib:WaitForChild("Roact"))
local Rodux = require(lib:WaitForChild("Rodux"))
local RoactRodux = require(lib:WaitForChild("Roact-Rodux"))
local Dumpling = require(source:WaitForChild("Dumpling"))

local Actions = require(source:WaitForChild("Actions"))

local reducer = require(source:WaitForChild("reducer"))

local apiDump = Dumpling.getDump()

local store = Rodux.Store.new(reducer, nil, {
    Rodux.loggerMiddleware,
})