local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianPanel"
gui.ResetOnSpawn = false

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- Botón "C"
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 40, 0, 40)
icon.Position = UDim2.new(0, 20, 0, 20)
icon.Text = "C"
icon.TextScaled = true
icon.Font = Enum.Font.Arcade
icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
icon.TextColor3 = Color3.new(1, 1, 1)
icon.Draggable = true

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 280, 0, 400)
panel.Position = UDim2.new(0.5, -140, 0.5, -200)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.5
panel.Active = true
panel.Draggable = true
panel.Visible = false

local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título y datos
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "By Christian"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

local datos = Instance.new("TextLabel", panel)
datos.Size = UDim2.new(1, 0, 0, 20)
datos.Position = UDim2.new(0, 0, 0, 30)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.Font = Enum.Font.Gotham
datos.TextScaled = true
datos.TextColor3 = Color3.fromRGB(255, 255, 255)
datos.BackgroundTransparency = 1

-- Búsqueda
local search = Instance.new("TextBox", panel)
search.Size = UDim2.new(0.9, 0, 0, 22)
search.Position = UDim2.new(0.05, 0, 0, 52)
search.PlaceholderText = "Buscar scripts..."
search.Text = ""
search.Font = Enum.Font.Gotham
search.TextScaled = true
search.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
search.TextColor3 = Color3.new(1, 1, 1)

-- Área scroll
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(0.9, 0, 0.7, 0)
scroll.Position = UDim2.new(0.05, 0, 0, 80)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)

-- Scripts por carpeta
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

-- FUNCION PARA CREAR CARPETA CON SUBVENTANA
local function crearCarpeta(nombre, scripts)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.Text = "📁 " .. nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.Arcade
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.TextColor3 = Color3.new(1, 1, 1)

	-- Subventana
	local subFrame = Instance.new("Frame", gui)
	subFrame.Size = panel.Size
	subFrame.Position = panel.Position
	subFrame.BackgroundColor3 = panel.BackgroundColor3
	subFrame.BackgroundTransparency = panel.BackgroundTransparency
	subFrame.Visible = false
	subFrame.Active = true
	subFrame.Draggable = true

	local stroke2 = Instance.new("UIStroke", subFrame)
	stroke2.Thickness = 2

	local titulo = title:Clone()
	titulo.Parent = subFrame

	local regresar = Instance.new("TextButton", subFrame)
	regresar.Size = UDim2.new(0.6, 0, 0, 22)
	regresar.Position = UDim2.new(0.2, 0, 1, -30)
	regresar.Text = "⬅ Regresar"
	regresar.TextScaled = true
	regresar.Font = Enum.Font.Arcade
	regresar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	regresar.TextColor3 = Color3.new(1, 1, 1)
	regresar.MouseButton1Click:Connect(function()
		subFrame.Visible = false
		panel.Visible = true
	end)

	local sScroll = Instance.new("ScrollingFrame", subFrame)
	sScroll.Size = UDim2.new(0.9, 0, 0.7, 0)
	sScroll.Position = UDim2.new(0.05, 0, 0, 50)
	sScroll.CanvasSize = UDim2.new(0, 0, 3, 0)
	sScroll.ScrollBarThickness = 4
	sScroll.BackgroundTransparency = 1
	local layout2 = Instance.new("UIListLayout", sScroll)
	layout2.Padding = UDim.new(0, 5)
	sScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

	for _, scriptData in ipairs(scripts) do
		local sBtn = Instance.new("TextButton", sScroll)
		sBtn.Size = UDim2.new(1, 0, 0, 28)
		sBtn.Text = scriptData.nombre
		sBtn.TextScaled = true
		sBtn.Font = Enum.Font.Arcade
		sBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		sBtn.TextColor3 = Color3.new(1, 1, 1)
		sBtn.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(scriptData.url))()
		end)
	end

	btn.MouseButton1Click:Connect(function()
		panel.Visible = false
		subFrame.Visible = true
	end)
end

-- Crear carpetas funcionales
crearCarpeta("🎮 Juegos Populares", juegosPopulares)
crearCarpeta("🧰 Comandos", comandos)

-- Mostrar/ocultar panel
icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Rainbow efecto
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, el in pairs(panel:GetDescendants()) do
		if el:IsA("TextLabel") or el:IsA("TextButton") then
			el.TextColor3 = color
		end
	end
end)
