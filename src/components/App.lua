local components = script.Parent
local source = components.Parent
local pluginRoot = source.Parent
local lib = pluginRoot:WaitForChild("lib")

local Roact = require(lib:WaitForChild("Roact"))
local e = Roact.createElement

local App = Roact.PureComponent:extend("App")

function App:didMount()

end

function App:init()

end

function App:render()
    return e("Frame", {
        Size = UDim2.new(1,0,1,0),
        BackgroundTransparency = 1,
    }, {
        UIPadding = e("UIPadding", {
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
        }),
    })
end

return App