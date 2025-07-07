-- BIENVENIDA ÉPICA (Pantalla completa, sin fondo, solo texto)
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianWelcome"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

local bienvenida = Instance.new("TextLabel", gui)
bienvenida.Size = UDim2.new(1, 0, 1, 0)
bienvenida.BackgroundTransparency = 1
bienvenida.Text = "By Christian"
bienvenida.TextColor3 = Color3.fromRGB(255, 255, 255)
bienvenida.TextScaled = true
bienvenida.Font = Enum.Font.Arcade
bienvenida.TextStrokeTransparency = 0.3
bienvenida.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)

-- Fade In
bienvenida.TextTransparency = 1
for i = 1, 0, -0.05 do
	task.wait(0.02)
	bienvenida.TextTransparency = i
end

wait(2.5) -- Tiempo visible

-- Fade Out
for i = 0, 1, 0.05 do
	task.wait(0.02)
	bienvenida.TextTransparency = i
end

bienvenida:Destroy()

-- PANEL PRINCIPAL
local mainGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
mainGui.Name = "ChristianPanel"
mainGui.ResetOnSpawn = false

-- BOTÓN FLOTANTE "C"
local iconBtn = Instance.new("TextButton", mainGui)
iconBtn.Name = "OpenButton"
iconBtn.Size = UDim2.new(0, 50, 0, 50)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.BackgroundColor3 = Color3.new(0, 0, 0)
iconBtn.Text = "C"
iconBtn.Font = Enum.Font.Arcade
iconBtn.TextColor3 = Color3.new(1, 1, 1)
iconBtn.TextScaled = true
iconBtn.Active = true
iconBtn.Draggable = true
iconBtn.BackgroundTransparency = 0.3

-- PANEL PRINCIPAL
local panel = Instance.new("Frame", mainGui)
panel.Name = "MainPanel"
panel.Size = UDim2.new(0, 500, 0, 400)
panel.Position = UDim2.new(0.5, -250, 0.5, -200)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.4
panel.Visible = false
panel.Active = true
panel.Draggable = true
local panelCorner = Instance.new("UICorner", panel)
panelCorner.CornerRadius = UDim.new(0, 8)

-- TITULO
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "By Christian"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- DATOS DE USUARIO
local datos = Instance.new("TextLabel", panel)
datos.Size = UDim2.new(1, 0, 0, 30)
datos.Position = UDim2.new(0, 0, 0, 40)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.Font = Enum.Font.Arcade
datos.TextScaled = true
datos.TextColor3 = Color3.new(1, 1, 1)
datos.BackgroundTransparency = 1

-- CARPETA DE "SCRIPTS"
local scriptsBtn = Instance.new("TextButton", panel)
scriptsBtn.Size = UDim2.new(0.4, 0, 0, 40)
scriptsBtn.Position = UDim2.new(0.05, 0, 0, 80)
scriptsBtn.Text = "📁 Scripts"
scriptsBtn.Font = Enum.Font.Arcade
scriptsBtn.TextScaled = true
scriptsBtn.TextColor3 = Color3.new(1, 1, 1)
scriptsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", scriptsBtn)

-- CARPETA DE "COMANDOS"
local comandosBtn = Instance.new("TextButton", panel)
comandosBtn.Size = UDim2.new(0.4, 0, 0, 40)
comandosBtn.Position = UDim2.new(0.55, 0, 0, 80)
comandosBtn.Text = "⚙️ Comandos"
comandosBtn.Font = Enum.Font.Arcade
comandosBtn.TextScaled = true
comandosBtn.TextColor3 = Color3.new(1, 1, 1)
comandosBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", comandosBtn)

-- EVENTO PARA MOSTRAR PANEL
iconBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- FUNCIONALIDAD DE CARPETAS (scripts ejemplo)
local function abrirSubPanel(nombre, scripts)
	local subPanel = Instance.new("Frame", mainGui)
	subPanel.Size = UDim2.new(0, 500, 0, 400)
	subPanel.Position = UDim2.new(0.5, -250, 0.5, -200)
	subPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	subPanel.BackgroundTransparency = 0.4
	subPanel.Active = true
	subPanel.Draggable = true

	local titulo = Instance.new("TextLabel", subPanel)
	titulo.Size = UDim2.new(1, 0, 0, 40)
	titulo.Text = "📂 " .. nombre
	titulo.Font = Enum.Font.Arcade
	titulo.TextScaled = true
	titulo.TextColor3 = Color3.new(1, 1, 1)
	titulo.BackgroundTransparency = 1

	local scroll = Instance.new("ScrollingFrame", subPanel)
	scroll.Size = UDim2.new(1, 0, 1, -60)
	scroll.Position = UDim2.new(0, 0, 0, 40)
	scroll.CanvasSize = UDim2.new(0, 0, 0, #scripts * 50)
	scroll.ScrollBarThickness = 6
	scroll.BackgroundTransparency = 1

	for i, s in ipairs(scripts) do
		local b = Instance.new("TextButton", scroll)
		b.Size = UDim2.new(0.9, 0, 0, 40)
		b.Position = UDim2.new(0.05, 0, 0, (i - 1) * 45)
		b.Text = s.nombre
		b.Font = Enum.Font.Arcade
		b.TextScaled = true
		b.TextColor3 = Color3.new(1, 1, 1)
		b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		b.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(s.url))()
		end)
		Instance.new("UICorner", b)
	end

	local back = Instance.new("TextButton", subPanel)
	back.Size = UDim2.new(0.2, 0, 0, 35)
	back.Position = UDim2.new(0.75, 0, 0.91, 0)
	back.Text = "🔙 Regresar"
	back.Font = Enum.Font.Arcade
	back.TextScaled = true
	back.TextColor3 = Color3.new(1, 1, 1)
	back.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Instance.new("UICorner", back)
	back.MouseButton1Click:Connect(function()
		subPanel:Destroy()
	end)
end

-- SCRIPTS DE JUEGOS POPULARES
local juegosPopulares = {
	{nombre = "🧠 Brainlot", url = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{nombre = "🚓 Jailbreak", url = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{nombre = "🚂 Dead Rails", url = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{nombre = "🍉 Blox Fruits", url = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
	-- Agrega más si deseas
}

-- COMANDOS (Fly, ESP, etc.)
local comandos = {
	{nombre = "🚀 Fly V3", url = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{nombre = "👁 ESP Player", url = "https://raw.githubusercontent.com/ic3w0lf22/ESP-Library/main/ESP.lua"},
	{nombre = "🌀 Touch Fling", url = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{nombre = "📜 Infinity Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}

-- ACCIONES de los botones
scriptsBtn.MouseButton1Click:Connect(function()
	abrirSubPanel("Juegos Populares", juegosPopulares)
end)

comandosBtn.MouseButton1Click:Connect(function()
	abrirSubPanel("Comandos", comandos)
end)
