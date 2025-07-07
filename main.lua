--===[ ChristianSebas Panel Gamer V2 Final ]===--

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CS_PanelGamer"
gui.ResetOnSpawn = false

--===[ Rainbow Effect ]===--
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

--===[ Botón Icono "C" ]===--
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 60, 0, 60)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
openBtn.Text = "C"
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.Font = Enum.Font.Arcade
openBtn.TextScaled = true
openBtn.Draggable = true
openBtn.Name = "OpenBtn"

--===[ Panel Principal ]===--
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0.4, 0, 0.7, 0)
panel.Position = UDim2.new(0.3, 0, 0.15, 0)
panel.BackgroundTransparency = 0.3
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.Visible = false
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

--===[ Título y Datos Usuario ]===--
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

local userInfo = Instance.new("TextLabel", panel)
userInfo.Position = UDim2.new(0, 0, 0, 35)
userInfo.Size = UDim2.new(1, 0, 0, 25)
userInfo.Text = "Roblox: Christian_xyx | TikTok: @christ_sebast_7d"
userInfo.TextScaled = true
userInfo.Font = Enum.Font.Arcade
userInfo.TextColor3 = Color3.new(1,1,1)
userInfo.BackgroundTransparency = 1

--===[ Scroll Area ]===--
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Position = UDim2.new(0, 0, 0, 60)
scroll.Size = UDim2.new(1, 0, 1, -60)
scroll.CanvasSize = UDim2.new(0,0,1,0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", scroll)
UIList.Padding = UDim.new(0, 5)
UIList.SortOrder = Enum.SortOrder.LayoutOrder

--===[ Buscar Barra ]===--
local buscar = Instance.new("TextBox", panel)
buscar.PlaceholderText = "🔍 Buscar script..."
buscar.Size = UDim2.new(1, 0, 0, 25)
buscar.Position = UDim2.new(0, 0, 1, -25)
buscar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
buscar.TextColor3 = Color3.new(1,1,1)
buscar.Font = Enum.Font.Arcade
buscar.TextScaled = true

--===[ Función crear carpetas ]===--
local function crearCarpeta(nombre)
	local folder = Instance.new("Frame")
	folder.Size = UDim2.new(1, 0, 0, 0)
	folder.BackgroundTransparency = 1
	folder.Visible = false
	local list = Instance.new("UIListLayout", folder)
	list.Padding = UDim.new(0, 4)
	list.SortOrder = Enum.SortOrder.LayoutOrder

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 40)
	btn.Text = "📂 " .. nombre
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Parent = scroll

	btn.MouseButton1Click:Connect(function()
		for _, c in pairs(scroll:GetChildren()) do
			if c:IsA("Frame") then c.Visible = false end
		end
		folder.Visible = true
	end)

	folder.Parent = scroll
	return folder
end

--===[ Crear Script Button ]===--
local function crearScript(nombre, url, parent)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.Text = nombre
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Parent = parent

	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url))()
	end)
end

--===[ Crear Regresar Button ]===--
local function crearRegresar(parent)
	local volver = Instance.new("TextButton", parent)
	volver.Size = UDim2.new(1, 0, 0, 35)
	volver.Text = "🔙 Regresar"
	volver.Font = Enum.Font.Arcade
	volver.TextScaled = true
	volver.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	volver.TextColor3 = Color3.new(1,1,1)

	volver.MouseButton1Click:Connect(function()
		for _, c in pairs(scroll:GetChildren()) do
			if c:IsA("Frame") then c.Visible = false end
		end
	end)
end

--===[ Carpetas: Juegos Populares / Comandos / General ]===--
local juegosPopulares, jpBtn = crearCarpeta("Juegos Populares")
local comandos, comBtn = crearCarpeta("Comandos")
local general, genBtn = crearCarpeta("General")

-- Juegos Populares
crearScript("🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot", juegosPopulares)
crearScript("🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular", juegosPopulares)
crearScript("🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", juegosPopulares)
crearScript("🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau", juegosPopulares)
crearRegresar(juegosPopulares)

-- Comandos
crearScript("🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt", comandos)
crearScript("🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194", comandos)
crearScript("👁 ESP Player", "https://raw.githubusercontent.com/JaZuDev/ESP-Script/main/ESP", comandos)
crearScript("⌨️ Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", comandos)
crearRegresar(comandos)

-- General (solo muestra 10 por espacio; puedes ampliar tú)
local generalList = {
	{"🌟 Auto Farm Universal", "https://pastebin.com/raw/ZYxyz123"},
	{"🎯 Aimlock System", "https://pastebin.com/raw/XYx567"},
	{"🕵️ NoClip + ESP", "https://pastebin.com/raw/NoClipESP"},
	{"🧲 Magnet Simulator", "https://pastebin.com/raw/MagnetSim"},
	{"🎮 Arsenal GUI", "https://pastebin.com/raw/Arsenal123"},
	-- Añade más aquí hasta 40 scripts...
}
for _, data in pairs(generalList) do
	crearScript(data[1], data[2], general)
end
crearRegresar(general)

--===[ Búsqueda ]===--
buscar:GetPropertyChangedSignal("Text"):Connect(function()
	local text = buscar.Text:lower()
	for _, f in ipairs({juegosPopulares, comandos, general}) do
		for _, c in pairs(f:GetChildren()) do
			if c:IsA("TextButton") then
				c.Visible = c.Text:lower():find(text) ~= nil or c.Text:find("Regresar")
			end
		end
	end
end)

--===[ Botón "C" Toggle Panel ]===--
openBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

--===[ Rainbow dinámico ]===--
game:GetService("RunService").RenderStepped:Connect(function()
	local col = rainbow()
	stroke.Color = col
	for _, v in pairs(panel:GetDescendants()) do
		if v:IsA("TextButton") or v:IsA("TextLabel") then
			v.TextColor3 = col
		end
	end
end)
