-- Panel profesional "By Christian" con carpetas, barra de búsqueda, efecto rainbow y todo completo
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "Christian_ProPanel"
gui.ResetOnSpawn = false

-- Función rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2) * 127 + 128,
		math.sin(t + 4) * 127 + 128
	)
end

-- Icono flotante "C"
local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 20, 0, 20)
icon.Text = "C"
icon.TextScaled = true
icon.Font = Enum.Font.Arcade
icon.BackgroundColor3 = Color3.fromRGB(20,20,20)
icon.TextColor3 = Color3.new(1,1,1)
icon.Draggable = true
icon.Parent = gui

-- Panel principal
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 450, 0, 500)
main.Position = UDim2.new(0.5, -225, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = false
main.Active = true
main.Draggable = true

local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- Datos del usuario
local datos = Instance.new("TextLabel", main)
datos.Size = UDim2.new(1, 0, 0, 20)
datos.Position = UDim2.new(0, 0, 0, 40)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.Gotham
datos.TextColor3 = Color3.fromRGB(255,255,255)
datos.BackgroundTransparency = 1

-- Botón regresar
local function crearRegresar(parent)
	local back = Instance.new("TextButton", parent)
	back.Size = UDim2.new(0.3, 0, 0, 30)
	back.Position = UDim2.new(0.35, 0, 1, -40)
	back.Text = "⬅ Regresar"
	back.TextScaled = true
	back.Font = Enum.Font.Arcade
	back.BackgroundColor3 = Color3.fromRGB(50,50,50)
	back.TextColor3 = Color3.new(1,1,1)
	return back
end

-- Barra de búsqueda
local buscador = Instance.new("TextBox", main)
buscador.Size = UDim2.new(0.9, 0, 0, 30)
buscador.Position = UDim2.new(0.05, 0, 0, 70)
buscador.PlaceholderText = "Buscar scripts..."
buscador.Text = ""
buscador.TextScaled = true
buscador.Font = Enum.Font.Gotham
buscador.BackgroundColor3 = Color3.fromRGB(35,35,35)
buscador.TextColor3 = Color3.new(1,1,1)

-- Contenedor de botones
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(0.9, 0, 0.72, 0)
scroll.Position = UDim2.new(0.05, 0, 0, 110)
scroll.CanvasSize = UDim2.new(0, 0, 5, 0)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)

-- Función para crear carpetas
local function crearCarpeta(nombre, scripts)
	local folderBtn = Instance.new("TextButton", scroll)
	folderBtn.Size = UDim2.new(1, 0, 0, 40)
	folderBtn.Text = "📁 " .. nombre
	folderBtn.TextScaled = true
	folderBtn.Font = Enum.Font.Arcade
	folderBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
	folderBtn.TextColor3 = Color3.new(1,1,1)

	local subFrame = Instance.new("Frame", gui)
	subFrame.Size = main.Size
	subFrame.Position = main.Position
	subFrame.BackgroundColor3 = main.BackgroundColor3
	subFrame.Visible = false
	subFrame.Active = true
	subFrame.Draggable = true
	local stroke2 = stroke:Clone()
	stroke2.Parent = subFrame

	local titulo = title:Clone()
	titulo.Parent = subFrame

	local volver = crearRegresar(subFrame)
	volver.MouseButton1Click:Connect(function()
		subFrame.Visible = false
		main.Visible = true
	end)

	local subScroll = scroll:Clone()
	subScroll.Parent = subFrame
	subScroll.Position = UDim2.new(0.05, 0, 0.2, 0)
	subScroll.Size = UDim2.new(0.9, 0, 0.75, 0)
	for _, data in pairs(scripts) do
		local sBtn = Instance.new("TextButton", subScroll)
		sBtn.Size = UDim2.new(1, 0, 0, 40)
		sBtn.Text = data.nombre
		sBtn.TextScaled = true
		sBtn.Font = Enum.Font.Arcade
		sBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
		sBtn.TextColor3 = Color3.new(1,1,1)
		sBtn.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(data.url))()
		end)
	end

	folderBtn.MouseButton1Click:Connect(function()
		main.Visible = false
		subFrame.Visible = true
	end)
end

-- Scripts organizados
local juegosPopulares = {
	{nombre = "🧠 Brainlot", url = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{nombre = "🚓 Jailbreak", url = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{nombre = "🚂 Dead Rails", url = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{nombre = "🍉 Blox Fruits", url = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
}

local comandos = {
	{nombre = "🚀 Fly V3", url = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{nombre = "🌀 Touch Fling", url = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{nombre = "🛠 Infinity Yield", url = "https://raw.githubusercontent.com/EdgeIY/infinityyield/master/source"},
	{nombre = "👁 ESP Player", url = "https://raw.githubusercontent.com/kickz2/Roblox-Scripts/main/ESP.lua"},
}

crearCarpeta("🎮 Juegos Populares", juegosPopulares)
crearCarpeta("🧰 Comandos", comandos)

-- Mostrar/ocultar panel
icon.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
end)

-- Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local c = rainbow()
	stroke.Color = c
	stroke2.Color = c
	for _, el in pairs(main:GetDescendants()) do
		if el:IsA("TextLabel") or el:IsA("TextButton") then
			el.TextColor3 = c
		end
	end
end)
