local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- GUI base
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianHub"
gui.ResetOnSpawn = false

-- Rainbow Function
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2) * 127 + 128,
		math.sin(t + 4) * 127 + 128
	)
end

-- Intro (pantalla completa con texto)
local intro = Instance.new("TextLabel", gui)
intro.Size = UDim2.new(1, 0, 1, 0)
intro.BackgroundColor3 = Color3.new(0, 0, 0)
intro.Text = "By Christian"
intro.Font = Enum.Font.Arcade
intro.TextScaled = true
intro.TextColor3 = Color3.new(1,1,1)
intro.ZIndex = 10

-- Desaparece después de 2 segundos
task.delay(2, function()
	intro:Destroy()
end)

-- Pantalla de contraseña
local passFrame = Instance.new("Frame", gui)
passFrame.Size = UDim2.new(0, 350, 0, 150)
passFrame.Position = UDim2.new(0.5, -175, 0.4, -75)
passFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", passFrame)

local passLabel = Instance.new("TextLabel", passFrame)
passLabel.Size = UDim2.new(1, 0, 0.4, 0)
passLabel.Position = UDim2.new(0, 0, 0, 0)
passLabel.Text = "Ingrese la contraseña"
passLabel.Font = Enum.Font.Arcade
passLabel.TextColor3 = Color3.new(1,1,1)
passLabel.TextScaled = true
passLabel.BackgroundTransparency = 1

local input = Instance.new("TextBox", passFrame)
input.Size = UDim2.new(0.8, 0, 0.3, 0)
input.Position = UDim2.new(0.1, 0, 0.45, 0)
input.PlaceholderText = "Código"
input.Font = Enum.Font.Arcade
input.TextScaled = true
input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
input.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", input)

local check = Instance.new("TextButton", passFrame)
check.Size = UDim2.new(0.5, 0, 0.2, 0)
check.Position = UDim2.new(0.25, 0, 0.8, 0)
check.Text = "Entrar"
check.Font = Enum.Font.Arcade
check.TextScaled = true
check.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
check.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", check)

-- Panel principal (oculto al inicio)
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 450, 0, 500)
panel.Position = UDim2.new(0.5, -225, 0.5, -250)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.3
panel.Visible = false
panel.Parent = gui
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0.08, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Im Christian Sebast"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

-- Info
local userLabel = Instance.new("TextLabel", panel)
userLabel.Size = UDim2.new(1, 0, 0.05, 0)
userLabel.Position = UDim2.new(0, 0, 0.08, 0)
userLabel.Text = "Usuario de Roblox: Christian_xyx | TikTok: @christ_sebast_7d"
userLabel.Font = Enum.Font.Arcade
userLabel.TextScaled = true
userLabel.BackgroundTransparency = 1
userLabel.TextColor3 = Color3.new(1,1,1)

-- Botón de carpeta Scripts
local scriptsBtn = Instance.new("TextButton", panel)
scriptsBtn.Size = UDim2.new(0.8, 0, 0.07, 0)
scriptsBtn.Position = UDim2.new(0.1, 0, 0.16, 0)
scriptsBtn.Text = "📂 Scripts"
scriptsBtn.Font = Enum.Font.Arcade
scriptsBtn.TextScaled = true
scriptsBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
scriptsBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", scriptsBtn)

-- SUBPANEL de scripts
local subPanel = Instance.new("ScrollingFrame", panel)
subPanel.Size = UDim2.new(0.9, 0, 0.6, 0)
subPanel.Position = UDim2.new(0.05, 0, 0.25, 0)
subPanel.CanvasSize = UDim2.new(0, 0, 5, 0)
subPanel.Visible = false
subPanel.BackgroundTransparency = 0.2
subPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
subPanel.ScrollBarThickness = 6
Instance.new("UICorner", subPanel)

-- Botón de regresar
local backBtn = Instance.new("TextButton", panel)
backBtn.Size = UDim2.new(0.3, 0, 0.07, 0)
backBtn.Position = UDim2.new(0.35, 0, 0.88, 0)
backBtn.Text = "🔙 Regresar"
backBtn.Font = Enum.Font.Arcade
backBtn.TextScaled = true
backBtn.Visible = false
backBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
backBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", backBtn)

-- Scripts para General (puedes añadir más)
local scripts = {
	{"Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{"ESP Player", "https://rawscripts.net/raw/Universal-Script-ESP-PLAYER-1919"},
	{"Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{"Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infinityyield/master/source"},
	{"Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{"Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{"Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{"Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
}

-- Crear botones dentro de subPanel
for i, data in pairs(scripts) do
	local btn = Instance.new("TextButton", subPanel)
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.Position = UDim2.new(0.05, 0, 0, (i-1) * 40)
	btn.Text = "▶️ " .. data[1]
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(data[2]))()
	end)
end

-- Activar subpanel
scriptsBtn.MouseButton1Click:Connect(function()
	scriptsBtn.Visible = false
	subPanel.Visible = true
	backBtn.Visible = true
end)

-- Regresar
backBtn.MouseButton1Click:Connect(function()
	scriptsBtn.Visible = true
	subPanel.Visible = false
	backBtn.Visible = false
end)

-- Botón flotante "C"
local floatBtn = Instance.new("TextButton", gui)
floatBtn.Size = UDim2.new(0, 50, 0, 50)
floatBtn.Position = UDim2.new(0, 20, 0, 20)
floatBtn.Text = "C"
floatBtn.Font = Enum.Font.Arcade
floatBtn.TextScaled = true
floatBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
floatBtn.TextColor3 = Color3.new(1,1,1)
floatBtn.Draggable = true
floatBtn.Active = true
Instance.new("UICorner", floatBtn)

floatBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Efecto Rainbow
RunService.RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	userLabel.TextColor3 = color
	scriptsBtn.TextColor3 = color
	backBtn.TextColor3 = color
	for _, v in pairs(subPanel:GetChildren()) do
		if v:IsA("TextButton") then
			v.TextColor3 = color
		end
	end
end)

-- Comprobar contraseña
check.MouseButton1Click:Connect(function()
	if input.Text == "AYAM" then
		passFrame:Destroy()
	else
		passLabel.Text = "❌ Código incorrecto"
	end
end)
