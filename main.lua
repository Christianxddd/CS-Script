-- BY CHRISTIAN - PANEL PRO VERTICAL CON CÓDIGO DE ACCESO

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Crear GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianPanelPro"
gui.ResetOnSpawn = false

-- BLOQUEO DE ACCESO
local blockFrame = Instance.new("Frame", gui)
blockFrame.Size = UDim2.new(1, 0, 1, 0)
blockFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local input = Instance.new("TextBox", blockFrame)
input.Size = UDim2.new(0, 300, 0, 50)
input.Position = UDim2.new(0.5, -150, 0.5, -25)
input.PlaceholderText = "Ingresa el código"
input.TextScaled = true
input.Font = Enum.Font.SourceSansBold
input.TextColor3 = Color3.new(1, 1, 1)
input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local btn = Instance.new("TextButton", blockFrame)
btn.Size = UDim2.new(0, 120, 0, 40)
btn.Position = UDim2.new(0.5, -60, 0.5, 40)
btn.Text = "Verificar"
btn.TextScaled = true
btn.Font = Enum.Font.SourceSansBold
btn.TextColor3 = Color3.new(1, 1, 1)
btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

-- PANEL PRINCIPAL (oculto hasta ingresar código)
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0.6, 0, 0.85, 0)
panel.Position = UDim2.new(0.2, 0, 0.075, 0)
panel.BackgroundTransparency = 0.3
panel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
panel.Visible = false
panel.ClipsDescendants = true
panel.Active = true
panel.Draggable = true

local uiCorner = Instance.new("UICorner", panel)
local uiStroke = Instance.new("UIStroke", panel)
uiStroke.Thickness = 2

-- Rainbow efecto
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2) * 127 + 128,
		math.sin(t + 4) * 127 + 128
	)
end

RunService.RenderStepped:Connect(function()
	local c = rainbow()
	uiStroke.Color = c
	for _, v in pairs(panel:GetDescendants()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			v.TextColor3 = c
		end
	end
end)

-- ICONO LETRA "C"
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 20, 0, 20)
icon.Text = "C"
icon.Font = Enum.Font.Arcade
icon.TextScaled = true
icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
icon.TextColor3 = Color3.new(1, 1, 1)
icon.Active = true
icon.Draggable = true

icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- TITULO Y DATOS
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "By Christian"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)

local datos = Instance.new("TextLabel", panel)
datos.Position = UDim2.new(0, 0, 0, 40)
datos.Size = UDim2.new(1, 0, 0, 40)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.SourceSansBold
datos.BackgroundTransparency = 1
datos.TextColor3 = Color3.new(1, 1, 1)

-- BARRA DE BÚSQUEDA
local buscador = Instance.new("TextBox", panel)
buscador.Position = UDim2.new(0.05, 0, 0, 85)
buscador.Size = UDim2.new(0.9, 0, 0, 35)
buscador.PlaceholderText = "Buscar scripts..."
buscador.TextScaled = true
buscador.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
buscador.TextColor3 = Color3.new(1,1,1)
buscador.Font = Enum.Font.SourceSansBold

-- SCROLLING PARA CATEGORÍAS
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Position = UDim2.new(0, 0, 0, 130)
scroll.Size = UDim2.new(1, 0, 1, -130)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- CATEGORÍA FACTORY
local function crearCategoria(nombre, scripts)
	local folder = Instance.new("Frame", scroll)
	folder.Size = UDim2.new(1, 0, 0, 30)
	folder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	local btn = Instance.new("TextButton", folder)
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.Text = "📂 "..nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.SourceSansBold
	btn.BackgroundTransparency = 1

	local contenedor = Instance.new("Frame", scroll)
	contenedor.Size = UDim2.new(1, 0, 0, #scripts * 35 + 10)
	contenedor.Visible = false
	local list = Instance.new("UIListLayout", contenedor)
	list.SortOrder = Enum.SortOrder.LayoutOrder
	list.Padding = UDim.new(0, 5)

	for _, data in pairs(scripts) do
		local sBtn = Instance.new("TextButton", contenedor)
		sBtn.Size = UDim2.new(0.95, 0, 0, 30)
		sBtn.Position = UDim2.new(0.025, 0, 0, 0)
		sBtn.Text = data[1]
		sBtn.Font = Enum.Font.SourceSansBold
		sBtn.TextScaled = true
		sBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		sBtn.TextColor3 = Color3.new(1,1,1)
		sBtn.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(data[2]))()
		end)
	end

	btn.MouseButton1Click:Connect(function()
		contenedor.Visible = not contenedor.Visible
	end)
end

-- 🔹 SCRIPTS DE CADA CATEGORÍA

crearCategoria("Juegos Populares", {
	{"🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{"🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{"🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{"🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
})

crearCategoria("Comandos", {
	{"🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{"👁 ESP Player", "https://pastebin.com/raw/F9GZgfBP"},
	{"🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{"⚙️ Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
})

crearCategoria("General", {
	{"🎮 Admin Commands", "https://pastebin.com/raw/RMmR8SSf"},
	{"🧊 Anti-AFK", "https://pastebin.com/raw/VHj6nGAc"},
	{"📡 ESP Universal", "https://pastebin.com/raw/Y8Zxtfr5"},
	{"🗺 Teleport GUI", "https://pastebin.com/raw/xD2RkMW2"},
	-- Agrega más aquí...
})

-- VERIFICACIÓN DE CÓDIGO
btn.MouseButton1Click:Connect(function()
	if input.Text == "AYAM" then
		blockFrame:Destroy()
		panel.Visible = true
	else
		input.Text = ""
		input.PlaceholderText = "Código incorrecto"
	end
end)
