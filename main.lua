local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasGamerUI"
gui.ResetOnSpawn = false

local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- Botón flotante "C"
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.BorderSizePixel = 0
cBtn.Text = "C"
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.TextScaled = true
cBtn.Font = Enum.Font.Arcade
cBtn.Draggable = true

-- Menú principal
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 330, 0, 430)
menu.Position = UDim2.new(0.5, -165, 0.5, -215)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menu.Visible = false
Instance.new("UICorner", menu)
local stroke = Instance.new("UIStroke", menu)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "🎮 ChristianSebas Menu"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

cBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

-- Valores base
local velocidad = 16
local salto = 50
local velON = false
local saltoON = false

local function actualizarHumanoid()
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then
		hum.WalkSpeed = velON and velocidad or 16
		hum.JumpPower = saltoON and salto or 50
	end
end

-- Sección general
local function crearSeccion(texto, posicionY, callbackAdd, callbackSub, toggle, valor)
	local label = Instance.new("TextLabel", menu)
	label.Position = UDim2.new(0.05, 0, posicionY, 0)
	label.Size = UDim2.new(0.4, 0, 0, 30)
	label.Text = texto
	label.TextScaled = true
	label.Font = Enum.Font.Arcade
	label.TextColor3 = Color3.new(1,1,1)
	label.BackgroundTransparency = 1

	local onBtn = Instance.new("TextButton", menu)
	onBtn.Position = UDim2.new(0.47, 0, posicionY, 0)
	onBtn.Size = UDim2.new(0.13, 0, 0, 30)
	onBtn.Text = "OFF"
	onBtn.TextScaled = true
	onBtn.Font = Enum.Font.Arcade
	onBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	onBtn.TextColor3 = Color3.fromRGB(255, 0, 0)

	local valLabel = Instance.new("TextLabel", menu)
	valLabel.Position = UDim2.new(0.61, 0, posicionY, 0)
	valLabel.Size = UDim2.new(0.1, 0, 0, 30)
	valLabel.Text = tostring(valor)
	valLabel.TextScaled = true
	valLabel.Font = Enum.Font.Arcade
	valLabel.TextColor3 = Color3.new(1,1,1)
	valLabel.BackgroundTransparency = 1

	local plus = Instance.new("TextButton", menu)
	plus.Position = UDim2.new(0.72, 0, posicionY, 0)
	plus.Size = UDim2.new(0.13, 0, 0, 30)
	plus.Text = "+"
	plus.TextScaled = true
	plus.Font = Enum.Font.Arcade
	plus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	plus.TextColor3 = Color3.new(1,1,1)

	local minus = Instance.new("TextButton", menu)
	minus.Position = UDim2.new(0.86, 0, posicionY, 0)
	minus.Size = UDim2.new(0.13, 0, 0, 30)
	minus.Text = "-"
	minus.TextScaled = true
	minus.Font = Enum.Font.Arcade
	minus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	minus.TextColor3 = Color3.new(1,1,1)

	plus.MouseButton1Click:Connect(function()
		callbackAdd()
		valLabel.Text = tostring(valor)
		actualizarHumanoid()
	end)

	minus.MouseButton1Click:Connect(function()
		callbackSub()
		valLabel.Text = tostring(valor)
		actualizarHumanoid()
	end)

	onBtn.MouseButton1Click:Connect(function()
		_G[toggle] = not _G[toggle]
		onBtn.Text = _G[toggle] and "ON" or "OFF"
		onBtn.TextColor3 = _G[toggle] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
		actualizarHumanoid()
	end)
end

-- Secciones de velocidad y salto
crearSeccion("Velocidad", 0.15,
	function() velocidad += 1 end,
	function() velocidad = math.max(1, velocidad - 1) end,
	"velON", velocidad
)

crearSeccion("Salto", 0.3,
	function() salto += 1 end,
	function() salto = math.max(1, salto - 1) end,
	"saltoON", salto
)

-- Fly V3
local fly = Instance.new("TextButton", menu)
fly.Position = UDim2.new(0.05, 0, 0.47, 0)
fly.Size = UDim2.new(0.9, 0, 0, 35)
fly.Text = "🚀 Fly V3"
fly.TextScaled = true
fly.Font = Enum.Font.Arcade
fly.TextColor3 = Color3.new(1, 1, 1)
fly.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
fly.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

-- ESP Player toggle
local esp = Instance.new("TextButton", menu)
esp.Position = UDim2.new(0.05, 0, 0.61, 0)
esp.Size = UDim2.new(0.9, 0, 0, 35)
esp.Text = "👁 ESP Player (OFF)"
esp.TextScaled = true
esp.Font = Enum.Font.Arcade
esp.TextColor3 = Color3.new(1, 1, 1)
esp.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local espOn = false
local espLabels = {}

esp.MouseButton1Click:Connect(function()
	espOn = not espOn
	if espOn then
		for _, v in pairs(game.Players:GetPlayers()) do
			if v ~= player and v.Character and v.Character:FindFirstChild("Head") and not v.Character.Head:FindFirstChild("NameTag") then
				local gui = Instance.new("BillboardGui", v.Character.Head)
				gui.Name = "NameTag"
				gui.Size = UDim2.new(0, 200, 0, 50)
				gui.AlwaysOnTop = true
				gui.Adornee = v.Character.Head
				local txt = Instance.new("TextLabel", gui)
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.BackgroundTransparency = 1
				txt.Text = v.Name
				txt.TextColor3 = Color3.new(1, 1, 1)
				txt.TextScaled = true
				txt.Font = Enum.Font.Arcade
				table.insert(espLabels, txt)
			end
		end
		esp.Text = "👁 ESP Player (ON)"
	else
		for _, v in pairs(game.Players:GetPlayers()) do
			if v.Character and v.Character:FindFirstChild("Head") then
				local tag = v.Character.Head:FindFirstChild("NameTag")
				if tag then tag:Destroy() end
			end
		end
		espLabels = {}
		esp.Text = "👁 ESP Player (OFF)"
	end
end)

-- Touch Fling toggle
local fling = Instance.new("TextButton", menu)
fling.Position = UDim2.new(0.05, 0, 0.69, 0)
fling.Size = UDim2.new(0.9, 0, 0, 35)
fling.Text = "🌀 Touch Fling (OFF)"
fling.TextScaled = true
fling.Font = Enum.Font.Arcade
fling.TextColor3 = Color3.new(1, 1, 1)
fling.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local flingOn = false

fling.MouseButton1Click:Connect(function()
	flingOn = not flingOn
	if flingOn then
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))()
		fling.Text = "🌀 Touch Fling (ON)"
	else
		player.Character:BreakJoints()
		fling.Text = "🌀 Touch Fling (OFF)"
	end
end)

-- Botón cerrar
local cerrar = Instance.new("TextButton", menu)
cerrar.Position = UDim2.new(0.05, 0, 0.84, 0)
cerrar.Size = UDim2.new(0.9, 0, 0, 35)
cerrar.Text = "❌ Cerrar"
cerrar.TextScaled = true
cerrar.Font = Enum.Font.Arcade
cerrar.TextColor3 = Color3.new(1, 0.2, 0.2)
cerrar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
cerrar.MouseButton1Click:Connect(function()
	menu.Visible = false
end)

-- Rainbow loop
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	esp.TextColor3 = color
	fling.TextColor3 = color
	for _, lbl in ipairs(espLabels) do
		lbl.TextColor3 = color
	end
end)

-- Restaurar velocidad y salto al respawn
player.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid").WalkSpeed = velON and velocidad or 16
	char:WaitForChild("Humanoid").JumpPower = saltoON and salto or 50
end)
