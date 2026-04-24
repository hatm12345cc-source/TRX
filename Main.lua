-- [[ TRX PRIVATE LIBRARY ]] --
-- [[ DEVELOPED BY TRX ]] --

local Library = {}

function Library:Init()
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Sidebar = Instance.new("Frame")
    local Profile = Instance.new("Frame")
    local ButtonsArea = Instance.new("ScrollingFrame")
    local MainStroke = Instance.new("UIStroke")
    local MainCorner = Instance.new("UICorner")

    ScreenGui.Name = "TRX_HUB"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Main Container
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Main.Position = UDim2.new(0.5, -275, 0.5, -160)
    Main.Size = UDim2.new(0, 550, 0, 320)
    Main.BorderSizePixel = 0

    MainStroke.Color = Color3.fromRGB(255, 0, 0)
    MainStroke.Thickness = 2
    MainStroke.Parent = Main

    MainCorner.CornerRadius = UDim.new(0, 5)
    MainCorner.Parent = Main

    -- Left Navigation
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = Main
    Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Sidebar.Size = UDim2.new(0, 145, 1, 0)
    Sidebar.BorderSizePixel = 0

    local SidebarLine = Instance.new("Frame")
    SidebarLine.Parent = Sidebar
    SidebarLine.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    SidebarLine.Position = UDim2.new(1, 0, 0, 0)
    SidebarLine.Size = UDim2.new(0, 1, 1, 0)
    SidebarLine.BorderSizePixel = 0

    -- Profile Header
    Profile.Name = "Profile"
    Profile.Parent = Main
    Profile.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Profile.Position = UDim2.new(0, 160, 0, 15)
    Profile.Size = UDim2.new(0, 375, 0, 90)
    Profile.BorderSizePixel = 0

    local ProfileCorner = Instance.new("UICorner")
    ProfileCorner.CornerRadius = UDim.new(0, 6)
    ProfileCorner.Parent = Profile

    -- Buttons Container
    ButtonsArea.Name = "ButtonsArea"
    ButtonsArea.Parent = Main
    ButtonsArea.BackgroundTransparency = 1
    ButtonsArea.Position = UDim2.new(0, 160, 0, 120)
    ButtonsArea.Size = UDim2.new(0, 375, 0, 185)
    ButtonsArea.ScrollBarThickness = 0
    ButtonsArea.CanvasSize = UDim2.new(0, 0, 2, 0)

    local ButtonLayout = Instance.new("UIListLayout")
    ButtonLayout.Parent = ButtonsArea
    ButtonLayout.Padding = UDim.new(0, 10)
    ButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder

    function Library:CreateButton(name, callback)
        local Btn = Instance.new("TextButton")
        local BtnStroke = Instance.new("UIStroke")
        local BtnCorner = Instance.new("UICorner")

        Btn.Name = name
        Btn.Parent = ButtonsArea
        Btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Btn.Size = UDim2.new(1, -10, 0, 45)
        Btn.Font = Enum.Font.GothamBold
        Btn.Text = name
        Btn.TextColor3 = Color3.fromRGB(255, 0, 0)
        Btn.TextSize = 14
        Btn.AutoButtonColor = true

        BtnStroke.Color = Color3.fromRGB(255, 0, 0)
        BtnStroke.Thickness = 1.5
        BtnStroke.Parent = Btn

        BtnCorner.CornerRadius = UDim.new(0, 4)
        BtnCorner.Parent = Btn

        Btn.MouseButton1Click:Connect(function()
            callback()
        end)
    end

    return Library
end

return Library
