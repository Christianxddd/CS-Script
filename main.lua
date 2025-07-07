local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianMinecraftPanel"
gui.ResetOnSpawn = false

-- Función Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- Botón flotante con "C"
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 50, 0, 50)
cBtn.Position = UDim2.new(0, 10, 0.5, -25)
cBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
cBtn.Text = "C"
cBtn.TextScaled = true
cBtn.Font = Enum.Font.Arcade
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.Draggable = true

-- Panel principal
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 450)
main.Position = UDim2.new(0.5, -160, 0.5, -225)
main.BackgroundColor3 = Color3.fromRGB(40, 80, 40) -- Verde tipo Minecraft
main.BackgroundTransparency = 0.4
main.Visible = false
main.Draggable = true
main.Active = true

Instance.new("UICorner", main)
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -50, 0, 40)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "Im Christian Sebast"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Minimizar
local minimize = Instance.new("TextButton", main)
minimize.Position = UDim2.new(1, -35, 0, 5)
minimize.Size = UDim2.new(0, 25, 0, 25)
minimize.Text = "-"
minimize.TextScaled = true
minimize.Font = Enum.Font.Arcade
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local contentFrame = Instance.new("Frame", main)
contentFrame.Position = UDim2.new(0, 10, 0, 50)
contentFrame.Size = UDim2.new(1, -20, 1, -60)
contentFrame.BackgroundTransparency = 1
contentFrame.ClipsDescendants = true

-- Scroll y búsqueda
local scroll = Instance.new("ScrollingFrame", contentFrame)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", scroll)
UIList.Padding = UDim.new(0, 6)
UIList.SortOrder = Enum.SortOrder.LayoutOrder

local searchBar = Instance.new("TextBox", contentFrame)
searchBar.PlaceholderText = "🔍 Buscar script..."
searchBar.Size = UDim2.new(1, 0, 0, 30)
searchBar.Position = UDim2.new(0, 0, 1, -30)
searchBar.Font = Enum.Font.Arcade
searchBar.TextScaled = true
searchBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
searchBar.TextColor3 = Color3.new(1, 1, 1)

-- Función para crear carpeta (comandos o juegos)
local function crearCarpeta(nombre)
	local folder = Instance.new("Frame")
	folder.Size = UDim2.new(1, 0, 0, 30)
	folder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	local btn = Instance.new("TextButton", folder)
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.Text = "📂 " .. nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.Arcade
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundTransparency = 1

	local contenido = Instance.new("Frame", scroll)
	contenido.Size = UDim2.new(1, -10, 0, 0)
	contenido.BackgroundTransparency = 1
	contenido.ClipsDescendants = true
	contenido.Visible = false
	local layout = Instance.new("UIListLayout", contenido)
	layout.Padding = UDim.new(0, 5)

	btn.MouseButton1Click:Connect(function()
		contenido.Visible = not contenido.Visible
		scroll.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 20)
	end)

	scroll.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 20)
	return contenido, folder
end

-- Función para crear botón de script
local function crearScript(nombre, url, contenedor)
	local b = Instance.new("TextButton", contenedor)
	b.Size = UDim2.new(1, 0, 0, 30)
	b.Text = nombre
	b.TextScaled = true
	b.Font = Enum.Font.Arcade
	b.TextColor3 = Color3.new(1, 1, 1)
	b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	b.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url))()
	end)
	contenedor.Size = UDim2.new(1, -10, 0, contenedor.UIListLayout.AbsoluteContentSize.Y + 5)
end

-- Carpeta: Juegos Populares
local juegosFolder, juegosBtn = crearCarpeta("Juegos Populares")
juegosBtn.Parent = scroll

crearScript("🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot", juegosFolder)
crearScript("🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular", juegosFolder)
crearScript("🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", juegosFolder)
crearScript("🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau", juegosFolder)

-- Carpeta: Comandos
local comandosFolder, comandosBtn = crearCarpeta("Comandos")
comandosBtn.Parent = scroll

crearScript("🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt", comandosFolder)
crearScript("🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194", comandosFolder)
crearScript("👁 ESP Player", "https://pastebin.com/raw/EaYzA0bL", comandosFolder) -- Sustituye por tu script real
crearScript("⚙ Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", comandosFolder)

-- Mostrar panel
cBtn.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
end)

minimize.MouseButton1Click:Connect(function()
	main.Visible = false
end)

-- Rainbow
game:GetService("RunService").RenderStepped:Connect(function()
	local col = rainbow()
	stroke.Color = col
	title.TextColor3 = col
	for _, child in pairs(scroll:GetDescendants()) do
		if child:IsA("TextButton") then
			child.TextColor3 = col
		end
	end
end)

-- Búsqueda
searchBar:GetPropertyChangedSignal("Text"):Connect(function()
	local texto = searchBar.Text:lower()
	for _, folder in pairs(scroll:GetChildren()) do
		if folder:IsA("Frame") then
			for _, btn in pairs(folder:GetChildren()) do
				if btn:IsA("TextButton") then
					btn.Visible = btn.Text:lower():find(texto) ~= nil
				end
			end
		end
	end
end)
