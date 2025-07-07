-- Panel Profesional Básico by ChristianSebast

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebastUI"
gui.ResetOnSpawn = false

-- Función para efecto rainbow suave
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t * 0.5) % 1, 1, 1)
end

-- Botón flotante "C"
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
cBtn.BorderSizePixel = 0
cBtn.Text = "C"
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.TextScaled = true
cBtn.Font = Enum.Font.GothamBold
cBtn.AutoButtonColor = true
cBtn.Draggable = true
cBtn.Name = "ToggleButton"

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 300, 0, 400)
panel.Position = UDim2.new(0, 20, 0, 90)
panel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
panel.BackgroundTransparency = 0.3
panel.Visible = false
panel.Active = true
panel.Draggable = true

local uiCorner = Instance.new("UICorner", panel)
uiCorner.CornerRadius = UDim.new(0, 8)

local uiStroke = Instance.new("UIStroke", panel)
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(255, 255, 255)

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Im Christian Sebast"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Separador (línea)
local separator = Instance.new("Frame", panel)
separator.Size = UDim2.new(1, -20, 0, 2)
separator.Position = UDim2.new(0, 10, 0, 52)
separator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
separator.BackgroundTransparency = 0.5

-- Función para crear botones de scripts
local function createButton(text, y)
	local btn = Instance.new("TextButton", panel)
	btn.Size = UDim2.new(0.9, 0, 0, 40)
	btn.Position = UDim2.new(0.05, 0, y, 0)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.Text = text
	btn.AutoButtonColor = true
	btn.Name = text:gsub(" ", ""):gsub("[%(%)]", "") -- nombre limpio
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 5)
	return btn
end

-- Lista de scripts con sus nombres y links
local scriptsList = {
	{
		name = "Fly V3 (Original)",
		url = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"
	},
	{
		name = "Infinity Yield (Comandos)",
		url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
	},
	{
		name = "Touch Fling",
		url = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"
	},
	{
		name = "Brainlot Steal",
		url = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"
	},
	{
		name = "Jailbreak",
		url = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"
	},
	{
		name = "Dead Rails",
		url = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"
	},
	{
		name = "Blox Fruits",
		url = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"
	},
	-- Puedes agregar más aquí si quieres
}

-- Botones para scripts
for i, data in ipairs(scriptsList) do
	local btn = createButton(data.name, 0.13 + (i-1)*0.07)
	btn.Parent = panel
	btn.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet(data.url))()
		end)
		if not success then
			warn("Error al ejecutar script: ".. err)
		end
	end)
end

-- Función para actualizar colores rainbow
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	cBtn.BackgroundColor3 = color
	title.TextColor3 = color
	uiStroke.Color = color
	for _, btn in pairs(panel:GetChildren()) do
		if btn:IsA("TextButton") then
			btn.TextColor3 = color
			btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		end
	end
end)

-- Mostrar/Ocultar panel al presionar "C"
cBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)
