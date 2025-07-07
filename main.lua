local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianPanel"
gui.ResetOnSpawn = false

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- Botón Icono C
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 45, 0, 45)
icon.Position = UDim2.new(0, 20, 0, 20)
icon.Text = "C"
icon.TextScaled = true
icon.Font = Enum.Font.Arcade
icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
icon.TextColor3 = Color3.new(1, 1, 1)
icon.Draggable = true

-- Panel Principal REDUCIDO
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 350, 0, 470) -- 🔽 reducido
panel.Position = UDim2.new(0.5, -175, 0.5, -235)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.5
panel.Active = true
panel.Draggable = true
panel.Visible = false

local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 35)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "By Christian"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Datos del usuario
local datos = Instance.new("TextLabel", panel)
datos.Size = UDim2.new(1, 0, 0, 22)
datos.Position = UDim2.new(0, 0, 0, 35)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.Gotham
datos.TextColor3 = Color3.fromRGB(255, 255, 255)
datos.BackgroundTransparency = 1

-- Barra de búsqueda
local search = Instance.new("TextBox", panel)
search.Size = UDim2.new(0.9, 0, 0, 25)
search.Position = UDim2.new(0.05, 0, 0, 60)
search.PlaceholderText = "Buscar scripts..."
search.Text = ""
search.TextScaled = true
search.Font = Enum.Font.Gotham
search.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
search.TextColor3 = Color3.new(1, 1, 1)

-- Scroll principal
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(0.9, 0, 0.7, 0)
scroll.Position = UDim2.new(0.05, 0, 0, 95)
scroll.CanvasSize = UDim2.new(0, 0, 5, 0)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)

-- Crear carpeta
local function crearCarpeta(nombre, scripts)
	local folderBtn = Instance.new("TextButton", scroll)
	folderBtn.Size = UDim2.new(1, 0, 0, 35)
	folderBtn.Text = "📁 " .. nombre
	folderBtn.TextScaled = true
	folderBtn.Font = Enum.Font.Arcade
	folderBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	folderBtn.TextColor3 = Color3.new(1, 1, 1)

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

	local backBtn = Instance.new("TextButton", subFrame)
	backBtn.Size = UDim2.new(0.3, 0, 0, 25)
	backBtn.Position = UDim2.new(0.35, 0, 1, -35)
	backBtn.Text = "⬅ Regresar"
	backBtn.TextScaled = true
	backBtn.Font = Enum.Font.Arcade
	backBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	backBtn.TextColor3 = Color3.new(1, 1, 1)
	backBtn.MouseButton1Click:Connect(function()
		subFrame.Visible = false
		panel.Visible = true
	end)

	local subScroll = scroll:Clone()
	subScroll.Parent = subFrame
	subScroll.Position = UDim2.new(0.05, 0, 0.2, 0)
	subScroll.Size = UDim2.new(0.9, 0, 0.75, 0)
	for _, data in pairs(scripts) do
		local sBtn = Instance.new("TextButton", subScroll)
		sBtn.Size = UDim2.new(1, 0, 0, 35)
		sBtn.Text = data.nombre
		sBtn.TextScaled = true
		sBtn.Font = Enum.Font.Arcade
		sBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		sBtn.TextColor3 = Color3.new(1, 1, 1)
		sBtn.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(data.url))()
		end)
	end

	folderBtn.MouseButton1Click:Connect(function()
		panel.Visible = false
		subFrame.Visible = true
	end)
end

-- Lista de scripts
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

-- Mostrar panel
icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, el in pairs(panel:GetDescendants()) do
		if el:IsA("TextLabel") or el:IsA("TextButton") then
			el.TextColor3 = color
		end
	end
end)
