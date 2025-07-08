local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianProHub"
gui.ResetOnSpawn = false

-- RAINBOW
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.floor(math.sin(t) * 127 + 128),
		math.floor(math.sin(t + 2) * 127 + 128),
		math.floor(math.sin(t + 4) * 127 + 128)
	)
end

-- BOTÓN FLOTANTE "C"
local iconBtn = Instance.new("TextButton", gui)
iconBtn.Size = UDim2.new(0, 60, 0, 60)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconBtn.Text = "C"
iconBtn.Font = Enum.Font.Arcade
iconBtn.TextColor3 = Color3.new(1, 1, 1)
iconBtn.TextScaled = true
iconBtn.Draggable = true

-- MENSAJE INICIAL: "By Christian"
local pantalla = Instance.new("TextLabel", gui)
pantalla.Size = UDim2.new(1, 0, 1, 0)
pantalla.BackgroundTransparency = 1
pantalla.Text = "By Christian"
pantalla.TextScaled = true
pantalla.Font = Enum.Font.Arcade
pantalla.TextColor3 = Color3.new(1, 1, 1)
pantalla.BackgroundColor3 = Color3.new(0, 0, 0)
pantalla.ZIndex = 10

wait(2.5)
pantalla:TweenSize(UDim2.new(0,0,0,0), "Out", "Quad", 1, true, function()
	pantalla:Destroy()
end)

-- PEDIR CONTRASEÑA
local passFrame = Instance.new("Frame", gui)
passFrame.Size = UDim2.new(0, 300, 0, 200)
passFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
passFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
passFrame.BorderSizePixel = 0
Instance.new("UICorner", passFrame)

local info = Instance.new("TextLabel", passFrame)
info.Size = UDim2.new(1, 0, 0.3, 0)
info.Text = "Ingresa la contraseña:\n(link en chat)"
info.TextColor3 = Color3.new(1, 1, 1)
info.BackgroundTransparency = 1
info.TextScaled = true
info.Font = Enum.Font.Arcade

local input = Instance.new("TextBox", passFrame)
input.Size = UDim2.new(0.8, 0, 0.2, 0)
input.Position = UDim2.new(0.1, 0, 0.4, 0)
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.BackgroundColor3 = Color3.fromRGB(30,30,30)
input.Font = Enum.Font.Arcade
input.TextScaled = true

local continuar = Instance.new("TextButton", passFrame)
continuar.Size = UDim2.new(0.6, 0, 0.2, 0)
continuar.Position = UDim2.new(0.2, 0, 0.7, 0)
continuar.Text = "Entrar"
continuar.Font = Enum.Font.Arcade
continuar.TextScaled = true
continuar.BackgroundColor3 = Color3.fromRGB(30,30,30)
continuar.TextColor3 = Color3.new(1,1,1)

local panel -- lo creamos más adelante

continuar.MouseButton1Click:Connect(function()
	if input.Text == "AYAM" then
		passFrame:Destroy()
		panel.Visible = true
	else
		info.Text = "¡Contraseña incorrecta!"
	end
end)

-- PANEL PROFESIONAL
panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0.5, 0, 0.7, 0)
panel.Position = UDim2.new(0.25, 0, 0.15, 0)
panel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
panel.BackgroundTransparency = 0.4
panel.Visible = false
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- TÍTULO
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- DATOS
local datos = Instance.new("TextLabel", panel)
datos.Size = UDim2.new(1, 0, 0.05, 0)
datos.Position = UDim2.new(0, 0, 0.1, 0)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.Arcade
datos.TextColor3 = Color3.new(1,1,1)
datos.BackgroundTransparency = 1

-- BUSCADOR
local buscador = Instance.new("TextBox", panel)
buscador.Size = UDim2.new(0.9, 0, 0.06, 0)
buscador.Position = UDim2.new(0.05, 0, 0.17, 0)
buscador.PlaceholderText = "Buscar script..."
buscador.Text = ""
buscador.TextScaled = true
buscador.Font = Enum.Font.Arcade
buscador.TextColor3 = Color3.new(1,1,1)
buscador.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- CONTENEDOR DE CARPETAS
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, 0, 0.7, 0)
scroll.Position = UDim2.new(0, 0, 0.25, 0)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 3, 0)
scroll.ScrollBarThickness = 4

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)

-- FUNCIONES
local function crearCarpeta(nombre, scripts)
	local folderBtn = Instance.new("TextButton", scroll)
	folderBtn.Size = UDim2.new(0.9, 0, 0.08, 0)
	folderBtn.Position = UDim2.new(0.05, 0, 0, 0)
	folderBtn.Text = "📂 " .. nombre
	folderBtn.TextScaled = true
	folderBtn.Font = Enum.Font.Arcade
	folderBtn.TextColor3 = Color3.new(1,1,1)
	folderBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

	folderBtn.MouseButton1Click:Connect(function()
		scroll:ClearAllChildren()
		layout = Instance.new("UIListLayout", scroll)
		layout.Padding = UDim.new(0, 5)

		for i, data in pairs(scripts) do
			local btn = Instance.new("TextButton", scroll)
			btn.Size = UDim2.new(0.9, 0, 0.08, 0)
			btn.Text = data.name
			btn.Font = Enum.Font.Arcade
			btn.TextScaled = true
			btn.TextColor3 = Color3.new(1,1,1)
			btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			btn.MouseButton1Click:Connect(function()
				loadstring(game:HttpGet(data.link))()
			end)
		end

		local volver = Instance.new("TextButton", scroll)
		volver.Size = UDim2.new(0.9, 0, 0.08, 0)
		volver.Text = "🔙 Regresar"
		volver.Font = Enum.Font.Arcade
		volver.TextScaled = true
		volver.TextColor3 = Color3.new(1,1,1)
		volver.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
		volver.MouseButton1Click:Connect(function()
			scroll:ClearAllChildren()
			layout = Instance.new("UIListLayout", scroll)
			layout.Padding = UDim.new(0, 5)
			inicializarCarpetas()
		end)
	end)
end

-- LISTAS DE SCRIPTS
local juegosPopulares = {
	{name="Brainlot", link="https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{name="Jailbreak", link="https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{name="Dead Rails", link="https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{name="Blox Fruits", link="https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
	-- Agrega 10 más si deseas...
}

local comandos = {
	{name="Fly V3", link="https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{name="Touch Fling", link="https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{name="ESP Player", link="https://raw.githubusercontent.com/ic3w0lf22/ESP/main/esp.lua"},
	{name="Infinity Yield", link="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}

local general = {
	{name="CMD-X", link="https://raw.githubusercontent.com/CMD-X/CMD-X/master/CMD-X"},
	{name="Dark Dex", link="https://raw.githubusercontent.com/peyton2465/Dark-Dex/main/source.lua"},
	{name="Remote Spy", link="https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"},
	-- Agrega 40 si deseas...
}

-- INICIALIZAR CARPETAS
function inicializarCarpetas()
	crearCarpeta("Juegos Populares", juegosPopulares)
	crearCarpeta("Comandos", comandos)
	crearCarpeta("General", general)
end

inicializarCarpetas()

-- EFECTO RAINBOW
game:GetService("RunService").RenderStepped:Connect(function()
	local c = rainbow()
	stroke.Color = c
	iconBtn.TextColor3 = c
	title.TextColor3 = c
	datos.TextColor3 = c
	buscador.TextColor3 = c
end)
