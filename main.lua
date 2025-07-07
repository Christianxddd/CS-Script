local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- Función rainbow para efectos
local function rainbowColor()
	local t = tick()
	return Color3.fromHSV((t * 0.5) % 1, 1, 1)
end

-- Crear ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "ChristianSebasGamerPanelV2"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Sonido miau
local sound = Instance.new("Sound", gui)
sound.SoundId = "rbxassetid://145069956" -- Sonido miau
sound.Volume = 0.7

-- Botón flotante "C"
local iconBtn = Instance.new("TextButton", gui)
iconBtn.Name = "IconCButton"
iconBtn.Size = UDim2.new(0, 60, 0, 60)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.BackgroundColor3 = Color3.new(0, 0, 0)
iconBtn.BorderSizePixel = 0
iconBtn.Text = "C"
iconBtn.TextColor3 = Color3.new(1, 1, 1)
iconBtn.Font = Enum.Font.Arcade
iconBtn.TextScaled = true
iconBtn.AutoButtonColor = true
iconBtn.ZIndex = 5
iconBtn.Active = true
iconBtn.Draggable = true

-- Panel principal vertical
local panel = Instance.new("Frame", gui)
panel.Name = "MainPanel"
panel.Size = UDim2.new(0, 320, 0.75, 0)
panel.Position = UDim2.new(0, 20, 0, 90)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.35
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.ZIndex = 4

local panelCorner = Instance.new("UICorner", panel)
panelCorner.CornerRadius = UDim.new(0, 10)

local panelStroke = Instance.new("UIStroke", panel)
panelStroke.Thickness = 2
panelStroke.Color = Color3.new(1, 0, 0)

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Im Christian Sebast"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.ZIndex = 5

-- Función para mostrar/ocultar panel y reproducir sonido
iconBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
	if panel.Visible then
		sound:Play()
	end
end)

-- Efecto rainbow en texto y borde del panel
RunService.RenderStepped:Connect(function()
	local color = rainbowColor()
	panelStroke.Color = color
	title.TextColor3 = color
	iconBtn.TextColor3 = color
end)
