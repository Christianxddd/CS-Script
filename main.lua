local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasGamerUI"
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

-- Panel horizontal, largo y movible
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0.95, 0, 0.45, 0)
menu.Position = UDim2.new(0.025, 0, 0.2, 0)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menu.BackgroundTransparency = 0.4
menu.Visible = false
menu.Active = true
menu.Draggable = true
Instance.new("UICorner", menu)
local stroke = Instance.new("UIStroke", menu)
stroke.Thickness = 2

-- Título más pequeño
local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 25)
title.Text = "Im Christian Sebast"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

cBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

-- Variables de velocidad y salto
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

-- Crear controles velocidad/salto
local function crearControl(nombre, y, variable, toggleVar)
	local label = Instance.new("TextLabel", menu)
	label.Position = UDim2.new(0.02, 0, y, 0)
	label.Size = UDim2.new(0.1, 0, 0.05, 0)
	label.Text = nombre
	label.TextScaled = true
	label.Font = Enum.Font.Arcade
	label.TextColor3 = Color3.new(1,1,1)
	label.BackgroundTransparency = 1

	local toggle = Instance.new("TextButton", menu)
	toggle.Position = UDim2.new(0.14, 0, y, 0)
	toggle.Size = UDim2.new(0.06, 0, 0.05, 0)
	toggle.Text = "OFF"
	toggle.TextScaled = true
	toggle.Font = Enum.Font.Arcade
	toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	toggle.TextColor3 = Color3.fromRGB(255, 0, 0)

	local valLabel = Instance.new("TextLabel", menu)
	valLabel.Position = UDim2.new(0.22, 0, y, 0)
	valLabel.Size = UDim2.new(0.05, 0, 0.05, 0)
	valLabel.Text = tostring(_G[variable])
	valLabel.TextScaled = true
	valLabel.Font = Enum.Font.Arcade
	valLabel.TextColor3 = Color3.new(1,1,1)
	valLabel.BackgroundTransparency = 1

	local plus = Instance.new("TextButton", menu)
	plus.Position = UDim2.new(0.28, 0, y, 0)
	plus.Size = UDim2.new(0.05, 0, 0.05, 0)
	plus.Text = "+"
	plus.TextScaled = true
	plus.Font = Enum.Font.Arcade
	plus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	plus.TextColor3 = Color3.new(1,1,1)

	local minus = Instance.new("TextButton", menu)
	minus.Position = UDim2.new(0.34, 0, y, 0)
	minus.Size = UDim2.new(0.05, 0, 0.05, 0)
	minus.Text = "-"
	minus.TextScaled = true
	minus.Font = Enum.Font.Arcade
	minus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
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

_G["velocidad"] = velocidad
_G["salto"] = salto
_G["velON"] = velON
_G["saltoON"] = saltoON

crearControl("Velocidad", 0.15, "velocidad", "velON")
crearControl("Salto", 0.25, "salto", "saltoON")

-- Crear botón
local function crearBoton(texto, x, y, callback)
	local btn = Instance.new("TextButton", menu)
	btn.Size = UDim2.new(0.12, 0, 0.06, 0)
	btn.Position = UDim2.new(x, 0, y, 0)
	btn.Text = texto
	btn.TextScaled = true
	btn.Font = Enum.Font.Arcade
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.MouseButton1Click:Connect(callback)
	return btn
end

-- Botones de funciones
crearBoton("🚀 Fly V3", 0.02, 0.39, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

local espOn = false
crearBoton("👁 ESP", 0.17, 0.39, function()
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
				txt.TextColor3 = Color3.new(1, 1, 1)
				txt.TextScaled = true
			else
				local tag = v.Character.Head:FindFirstChild("NameTag")
				if tag then tag:Destroy() end
			end
		end
	end
end)

local flingUsed = false
crearBoton("🌀 Touch Fling", 0.32, 0.39, function()
	if not flingUsed then
		flingUsed = true
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))()
	end
end)

crearBoton("🧠 Brainlot", 0.47, 0.39, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
end)

crearBoton("🚓 Jailbreak", 0.62, 0.39, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
end)

crearBoton("🚂 Dead Rails", 0.77, 0.39, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
end)

crearBoton("🍉 Blox Fruits", 0.02, 0.49, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end)

crearBoton("📜 Comandos", 0.17, 0.49, function()
	local btn = nil
	for _, v in pairs(menu:GetChildren()) do
		if v:IsA("TextButton") and v.Text:find("Comandos") then
			btn = v break
		end
	end
	if btn then
		btn.Text = "Cargando..."
		wait(1)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
		btn.Text = "📜 Comandos"
		game.StarterGui:SetCore("SendNotification", {
			Title = "Infinity Yield",
			Text = "Comandos cargados ✅",
			Duration = 4
		})
	end
end)

-- Botón TikTok
local tiktok = Instance.new("ImageButton", menu)
tiktok.Position = UDim2.new(0.9, 0, 0.9, 0)
tiktok.Size = UDim2.new(0.08, 0, 0.07, 0)
tiktok.Image = "rbxassetid://14218073818"
tiktok.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tiktok.MouseButton1Click:Connect(function()
	setclipboard("https://www.tiktok.com/@christ_sebast_7d")
	game.StarterGui:SetCore("SendNotification", {
		Title = "TikTok",
		Text = "Link copiado ✅",
		Duration = 4
	})
end)

-- Rainbow
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, b in pairs(menu:GetChildren()) do
		if b:IsA("TextButton") or b:IsA("TextLabel") then
			b.TextColor3 = color
		elseif b:IsA("ImageButton") then
			b.ImageColor3 = color
		end
	end
end)

-- Reinicio personaje
player.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid").WalkSpeed = velON and velocidad or 16
	char:WaitForChild("Humanoid").JumpPower = saltoON and salto or 50
end)
