-- GUI Profesional by ChristianSebast - Juegos Populares con pestaña y botón de regreso

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebastUI"
gui.ResetOnSpawn = false

-- Rainbow dinámico
local function rainbow()
	local t = tick()
	return Color3.fromHSV(t % 5 / 5, 1, 1)
end

-- Botón flotante
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
cBtn.BorderSizePixel = 0
cBtn.Text = "C"
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.TextScaled = true
cBtn.Font = Enum.Font.GothamBold
cBtn.Draggable = true

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 320, 0, 450)
panel.Position = UDim2.new(0, 100, 0, 80)
panel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
panel.BackgroundTransparency = 0.3
panel.Visible = false
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Im Christian Sebast"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1

-- Panel secundario (pestaña de juegos)
local gamePanel = Instance.new("Frame", gui)
gamePanel.Size = UDim2.new(0, 320, 0, 450)
gamePanel.Position = panel.Position
gamePanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
gamePanel.BackgroundTransparency = 0.3
gamePanel.Visible = false
gamePanel.Active = true
gamePanel.Draggable = true
Instance.new("UICorner", gamePanel)
local stroke2 = Instance.new("UIStroke", gamePanel)
stroke2.Thickness = 2

local gameTitle = Instance.new("TextLabel", gamePanel)
gameTitle.Size = UDim2.new(1, 0, 0, 40)
gameTitle.Text = "🎮 Juegos Populares"
gameTitle.TextColor3 = Color3.new(1, 1, 1)
gameTitle.Font = Enum.Font.GothamBold
gameTitle.TextScaled = true
gameTitle.BackgroundTransparency = 1

-- Función para crear botones de script
local function crearBoton(nombre, posY, scriptUrl, parent)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.Position = UDim2.new(0.05, 0, 0, posY)
	btn.Text = nombre
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptUrl))()
	end)
end

-- Scripts en el panel de juegos
local juegos = {
	{"🧠 Steal Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{"🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{"🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{"🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
	-- Puedes agregar más aquí
}

for i, data in ipairs(juegos) do
	crearBoton(data[1], 50 + (i - 1) * 45, data[2], gamePanel)
end

-- Botón de regresar
local backBtn = Instance.new("TextButton", gamePanel)
backBtn.Size = UDim2.new(0.5, 0, 0, 35)
backBtn.Position = UDim2.new(0.25, 0, 1, -45)
backBtn.Text = "🔙 Regresar"
backBtn.TextColor3 = Color3.new(1, 1, 1)
backBtn.Font = Enum.Font.GothamBold
backBtn.TextScaled = true
backBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
backBtn.MouseButton1Click:Connect(function()
	gamePanel.Visible = false
	panel.Visible = true
end)

-- Botón para ir a juegos populares
local juegosBtn = Instance.new("TextButton", panel)
juegosBtn.Size = UDim2.new(0.9, 0, 0, 35)
juegosBtn.Position = UDim2.new(0.05, 0, 0, 60)
juegosBtn.Text = "🎮 Juegos Populares"
juegosBtn.TextColor3 = Color3.new(1, 1, 1)
juegosBtn.Font = Enum.Font.GothamBold
juegosBtn.TextScaled = true
juegosBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
juegosBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
	gamePanel.Visible = true
end)

-- Mostrar/ocultar panel principal
cBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
	gamePanel.Visible = false
end)

-- Rainbow dinámico en tiempo real
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	stroke2.Color = color
	title.TextColor3 = color
	gameTitle.TextColor3 = color
	juegosBtn.TextColor3 = color
	backBtn.TextColor3 = color
	for _, v in pairs(gamePanel:GetChildren()) do
		if v:IsA("TextButton") then
			v.TextColor3 = color
		end
	end
end)
