local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

local function rainbowColor()
    local t = tick()
    return Color3.fromHSV((t * 0.5) % 1, 1, 1)
end

local gui = Instance.new("ScreenGui")
gui.Name = "ChristianSebasProPanel"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local sound = Instance.new("Sound", gui)
sound.SoundId = "rbxassetid://145069956"
sound.Volume = 0.6

-- Botón flotante ImageButton
local iconBtn = Instance.new("ImageButton")
iconBtn.Name = "IconCButton"
iconBtn.Size = UDim2.new(0, 60, 0, 60)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.BackgroundColor3 = Color3.new(0, 0, 0)
iconBtn.BorderSizePixel = 0
iconBtn.AutoButtonColor = true
iconBtn.Parent = gui
iconBtn.Active = true
iconBtn.Draggable = true
iconBtn.ZIndex = 10

-- Texto “C” encima
local iconText = Instance.new("TextLabel", iconBtn)
iconText.Size = UDim2.new(1, 0, 1, 0)
iconText.BackgroundTransparency = 1
iconText.Text = "C"
iconText.TextColor3 = Color3.new(1, 1, 1)
iconText.Font = Enum.Font.Arcade
iconText.TextScaled = true
iconText.ZIndex = 11
iconText.TextStrokeTransparency = 0

-- Panel vertical
local panel = Instance.new("Frame", gui)
panel.Name = "MainPanel"
panel.Size = UDim2.new(0, 320, 0.75, 0)
panel.Position = UDim2.new(0, 20, 0, 90)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.35
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.ZIndex = 9

local panelCorner = Instance.new("UICorner", panel)
panelCorner.CornerRadius = UDim.new(0, 10)

local panelStroke = Instance.new("UIStroke", panel)
panelStroke.Thickness = 2
panelStroke.Color = Color3.new(1, 0, 0)

local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Im Christian Sebast"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.ZIndex = 11

-- Toggle panel y sonido
iconBtn.MouseButton1Click:Connect(function()
    panel.Visible = not panel.Visible
    if panel.Visible then
        sound:Play()
    end
end)

-- Rainbow efecto en texto y bordes
RunService.RenderStepped:Connect(function()
    local c = rainbowColor()
    panelStroke.Color = c
    title.TextColor3 = c
    iconText.TextColor3 = c
end)
