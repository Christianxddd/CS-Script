local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianHub"
gui.ResetOnSpawn = false

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- Botón "C"
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Text = "C"
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.Arcade
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Draggable = true

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 350, 0, 500)
panel.Position = UDim2.new(0.5, -175, 0.5, -250)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.BackgroundTransparency = 0.2
panel.Visible = false
panel.Active = true
panel.Draggable = true

-- Stroke rainbow
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

-- Datos personales
local userInfo = Instance.new("TextLabel", panel)
userInfo.Position = UDim2.new(0, 0, 0, 35)
userInfo.Size = UDim2.new(1, 0, 0, 25)
userInfo.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
userInfo.TextScaled = true
userInfo.Font = Enum.Font.Gotham
userInfo.TextColor3 = Color3.new(1, 1, 1)
userInfo.BackgroundTransparency = 1

-- Botón minimizar
local minimizeBtn = Instance.new("TextButton", panel)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -35, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.Arcade
minimizeBtn.TextScaled = true
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)

-- Contenedor scrollable
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Position = UDim2.new(0, 10, 0, 70)
scroll.Size = UDim2.new(1, -20, 1, -80)
scroll.CanvasSize = UDim2.new(0, 0, 0, 800)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

-- UIList para ordenar
local list = Instance.new("UIListLayout", scroll)
list.Padding = UDim.new(0, 10)
list.SortOrder = Enum.SortOrder.LayoutOrder

-- Búsqueda
local searchBox = Instance.new("TextBox", panel)
searchBox.PlaceholderText = "Buscar..."
searchBox.Position = UDim2.new(0, 10, 0, 45)
searchBox.Size = UDim2.new(0.7, 0, 0, 20)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
searchBox.TextColor3 = Color3.new(1, 1, 1)
searchBox.TextScaled = true
searchBox.Font = Enum.Font.Gotham

-- Función para crear secciones
local function crearSeccion(nombre)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, -10, 0, 25)
	frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	
	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = "🔹 " .. nombre
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.new(1,1,1)
	label.BackgroundTransparency = 1
	
	return frame
end

-- Función para crear botones
local function crearBoton(nombre, scriptUrl)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -10, 0, 35)
	btn.Text = nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.Gotham
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptUrl))()
	end)
	return btn
end

-- Agregar secciones y scripts
local seccionJuegos = crearSeccion("🎮 Juegos Populares")
seccionJuegos.LayoutOrder = 1
seccionJuegos.Name = "Juegos"
seccionJuegos.Parent = scroll

local scriptsJuegos = {
	{"🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{"🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{"🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{"🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
}

for _, data in pairs(scriptsJuegos) do
	local btn = crearBoton(data[1], data[2])
	btn.Parent = scroll
end

local seccionComandos = crearSeccion("🛠️ Comandos")
seccionComandos.LayoutOrder = 2
seccionComandos.Name = "Comandos"
seccionComandos.Parent = scroll

local scriptsComandos = {
	{"🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{"🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{"👁 ESP Player", "https://raw.githubusercontent.com/RandomScripter123456/ESP-Gui/main/ESP.lua"},
	{"⚙ Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}

for _, data in pairs(scriptsComandos) do
	local btn = crearBoton(data[1], data[2])
	btn.Parent = scroll
end

-- Filtrar con búsqueda
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local filtro = searchBox.Text:lower()
	for _, item in ipairs(scroll:GetChildren()) do
		if item:IsA("TextButton") then
			item.Visible = item.Text:lower():find(filtro) ~= nil
		elseif item:IsA("Frame") then
			item.Visible = true
		end
	end
end)

-- Mostrar panel
toggleBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Minimizar
minimizeBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
end)

-- Rainbow efecto
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	for _, item in ipairs(scroll:GetChildren()) do
		if item:IsA("TextButton") then
			item.TextColor3 = color
		elseif item:IsA("Frame") then
			local label = item:FindFirstChildWhichIsA("TextLabel")
			if label then label.TextColor3 = color end
		end
	end
end)
