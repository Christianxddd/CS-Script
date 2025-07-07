local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianPanelUI"
gui.ResetOnSpawn = false

-- Botón flotante con la letra C
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 50, 0, 50)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.Text = "C"
cBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
cBtn.TextColor3 = Color3.new(1,1,1)
cBtn.Font = Enum.Font.Arcade
cBtn.TextScaled = true
cBtn.Draggable = true

-- Función rainbow
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 420, 0, 520)
panel.Position = UDim2.new(0.5, -210, 0.5, -260)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.BackgroundTransparency = 0.2
panel.Visible = false
panel.Active = true
panel.Draggable = true

local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

local uilist = Instance.new("UIListLayout", panel)
uilist.SortOrder = Enum.SortOrder.LayoutOrder
uilist.Padding = UDim.new(0, 5)

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.LayoutOrder = 0

-- Datos
local datos = Instance.new("TextLabel", panel)
datos.Size = UDim2.new(1, 0, 0, 25)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.Code
datos.TextColor3 = Color3.new(1,1,1)
datos.BackgroundTransparency = 1
datos.LayoutOrder = 1

-- Búsqueda
local search = Instance.new("TextBox", panel)
search.Size = UDim2.new(1, -20, 0, 30)
search.Text = ""
search.PlaceholderText = "🔍 Buscar..."
search.Font = Enum.Font.Code
search.TextScaled = true
search.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
search.TextColor3 = Color3.new(1,1,1)
search.Position = UDim2.new(0, 10, 0, 0)
search.LayoutOrder = 2

-- Contenedor scroll
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, -10, 1, -160)
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1
scroll.LayoutOrder = 3

local list = Instance.new("UIListLayout", scroll)
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0, 5)

-- Función para crear carpetas
local function crearCarpeta(nombre)
	local folder = Instance.new("TextButton", scroll)
	folder.Size = UDim2.new(1, 0, 0, 35)
	folder.Text = "📁 " .. nombre
	folder.TextScaled = true
	folder.Font = Enum.Font.GothamBold
	folder.BackgroundColor3 = Color3.fromRGB(40,40,40)
	folder.TextColor3 = Color3.new(1,1,1)

	local contenido = Instance.new("Frame", scroll)
	contenido.Size = UDim2.new(1, 0, 0, 0)
	contenido.AutomaticSize = Enum.AutomaticSize.Y
	contenido.BackgroundTransparency = 1
	contenido.Visible = false

	local lay = Instance.new("UIListLayout", contenido)
	lay.SortOrder = Enum.SortOrder.LayoutOrder
	lay.Padding = UDim.new(0, 3)

	folder.MouseButton1Click:Connect(function()
		contenido.Visible = not contenido.Visible
	end)

	return contenido
end

-- Función para crear botón de script
local function crearScript(nombre, link, padre)
	local b = Instance.new("TextButton", padre)
	b.Size = UDim2.new(1, 0, 0, 30)
	b.Text = "▶ " .. nombre
	b.TextScaled = true
	b.Font = Enum.Font.Gotham
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	b.TextColor3 = Color3.new(1,1,1)
	b.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(link))()
	end)
end

-- Crear carpetas y scripts
local juegos = crearCarpeta("Juegos Populares")
crearScript("🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot", juegos)
crearScript("🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular", juegos)
crearScript("🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", juegos)
crearScript("🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau", juegos)

local comandos = crearCarpeta("Comandos")
crearScript("🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt", comandos)
crearScript("🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194", comandos)
crearScript("👁 ESP Player", "https://raw.githubusercontent.com/yourESPscriptlink", comandos)
crearScript("⌨️ Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", comandos)

-- Botón regresar
local volver = Instance.new("TextButton", panel)
volver.Size = UDim2.new(1, 0, 0, 35)
volver.Text = "⬅️ Regresar"
volver.TextScaled = true
volver.Font = Enum.Font.GothamBold
volver.TextColor3 = Color3.new(1,1,1)
volver.BackgroundColor3 = Color3.fromRGB(40,40,40)
volver.LayoutOrder = 5
volver.MouseButton1Click:Connect(function()
	panel.Visible = false
end)

-- Mostrar panel al presionar "C"
cBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Efecto Rainbow
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, v in pairs(panel:GetDescendants()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			v.TextColor3 = color
		end
	end
end)
