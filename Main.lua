-- [[ TRX RAINBOW LIBRARY ]] --
-- [[ CLEAN & NATIVE CODE ]] --

local Library = {}

function Library:Init()
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Sidebar = Instance.new("Frame")
    local Profile = Instance.new("Frame")
    local ButtonsArea = Instance.new("ScrollingFrame")
    local MainStroke = Instance.new("UIStroke")

    ScreenGui.Name = "TRX_HUB_V2"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Main Frame (Dark Midnight Blue)
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(2, 2, 15) -- Very Dark Blue
    Main.Position = UDim2.new(0.5, -275, 0.5, -160)
    Main.Size = UDim2.new(0, 550, 0, 320)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true

    -- Square Rainbow Border
    MainStroke.Thickness = 3
    MainStroke.Parent = Main
    MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- Rainbow Animation
    spawn(function()
        local hue = 0
        while task.wait() do
            MainStroke.Color = Color3.fromHSV(hue, 1, 1)
            hue = hue + (1/300)
            if hue > 1 then hue = 0 end
        end
    end)

    -- Sidebar (Square)
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = Main
    Sidebar.BackgroundColor3 = Color3.fromRGB(5, 5, 25)
    Sidebar.Size = UDim2.new(0, 140, 1, 0)
    Sidebar.BorderSizePixel = 0

    -- Profile Display (Square)
    Profile.Name = "Profile"
    Profile.Parent = Main
    Profile.BackgroundColor3 = Color3.fromRGB(10, 10, 35)
    Profile.Position = UDim2.new(0, 155, 0, 15)
    Profile.Size = UDim2.new(0, 380, 0, 100)
    Profile.BorderSizePixel = 0

    -- Buttons Area (Scrolling)
    ButtonsArea.Name = "ButtonsArea"
    ButtonsArea.Parent = Main
    ButtonsArea.BackgroundTransparency = 1
    ButtonsArea.Position = UDim2.new(0, 155, 0, 130)
    ButtonsArea.Size = UDim2.new(0, 380, 0, 175)
    ButtonsArea.ScrollBarThickness = 0
    ButtonsArea.CanvasSize = UDim2.new(0, 0, 2, 0)

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = ButtonsArea
    Layout.Padding = UDim.new(0, 10)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Function to Create Square Buttons (Exactly as Image)
    function Library:CreateButton(name, callback)
        local Btn = Instance.new("TextButton")
        local BtnStroke = Instance.new("UIStroke")

        Btn.Name = name
        Btn.Parent = ButtonsArea
        Btn.BackgroundColor3 = Color3.fromRGB(8, 8, 30)
        Btn.Size = UDim2.new(1, -10, 0, 45)
        Btn.Font = Enum.Font.GothamBold
        Btn.Text = name
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.TextSize = 14
        Btn.BorderSizePixel = 0

        BtnStroke.Thickness = 2
        BtnStroke.Color = Color3.fromRGB(40, 40, 80)
        BtnStroke.Parent = Btn

        Btn.MouseButton1Click:Connect(function()
            callback()
        end)
    end

    return Library
end

return Library
