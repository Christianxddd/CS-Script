local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasGamerUI"
gui.ResetOnSpawn = false

-- Efecto Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- Botón flotante con "C"
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

-- Panel vertical gamer
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 250, 0, 600)
menu.Position = UDim2.new(0, 100, 0.1, 0)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menu.BackgroundTransparency = 0.3
menu.Visible = false
menu.Active = true
menu.Draggable = true
Instance.new("UICorner", menu)
local stroke = Instance.new("UIStroke", menu)
stroke.Thickness = 2

-- Mostrar/Ocultar menú
cBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

-- Título
local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🎮 ChristianSebas Panel"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- Variables
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

-- Función crear control de velocidad/salto
local function crearControl(nombre, y, variable, toggleVar)
	local label = Instance.new("TextLabel", menu)
	label.Position = UDim2.new(0.05, 0, y, 0)
	label.Size = UDim2.new(0.6, 0, 0, 30)
	label.Text = nombre
	label.TextScaled = true
	label.Font = Enum.Font.Arcade
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1

	local toggle = Instance.new("TextButton", menu)
	toggle.Position = UDim2.new(0.7, 0, y, 0)
	toggle.Size = UDim2.new(0.25, 0, 0, 30)
	toggle.Text = "OFF"
	toggle.TextScaled = true
	toggle.Font = Enum.Font.Arcade
	toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	toggle.TextColor3 = Color3.new(1, 0, 0)

	local plus = Instance.new("TextButton", menu)
	plus.Position = UDim2.new(0.05, 0, y + 0.06, 0)
	plus.Size = UDim2.new(0.2, 0, 0, 25)
	plus.Text = "+"
	plus.TextScaled = true
	plus.Font = Enum.Font.Arcade
	plus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	local minus = Instance.new("TextButton", menu)
	minus.Position = UDim2.new(0.3, 0, y + 0.06, 0)
	minus.Size = UDim2.new(0.2, 0, 0, 25)
	minus.Text = "-"
	minus.TextScaled = true
	minus.Font = Enum.Font.Arcade
	minus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	local val = Instance.new("TextLabel", menu)
	val.Position = UDim2.new(0.55, 0, y + 0.06, 0)
	val.Size = UDim2.new(0.4, 0, 0, 25)
	val.Text = tostring(_G[variable])
	val.TextScaled = true
	val.Font = Enum.Font.Arcade
	val.BackgroundTransparency = 1
	val.TextColor3 = Color3.new(1,1,1)

	plus.MouseButton1Click:Connect(function()
		_G[variable] += 1
		val.Text = tostring(_G[variable])
		actualizarHumanoid()
	end)

	minus.MouseButton1Click:Connect(function()
		_G[variable] = math.max(1, _G[variable] - 1)
		val.Text = tostring(_G[variable])
		actualizarHumanoid()
	end)

	toggle.MouseButton1Click:Connect(function()
		_G[toggleVar] = not _G[toggleVar]
		toggle.Text = _G[toggleVar] and "ON" or "OFF"
		toggle.TextColor3 = _G[toggleVar] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
		actualizarHumanoid()
	end)
end

-- Inicializar valores
_G["velocidad"] = velocidad
_G["salto"] = salto
_G["velON"] = velON
_G["saltoON"] = saltoON

crearControl("Velocidad", 0.08, "velocidad", "velON")
crearControl("Salto", 0.22, "salto", "saltoON")

-- Botón genérico
local function botonScript(nombre, posY, funcion)
	local btn = Instance.new("TextButton", menu)
	btn.Position = UDim2.new(0.05, 0, posY, 0)
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.Text = nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.Arcade
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.MouseButton1Click:Connect(funcion)
end

-- Funciones
botonScript("🚀 Fly V3", 0.36, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

local espAct = false
botonScript("👁 ESP Player", 0.43, function()
	espAct = not espAct
	for _, v in pairs(game.Players:GetPlayers()) do
		if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
			if espAct then
				local gui = Instance.new("BillboardGui", v.Character.Head)
				gui.Name = "NameTag"
				gui.Size = UDim2.new(0, 200, 0, 50)
				gui.AlwaysOnTop = true
				local txt = Instance.new("TextLabel", gui)
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.Text = v.Name
				txt.BackgroundTransparency = 1
				txt.TextScaled = true
				txt.TextColor3 = Color3.new(1, 1, 1)
			else
				local tag = v.Character.Head:FindFirstChild("NameTag")
				if tag then tag:Destroy() end
			end
		end
	end
end)

local flingUsed = false
botonScript("🌀 Touch Fling", 0.5, function()
	if not flingUsed then
		flingUsed = true
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))()
	end
end)

-- Scripts
botonScript("🧠 Steal Brainlot", 0.58, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
end)

botonScript("🚓 Jailbreak", 0.64, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
end)

botonScript("🚂 Dead Rails", 0.70, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
end)

botonScript("🍉 Blox Fruits", 0.76, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end)

-- Cerrar
botonScript("❌ Cerrar", 0.88, function()
	menu.Visible = false
end)

-- Rainbow aplicado
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, v in pairs(menu:GetChildren()) do
		if v:IsA("TextButton") or v:IsA("TextLabel") then
			v.TextColor3 = color
		end
	end
end)

-- Restaurar al reaparecer
player.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid").WalkSpeed = velON and velocidad or 16
	char:WaitForChild("Humanoid").JumpPower = saltoON and salto or 50
end)
