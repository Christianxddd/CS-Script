local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianPanel"
gui.ResetOnSpawn = false

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- Icono botón "C"
local iconBtn = Instance.new("TextButton", gui)
iconBtn.Size = UDim2.new(0, 50, 0, 50)
iconBtn.Position = UDim2.new(0, 10, 0, 10)
iconBtn.Text = "C"
iconBtn.Font = Enum.Font.Arcade
iconBtn.TextScaled = true
iconBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
iconBtn.TextColor3 = Color3.new(1, 1, 1)
iconBtn.Draggable = true

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 300, 0, 500)
panel.Position = UDim2.new(0.5, -150, 0.5, -250)
panel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
panel.Visible = false
panel.Active = true
panel.Draggable = true

local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local c = rainbow()
	stroke.Color = c
	for _, v in pairs(panel:GetDescendants()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			v.TextColor3 = c
		end
	end
end)

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "By Christian"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)

-- Usuario info
local userLabel = Instance.new("TextLabel", panel)
userLabel.Position = UDim2.new(0, 0, 0, 30)
userLabel.Size = UDim2.new(1, 0, 0, 20)
userLabel.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
userLabel.Font = Enum.Font.Arcade
userLabel.TextScaled = true
userLabel.BackgroundTransparency = 1
userLabel.TextColor3 = Color3.new(1, 1, 1)

-- Barra de búsqueda
local searchBox = Instance.new("TextBox", panel)
searchBox.PlaceholderText = "Buscar..."
searchBox.Size = UDim2.new(1, -10, 0, 25)
searchBox.Position = UDim2.new(0, 5, 0, 55)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
searchBox.TextColor3 = Color3.new(1, 1, 1)
searchBox.Font = Enum.Font.Arcade
searchBox.TextScaled = true

-- Contenedor scrollable
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Position = UDim2.new(0, 5, 0, 85)
scroll.Size = UDim2.new(1, -10, 1, -95)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 4)

-- Función para crear carpetas
local function crearCarpeta(nombre)
	local carpeta = Instance.new("TextButton", scroll)
	carpeta.Text = "📁 "..nombre
	carpeta.Font = Enum.Font.Arcade
	carpeta.TextScaled = true
	carpeta.Size = UDim2.new(1, -10, 0, 30)
	carpeta.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	
	local contenido = Instance.new("Frame", scroll)
	contenido.Size = UDim2.new(1, -20, 0, 0)
	contenido.BackgroundTransparency = 1
	contenido.Visible = false
	local lista = Instance.new("UIListLayout", contenido)
	lista.Padding = UDim.new(0, 3)

	carpeta.MouseButton1Click:Connect(function()
		contenido.Visible = not contenido.Visible
	end)

	return contenido
end

-- Función para botones de script
local function crearBotonScript(padre, texto, url)
	local b = Instance.new("TextButton", padre)
	b.Text = texto
	b.Size = UDim2.new(1, 0, 0, 25)
	b.Font = Enum.Font.Arcade
	b.TextScaled = true
	b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	b.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url))()
	end)
end

-- Crear carpeta Juegos Populares
local juegosFolder = crearCarpeta("Juegos Populares")
crearBotonScript(juegosFolder, "🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot")
crearBotonScript(juegosFolder, "🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular")
crearBotonScript(juegosFolder, "🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails")
crearBotonScript(juegosFolder, "🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau")
-- Agrega 10 más si deseas...

-- Crear carpeta Comandos
local comandosFolder = crearCarpeta("Comandos")
crearBotonScript(comandosFolder, "🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
crearBotonScript(comandosFolder, "🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194")
crearBotonScript(comandosFolder, "👁 ESP Player", "https://raw.githubusercontent.com/ElScriptYT/Scripts/main/ESP.lua")
crearBotonScript(comandosFolder, "💻 Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

-- Buscar
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local texto = string.lower(searchBox.Text)
	for _, obj in pairs(scroll:GetChildren()) do
		if obj:IsA("TextButton") and not obj.Text:lower():find(texto) and texto ~= "" then
			obj.Visible = false
		else
			obj.Visible = true
		end
	end
end)

-- Mostrar panel
iconBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)
