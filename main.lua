local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebastHub"
gui.ResetOnSpawn = false

-- Rainbow dinámico
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2) * 127 + 128,
		math.sin(t + 4) * 127 + 128
	)
end

-- Sonido "miau" al abrir
local miau = Instance.new("Sound", gui)
miau.SoundId = "rbxassetid://9121281154"
miau.Volume = 2

-- Botón con letra "C"
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
cBtn.Text = "C"
cBtn.TextScaled = true
cBtn.Font = Enum.Font.Arcade
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.Draggable = true

-- Panel horizontal gamer
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0.95, 0, 0.45, 0)
menu.Position = UDim2.new(0.025, 0, 0.2, 0)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menu.BackgroundTransparency = 0.3
menu.Visible = false
menu.Active = true
menu.Draggable = true
Instance.new("UICorner", menu)

-- Título
local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Im Christian Sebast"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Rainbow aplicado
local stroke = Instance.new("UIStroke", menu)
stroke.Thickness = 2

-- Controles de velocidad/salto
local velocidad, salto = 16, 50
local velON, saltoON = false, false

local function actualizarHumanoid()
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then
		hum.WalkSpeed = velON and velocidad or 16
		hum.JumpPower = saltoON and salto or 50
	end
end

local function crearControl(nombre, x, variable, toggleVar)
	local label = Instance.new("TextLabel", menu)
	label.Position = UDim2.new(x, 0, 0.17, 0)
	label.Size = UDim2.new(0.1, 0, 0.1, 0)
	label.Text = nombre
	label.TextScaled = true
	label.Font = Enum.Font.Arcade
	label.BackgroundTransparency = 1

	local toggle = Instance.new("TextButton", menu)
	toggle.Position = UDim2.new(x + 0.1, 0, 0.17, 0)
	toggle.Size = UDim2.new(0.06, 0, 0.1, 0)
	toggle.Text = "OFF"
	toggle.Font = Enum.Font.Arcade

	local valLabel = Instance.new("TextLabel", menu)
	valLabel.Position = UDim2.new(x + 0.17, 0, 0.17, 0)
	valLabel.Size = UDim2.new(0.05, 0, 0.1, 0)
	valLabel.Text = tostring(_G[variable])
	valLabel.Font = Enum.Font.Arcade
	valLabel.BackgroundTransparency = 1

	local plus = Instance.new("TextButton", menu)
	plus.Position = UDim2.new(x + 0.23, 0, 0.17, 0)
	plus.Size = UDim2.new(0.05, 0, 0.1, 0)
	plus.Text = "+"

	local minus = Instance.new("TextButton", menu)
	minus.Position = UDim2.new(x + 0.29, 0, 0.17, 0)
	minus.Size = UDim2.new(0.05, 0, 0.1, 0)
	minus.Text = "-"

	for _, b in pairs({toggle, plus, minus, label, valLabel}) do
		b.TextScaled = true
		b.TextColor3 = Color3.new(1, 1, 1)
		b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	end

	plus.MouseButton1Click:Connect(function()
		_G[variable] += 1
		valLabel.Text = tostring(_G[variable])
		actualizarHumanoid()
	end)

	minus.MouseButton1Click:Connect(function()
		_G[variable] = math.max(1, _G[variable] - 1)
		valLabel.Text = tostring(_G[variable])
		actualizarHumanoid()
	end)

	toggle.MouseButton1Click:Connect(function()
		_G[toggleVar] = not _G[toggleVar]
		toggle.Text = _G[toggleVar] and "ON" or "OFF"
		toggle.TextColor3 = _G[toggleVar] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
		actualizarHumanoid()
	end)
end

_G["velocidad"] = velocidad
_G["salto"] = salto
_G["velON"] = velON
_G["saltoON"] = saltoON

crearControl("Velocidad", 0.02, "velocidad", "velON")
crearControl("Salto", 0.4, "salto", "saltoON")

-- Crear botón
local function crearBoton(texto, posX, y, callback)
	local btn = Instance.new("TextButton", menu)
	btn.Position = UDim2.new(posX, 0, y, 0)
	btn.Size = UDim2.new(0.13, 0, 0.13, 0)
	btn.Text = texto
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.MouseButton1Click:Connect(callback)
end

-- BOTONES DE FUNCIONES
crearBoton("🚀 Fly", 0.02, 0.33, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

local espOn = false
crearBoton("👁 ESP", 0.17, 0.33, function()
	espOn = not espOn
	for _, v in pairs(game.Players:GetPlayers()) do
		if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
			if espOn then
				local gui = Instance.new("BillboardGui", v.Character.Head)
				gui.Name = "NameTag"
				gui.Size = UDim2.new(0, 200, 0, 50)
				gui.AlwaysOnTop = true
				gui.Adornee = v.Character.Head
				local txt = Instance.new("TextLabel", gui)
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.BackgroundTransparency = 1
				txt.Text = v.Name
				txt.TextScaled = true
			else
				local tag = v.Character.Head:FindFirstChild("NameTag")
				if tag then tag:Destroy() end
			end
		end
	end
end)

local usedFling = false
crearBoton("🌀 Touch Fling", 0.32, 0.33, function()
	if not usedFling then
		usedFling = true
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))()
	end
end)

crearBoton("🧠 Brainlot", 0.47, 0.33, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
end)

crearBoton("🚓 Jailbreak", 0.62, 0.33, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
end)

crearBoton("🚂 Dead Rails", 0.77, 0.33, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
end)

crearBoton("🍉 Blox Fruits", 0.02, 0.5, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end)

crearBoton("📜 Comandos", 0.17, 0.5, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

crearBoton("🎵 TikTok", 0.32, 0.5, function()
	setclipboard("https://www.tiktok.com/@christ_sebast_7d")
end)

-- Mostrar/ocultar panel con sonido
cBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
	if menu.Visible then
		miau:Play()
	end
end)

-- Rainbow animación
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, b in pairs(menu:GetChildren()) do
		if b:IsA("TextLabel") or b:IsA("TextButton") then
			b.TextColor3 = color
		end
	end
end)

-- Restaurar valores al respawn
player.CharacterAdded:Connect(function(char)
	wait(1)
	actualizarHumanoid()
end)
