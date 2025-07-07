-- 🎮 PANEL GAMER COMPLETO MEJOR ORDENADO
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasGamerUI"
gui.ResetOnSpawn = false

-- 🌈 Efecto Rainbow dinámico
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- 🔘 Botón flotante con "C"
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

-- 🧱 Panel horizontal
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0.95, 0, 0.5, 0)
menu.Position = UDim2.new(0.025, 0, 0.2, 0)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menu.BackgroundTransparency = 0.3
menu.Visible = false
menu.Active = true
menu.Draggable = true
Instance.new("UICorner", menu)
local stroke = Instance.new("UIStroke", menu)
stroke.Thickness = 2

-- 🎯 Título
local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🎮 ChristianSebas - Panel Gamer"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

-- Mostrar/ocultar panel
cBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

-- 🔧 Variables
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

-- ⚙️ Crear control de velocidad/salto
local function crearControl(nombre, y, variable, toggleVar)
	local label = Instance.new("TextLabel", menu)
	label.Position = UDim2.new(0.02, 0, y, 0)
	label.Size = UDim2.new(0.1, 0, 0.07, 0)
	label.Text = nombre
	label.Font = Enum.Font.Arcade
	label.TextScaled = true
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1,1,1)

	local toggle = Instance.new("TextButton", menu)
	toggle.Position = UDim2.new(0.13, 0, y, 0)
	toggle.Size = UDim2.new(0.06, 0, 0.07, 0)
	toggle.Text = "OFF"
	toggle.Font = Enum.Font.Arcade
	toggle.TextScaled = true
	toggle.BackgroundColor3 = Color3.fromRGB(40,40,40)
	toggle.TextColor3 = Color3.fromRGB(255, 0, 0)

	local valLabel = Instance.new("TextLabel", menu)
	valLabel.Position = UDim2.new(0.21, 0, y, 0)
	valLabel.Size = UDim2.new(0.05, 0, 0.07, 0)
	valLabel.Text = tostring(_G[variable])
	valLabel.Font = Enum.Font.Arcade
	valLabel.TextScaled = true
	valLabel.BackgroundTransparency = 1
	valLabel.TextColor3 = Color3.new(1,1,1)

	local plus = Instance.new("TextButton", menu)
	plus.Position = UDim2.new(0.27, 0, y, 0)
	plus.Size = UDim2.new(0.04, 0, 0.07, 0)
	plus.Text = "+"
	plus.Font = Enum.Font.Arcade
	plus.TextScaled = true
	plus.BackgroundColor3 = Color3.fromRGB(40,40,40)
	plus.TextColor3 = Color3.new(1,1,1)

	local minus = Instance.new("TextButton", menu)
	minus.Position = UDim2.new(0.32, 0, y, 0)
	minus.Size = UDim2.new(0.04, 0, 0.07, 0)
	minus.Text = "-"
	minus.Font = Enum.Font.Arcade
	minus.TextScaled = true
	minus.BackgroundColor3 = Color3.fromRGB(40,40,40)
	minus.TextColor3 = Color3.new(1,1,1)

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

-- 📌 Inicializar controles
_G["velocidad"] = velocidad
_G["salto"] = salto
_G["velON"] = velON
_G["saltoON"] = saltoON

crearControl("Velocidad", 0.15, "velocidad", "velON")
crearControl("Salto", 0.28, "salto", "saltoON")

-- 🧱 Crear botón de script
local function crearBoton(nombre, posX, posY, scriptUrl)
	local btn = Instance.new("TextButton", menu)
	btn.Size = UDim2.new(0.13, 0, 0.08, 0)
	btn.Position = UDim2.new(posX, 0, posY, 0)
	btn.Text = nombre
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.MouseButton1Click:Connect(function()
		if nombre == "🌀 Touch Fling" then
			if not _G._flingUsed then
				_G._flingUsed = true
				loadstring(game:HttpGet(scriptUrl))()
			end
		else
			loadstring(game:HttpGet(scriptUrl))()
		end
	end)
end

-- 🚀 Scripts
crearBoton("🚀 Fly V3", 0.45, 0.15, "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
crearBoton("🌀 Touch Fling", 0.6, 0.15, "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194")
crearBoton("🧠 Brainlot", 0.75, 0.15, "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot")
crearBoton("🚓 Jailbreak", 0.45, 0.28, "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular")
crearBoton("🚂 Dead Rails", 0.6, 0.28, "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails")
crearBoton("🍉 Blox Fruits", 0.75, 0.28, "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau")

-- 👁 ESP TOGGLE
local espBtn = Instance.new("TextButton", menu)
espBtn.Size = UDim2.new(0.13, 0, 0.08, 0)
espBtn.Position = UDim2.new(0.45, 0, 0.42, 0)
espBtn.Text = "👁 ESP (OFF)"
espBtn.Font = Enum.Font.Arcade
espBtn.TextScaled = true
espBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
espBtn.TextColor3 = Color3.new(1, 1, 1)

local espOn = false
espBtn.MouseButton1Click:Connect(function()
	espOn = not espOn
	espBtn.Text = espOn and "👁 ESP (ON)" or "👁 ESP (OFF)"
	for _, v in pairs(game.Players:GetPlayers()) do
		if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
			if espOn and not v.Character.Head:FindFirstChild("NameTag") then
				local gui = Instance.new("BillboardGui", v.Character.Head)
				gui.Name = "NameTag"
				gui.Size = UDim2.new(0, 200, 0, 50)
				gui.AlwaysOnTop = true
				local txt = Instance.new("TextLabel", gui)
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.BackgroundTransparency = 1
				txt.Text = v.Name
				txt.TextColor3 = Color3.new(1, 1, 1)
				txt.TextScaled = true
			elseif not espOn then
				local tag = v.Character.Head:FindFirstChild("NameTag")
				if tag then tag:Destroy() end
			end
		end
	end
end)

-- ❌ Botón cerrar
local cerrar = Instance.new("TextButton", menu)
cerrar.Position = UDim2.new(0.9, 0, 0.9, 0)
cerrar.Size = UDim2.new(0.08, 0, 0.08, 0)
cerrar.Text = "❌"
cerrar.Font = Enum.Font.Arcade
cerrar.TextScaled = true
cerrar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
cerrar.TextColor3 = Color3.new(1, 0.2, 0.2)
cerrar.MouseButton1Click:Connect(function()
	menu.Visible = false
end)

-- 🌈 Efecto rainbow en loop
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, b in pairs(menu:GetChildren()) do
		if b:IsA("TextButton") or b:IsA("TextLabel") then
			b.TextColor3 = color
		end
	end
end)

-- 🧍 Al respawnear personaje
player.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid").WalkSpeed = velON and velocidad or 16
	char:WaitForChild("Humanoid").JumpPower = saltoON and salto or 50
end)
