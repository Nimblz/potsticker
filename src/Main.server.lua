local pluginDir = script.Parent.Parent
local source = pluginDir:WaitForChild("plugin")
local lib = pluginDir:WaitForChild("lib")

-- Library
local Roact = require(lib:WaitForChild("Roact"))
local Rodux = require(lib:WaitForChild("Rodux"))
local RoactRodux = require(lib:WaitForChild("Roact-Rodux"))
local Dumpling = require(source:WaitForChild("Dumpling"))

-- Constants
local Actions = require(source:WaitForChild("Actions"))

local reducer = require(source:WaitForChild("reducer"))

local apiDump = Dumpling.getDump()

local store = Rodux.Store.new(reducer, nil, {
    Rodux.loggerMiddleware,
})

store:dispatch(Actions.BOOKMARK_ADD({class = "Instance", member = nil}))
store:dispatch(Actions.BOOKMARK_ADD({class = "Motor6D", member = "Part0"}))
store:dispatch(Actions.BOOKMARK_ADD({class = "Motor6D", member = "Part1"}))
store:dispatch(Actions.BOOKMARK_ADD({class = "HumanoidStateType", member = "Physics"}))
store:dispatch(Actions.BOOKMARK_REMOVE({class = "Motor6D", member = "Part1"}))