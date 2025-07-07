local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "GhostHubV2"
gui.ResetOnSpawn = false

-- Botón flotante "C"
local openButton = Instance.new("TextButton", gui)
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Position = UDim2.new(0, 20, 0, 20)
openButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
openButton.Text = "C"
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.Font = Enum.Font.GothamBold
openButton.TextScaled = true
openButton.Draggable = true

-- Panel Principal
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 350, 0, 400)
main.Position = UDim2.new(0.5, -175, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BackgroundTransparency = 0.3
main.Visible = false
main.Active = true
main.Draggable = true

-- Rainbow efecto
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- Título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "By Christian"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1

-- Datos usuario
local userInfo = Instance.new("TextLabel", main)
userInfo.Position = UDim2.new(0, 0, 0, 30)
userInfo.Size = UDim2.new(1, 0, 0, 25)
userInfo.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
userInfo.TextColor3 = Color3.new(1, 1, 1)
userInfo.Font = Enum.Font.Gotham
userInfo.TextScaled = true
userInfo.BackgroundTransparency = 1

-- ScrollingFrame para carpetas
local scroll = Instance.new("ScrollingFrame", main)
scroll.Position = UDim2.new(0, 0, 0, 60)
scroll.Size = UDim2.new(1, 0, 1, -60)
scroll.CanvasSize = UDim2.new(0, 0, 0, 700)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layoutScroll = Instance.new("UIListLayout", scroll)
layoutScroll.Padding = UDim.new(0, 10)
layoutScroll.SortOrder = Enum.SortOrder.LayoutOrder

-- Rainbow animación
game:GetService("RunService").RenderStepped:Connect(function()
	local c = rainbow()
	title.TextColor3 = c
	userInfo.TextColor3 = c
end)

-- Función crear carpeta desplegable
local function crearCarpeta(nombre, scripts)
	local folder = Instance.new("Frame", scroll)
	folder.Size = UDim2.new(1, 0, 0, 30)
	folder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	folder.BorderSizePixel = 0
	folder.LayoutOrder = 1

	local btn = Instance.new("TextButton", folder)
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.Text = "📁 "..nombre
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundTransparency = 1
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true

	local content = Instance.new("Frame", scroll)
	content.Size = UDim2.new(1, 0, 0, #scripts * 35 + 40)
	content.BackgroundTransparency = 1
	content.Visible = false
	content.LayoutOrder = 2

	local layout = Instance.new("UIListLayout", content)
	layout.Padding = UDim.new(0, 5)

	for _, scriptData in pairs(scripts) do
		local b = Instance.new("TextButton", content)
		b.Size = UDim2.new(0.95, 0, 0, 30)
		b.Text = "▶️ "..scriptData.nombre
		b.TextColor3 = Color3.new(1,1,1)
		b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		b.Font = Enum.Font.Gotham
		b.TextScaled = true
		b.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(scriptData.link))()
		end)
	end

	local regresar = Instance.new("TextButton", content)
	regresar.Size = UDim2.new(0.95, 0, 0, 30)
	regresar.Text = "🔙 Regresar"
	regresar.TextColor3 = Color3.fromRGB(255, 80, 80)
	regresar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	regresar.Font = Enum.Font.GothamBold
	regresar.TextScaled = true
	regresar.MouseButton1Click:Connect(function()
		content.Visible = false
	end)

	btn.MouseButton1Click:Connect(function()
		content.Visible = not content.Visible
	end)

	return content
end

-- Scripts de cada carpeta
local juegosPopulares = {
	{nombre="Brainlot", link="https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{nombre="Jailbreak", link="https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{nombre="Dead Rails", link="https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{nombre="Blox Fruits", link="https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
}

local comandos = {
	{nombre="Fly V3", link="https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{nombre="Touch Fling", link="https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{nombre="ESP Player", link="https://pastebin.com/raw/Zz0Uz2Ar"},
	{nombre="Infinity Yield", link="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}

-- Crear carpetas
crearCarpeta("🎮 Juegos Populares", juegosPopulares)
crearCarpeta("🧰 Comandos", comandos)

-- Abrir panel
openButton.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
end)
