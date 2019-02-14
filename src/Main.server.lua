local pluginRoot = script.Parent.Parent
local source = pluginRoot:WaitForChild("plugin")
local lib = pluginRoot:WaitForChild("lib")

local components = source:WaitForChild("components")

-- Library
local Roact = require(lib:WaitForChild("Roact"))
local Rodux = require(lib:WaitForChild("Rodux"))
local RoactRodux = require(lib:WaitForChild("Roact-Rodux"))
local Dumpling = require(source:WaitForChild("Dumpling"))

local Config = require(source:WaitForChild("Config"))

local reducer = require(source:WaitForChild("reducer"))

local App = require(components:WaitForChild("App"))

local apiDump = Dumpling.getDump()

local store = Rodux.Store.new(reducer)

local pluginToolbar = plugin:CreateToolbar(Config.PluginName)
local pluginButton = pluginToolbar:CreateButton(Config.PluginName,Config.PluginDescription,Config.PluginIcon)

local widgetInfo = DockWidgetPluginGuiInfo.new(
    Enum.InitialDockState.Left,
    true,   -- Widget will be initially enabled
	false,  -- Don't override the previous enabled state
	300,    -- Default width of the floating window
	600,    -- Default height of the floating window
	150,    -- Minimum width of the floating window
	150     -- Minimum height of the floating window
)

local pluginWidget = plugin:CreateDockWidgetPluginGui("TestWidget", widgetInfo)
pluginWidget.Title = Config.PluginName

local rootElement = Roact.createElement(RoactRodux.StoreProvider, {
    store = store,
}, {
    App = Roact.createElement(App, {
        root = pluginWidget,
    }),

    TestLabel = Roact.createElement("TextLabel", {
        Text = "Text",
        Size = UDim2.new(1,0,1,0),
        BorderSizePixel = 0,
    })
})