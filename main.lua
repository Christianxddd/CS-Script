local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianProPanel"
gui.ResetOnSpawn = false

-- Icono flotante "C"
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 10, 0.5, -25)
openBtn.BackgroundColor3 = Color3.new(0, 0, 0)
openBtn.Text = "C"
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Font = Enum.Font.Arcade
openBtn.TextScaled = true
openBtn.Draggable = true
openBtn.Parent = gui

-- Panel principal
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 400, 0, 500)
panel.Position = UDim2.new(0.5, -200, 0.5, -250)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.35
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.Parent = gui

local stroke = Instance.new("UIStroke", panel)
stroke.Color = Color3.new(1, 1, 1)
stroke.Thickness = 2

-- Título
local titulo = Instance.new("TextLabel", panel)
titulo.Size = UDim2.new(1, 0, 0, 40)
titulo.Position = UDim2.new(0, 0, 0, 0)
titulo.Text = "By Christian"
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.BackgroundTransparency = 1
titulo.Font = Enum.Font.Arcade
titulo.TextScaled = true

-- Información del usuario
local info = Instance.new("TextLabel", panel)
info.Size = UDim2.new(1, 0, 0, 20)
info.Position = UDim2.new(0, 0, 0, 40)
info.Text = "Usuario: Christian_xyx  |  TikTok: @christ_sebast_7d"
info.TextColor3 = Color3.new(1, 1, 1)
info.BackgroundTransparency = 1
info.Font = Enum.Font.Arcade
info.TextScaled = true

-- Barra de búsqueda
local searchBox = Instance.new("TextBox", panel)
searchBox.Size = UDim2.new(0.9, 0, 0, 30)
searchBox.Position = UDim2.new(0.05, 0, 0, 70)
searchBox.PlaceholderText = "Buscar script..."
searchBox.Text = ""
searchBox.Font = Enum.Font.Arcade
searchBox.TextScaled = true
searchBox.TextColor3 = Color3.new(1, 1, 1)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- Contenedor scrollable
local scrollFrame = Instance.new("ScrollingFrame", panel)
scrollFrame.Position = UDim2.new(0.05, 0, 0, 110)
scrollFrame.Size = UDim2.new(0.9, 0, 0.8, -40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollFrame.ScrollBarThickness = 8
scrollFrame.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", scrollFrame)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 6)

-- Crear carpetas
local function crearCarpeta(nombre)
	local folder = Instance.new("TextButton")
	folder.Size = UDim2.new(1, 0, 0, 40)
	folder.Text = "📁 " .. nombre
	folder.Font = Enum.Font.Arcade
	folder.TextScaled = true
	folder.TextColor3 = Color3.new(1, 1, 1)
	folder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	folder.LayoutOrder = 1
	folder.Parent = scrollFrame
	return folder
end

-- Crear scripts dentro de cada carpeta
local function crearScript(nombre, enlace)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.Text = "📜 " .. nombre
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	btn.Visible = false
	btn.LayoutOrder = 2
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(enlace))()
	end)
	btn.Parent = scrollFrame
	return btn
end

-- Carpeta: Juegos Populares
local popBtn = crearCarpeta("Juegos Populares")
local juegosScripts = {
	{ "🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot" },
	{ "🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular" },
	{ "🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails" },
	{ "🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau" }
}
for _, s in ipairs(juegosScripts) do
	crearScript(s[1], s[2])
end

-- Carpeta: Comandos
local cmdBtn = crearCarpeta("Comandos")
local comandos = {
	{ "🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt" },
	{ "🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194" },
	{ "👁 ESP Player", "https://raw.githubusercontent.com/BeboProject/ESP/main/ESP.lua" },
	{ "⌨️ Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source" }
}
for _, s in ipairs(comandos) do
	crearScript(s[1], s[2])
end

-- Carpeta: General (más de 40 scripts)
local generalBtn = crearCarpeta("General")
for i = 1, 40 do
	crearScript("Script #" .. i, "https://raw.githubusercontent.com/GhosTinyMain/Ghoster/refs/heads/main/FirstHub")
end

-- Función para toggle de carpetas
local function conectarCarpeta(btn)
	local estado = false
	btn.MouseButton1Click:Connect(function()
		estado = not estado
		for _, obj in pairs(scrollFrame:GetChildren()) do
			if obj:IsA("TextButton") and obj.LayoutOrder == 2 and obj ~= btn then
				obj.Visible = estado
			end
		end
	end)
end

conectarCarpeta(popBtn)
conectarCarpeta(cmdBtn)
conectarCarpeta(generalBtn)

-- Función búsqueda
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	for _, child in ipairs(scrollFrame:GetChildren()) do
		if child:IsA("TextButton") and child.LayoutOrder == 2 then
			child.Visible = string.find(string.lower(child.Text), string.lower(searchBox.Text)) ~= nil
		end
	end
end)

-- Mostrar/ocultar panel
openBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)
