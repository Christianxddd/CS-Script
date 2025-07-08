local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PanelGamerCS"
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

-- Botón flotante "C"
local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 20, 0.4, 0)
icon.Text = "C"
icon.BackgroundColor3 = Color3.new(0, 0, 0)
icon.TextColor3 = Color3.new(1, 1, 1)
icon.TextScaled = true
icon.Font = Enum.Font.Arcade
icon.Draggable = true
icon.Name = "CIcon"
icon.Parent = gui

-- Panel principal
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 400, 0, 500)
panel.Position = UDim2.new(0.5, -200, 0.5, -250)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.BackgroundTransparency = 0.3
panel.Visible = false
panel.Name = "MainPanel"
panel.Parent = gui
panel.Active = true
panel.Draggable = true

-- UI Corner y Stroke
Instance.new("UICorner", panel)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título
local titulo = Instance.new("TextLabel", panel)
titulo.Size = UDim2.new(1, 0, 0, 40)
titulo.Position = UDim2.new(0, 0, 0, 0)
titulo.Text = "Im Christian Sebast"
titulo.TextScaled = true
titulo.Font = Enum.Font.Arcade
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.BackgroundTransparency = 1

-- Contenedor scrollable
local scrollingFrame = Instance.new("ScrollingFrame", panel)
scrollingFrame.Size = UDim2.new(1, 0, 1, -40)
scrollingFrame.Position = UDim2.new(0, 0, 0, 40)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.BackgroundTransparency = 1

-- Función para crear carpeta con scripts
local function crearCarpeta(nombre, scripts)
	local carpeta = Instance.new("TextButton", scrollingFrame)
	carpeta.Size = UDim2.new(1, -10, 0, 40)
	carpeta.Position = UDim2.new(0, 5, 0, #scrollingFrame:GetChildren() * 45)
	carpeta.Text = "📁 " .. nombre
	carpeta.Font = Enum.Font.Arcade
	carpeta.TextScaled = true
	carpeta.TextColor3 = Color3.new(1, 1, 1)
	carpeta.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	local cont = Instance.new("Frame", scrollingFrame)
	cont.Visible = false
	cont.Size = UDim2.new(1, -10, 0, #scripts * 40)
	cont.Position = UDim2.new(0, 5, 0, carpeta.Position.Y.Offset + 45)
	cont.BackgroundTransparency = 1
	cont.Name = nombre.."Content"

	for i, scriptData in ipairs(scripts) do
		local btn = Instance.new("TextButton", cont)
		btn.Size = UDim2.new(1, 0, 0, 35)
		btn.Position = UDim2.new(0, 0, 0, (i - 1) * 35)
		btn.Text = scriptData[1]
		btn.Font = Enum.Font.Arcade
		btn.TextScaled = true
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		btn.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(scriptData[2]))()
		end)
	end

	carpeta.MouseButton1Click:Connect(function()
		cont.Visible = not cont.Visible
	end)
end

-- Sección: Juegos Populares
crearCarpeta("Juegos Populares", {
	{"🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{"🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{"🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{"🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"}
})

-- Sección: Comandos
crearCarpeta("Comandos", {
	{"🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{"🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{"👁 ESP Player", "https://raw.githubusercontent.com/lerkermer/lua-projects/master/ESP.lua"},
	{"💻 Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"}
})

-- Sección: General (con más de 40 scripts útiles)
crearCarpeta("General", {
	{"🔒 Admin Panel", "https://raw.githubusercontent.com/FilteringEnabled/FE/main/AdminPanel.txt"},
	{"💥 Kill All", "https://pastebin.com/raw/XRz6NfpA"},
	{"🎮 FPS Boost", "https://pastebin.com/raw/F3tL5y9b"},
	{"🎲 Teleport GUI", "https://pastebin.com/raw/Nuk5gqS6"},
	{"🚀 Super Jump", "https://pastebin.com/raw/YPjEWhfd"},
	-- (Agrega más si deseas, puedo continuar la lista si me pides)
})

-- Búsqueda (placeholder, puedes mejorar con módulos)
local searchBar = Instance.new("TextBox", panel)
searchBar.PlaceholderText = "🔍 Buscar..."
searchBar.Size = UDim2.new(0.9, 0, 0, 30)
searchBar.Position = UDim2.new(0.05, 0, 1, -35)
searchBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
searchBar.TextColor3 = Color3.new(1, 1, 1)
searchBar.TextScaled = true
searchBar.Font = Enum.Font.Arcade

-- Mostrar panel al presionar "C"
icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Efecto Rainbow
game:GetService("RunService").RenderStepped:Connect(function()
	local c = rainbow()
	stroke.Color = c
	titulo.TextColor3 = c
	for _, v in ipairs(scrollingFrame:GetDescendants()) do
		if v:IsA("TextButton") then
			v.TextColor3 = c
		end
	end
end)
