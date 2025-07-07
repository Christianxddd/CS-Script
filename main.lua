local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasGamerUI"
gui.ResetOnSpawn = false

-- Rainbow dinámico
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- Botón flotante
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

-- Panel vertical con scroll
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 280, 0, 400)
menu.Position = UDim2.new(0, 100, 0.15, 0)
menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
menu.BackgroundTransparency = 0.3
menu.Visible = false
menu.Active = true
menu.Draggable = true
Instance.new("UICorner", menu)
local stroke = Instance.new("UIStroke", menu)
stroke.Thickness = 2

-- ScrollingFrame interno (panel vertical)
local scroll = Instance.new("ScrollingFrame", menu)
scroll.Size = UDim2.new(1, 0, 1, 0)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.AutomaticSize = Enum.AutomaticSize.Y

local layout = Instance.new("UIListLayout", scroll)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 6)

-- Mostrar/ocultar menú
cBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

-- Título
local title = Instance.new("TextLabel", scroll)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🎮 Panel Gamer - ChristianSebas"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- Variables y funciones
local velocidad, salto = 16, 50
local velON, saltoON = false, false

local function actualizarHumanoid()
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then
		hum.WalkSpeed = velON and velocidad or 16
		hum.JumpPower = saltoON and salto or 50
	end
end

-- Crear control de velocidad o salto
local function crearControl(nombre, variable, toggleVar)
	local frame = Instance.new("Frame", scroll)
	frame.Size = UDim2.new(1, 0, 0, 60)
	frame.BackgroundTransparency = 1

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(0.5, 0, 0.5, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Text = nombre
	label.Font = Enum.Font.Arcade
	label.TextScaled = true
	label.TextColor3 = Color3.new(1,1,1)
	label.BackgroundTransparency = 1

	local toggle = Instance.new("TextButton", frame)
	toggle.Size = UDim2.new(0.4, 0, 0.5, 0)
	toggle.Position = UDim2.new(0.55, 0, 0, 0)
	toggle.Text = "OFF"
	toggle.Font = Enum.Font.Arcade
	toggle.TextScaled = true
	toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
	toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	local minus = Instance.new("TextButton", frame)
	minus.Size = UDim2.new(0.2, 0, 0.4, 0)
	minus.Position = UDim2.new(0.1, 0, 0.55, 0)
	minus.Text = "-"
	minus.Font = Enum.Font.Arcade
	minus.TextScaled = true
	minus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	local plus = Instance.new("TextButton", frame)
	plus.Size = UDim2.new(0.2, 0, 0.4, 0)
	plus.Position = UDim2.new(0.4, 0, 0.55, 0)
	plus.Text = "+"
	plus.Font = Enum.Font.Arcade
	plus.TextScaled = true
	plus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	local val = Instance.new("TextLabel", frame)
	val.Size = UDim2.new(0.3, 0, 0.4, 0)
	val.Position = UDim2.new(0.7, 0, 0.55, 0)
	val.Text = tostring(_G[variable])
	val.Font = Enum.Font.Arcade
	val.TextScaled = true
	val.TextColor3 = Color3.new(1,1,1)
	val.BackgroundTransparency = 1

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

_G["velocidad"] = velocidad
_G["salto"] = salto
_G["velON"] = velON
_G["saltoON"] = saltoON

crearControl("Velocidad", "velocidad", "velON")
crearControl("Salto", "salto", "saltoON")

-- Crear botón
local function crearBoton(nombre, funcion)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(0.95, 0, 0, 40)
	btn.Text = nombre
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	btn.MouseButton1Click:Connect(funcion)
end

-- Funciones
crearBoton("🚀 Fly V3", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

local espOn = false
crearBoton("👁 ESP Player", function()
	espOn = not espOn
	for _, v in pairs(game.Players:GetPlayers()) do
		if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
			if espOn and not v.Character.Head:FindFirstChild("NameTag") then
				local gui = Instance.new("BillboardGui", v.Character.Head)
				gui.Name = "NameTag"
				gui.Size = UDim2.new(0, 200, 0, 50)
				gui.AlwaysOnTop = true
				local label = Instance.new("TextLabel", gui)
				label.Size = UDim2.new(1, 0, 1, 0)
				label.BackgroundTransparency = 1
				label.Text = v.Name
				label.TextScaled = true
				label.TextColor3 = Color3.new(1,1,1)
			elseif not espOn then
				local tag = v.Character.Head:FindFirstChild("NameTag")
				if tag then tag:Destroy() end
			end
		end
	end
end)

local flingUsed = false
crearBoton("🌀 Touch Fling", function()
	if not flingUsed then
		flingUsed = true
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))()
	end
end)

-- Scripts especiales
crearBoton("🧠 Steal Brainlot", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
end)

crearBoton("🚓 Jailbreak", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
end)

crearBoton("🚂 Dead Rails", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
end)

crearBoton("🍉 Blox Fruits", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end)

-- Botón cerrar
crearBoton("❌ Cerrar", function()
	menu.Visible = false
end)

-- Rainbow activo
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, v in pairs(scroll:GetChildren()) do
		if v:IsA("TextButton") or v:IsA("TextLabel") then
			v.TextColor3 = color
		end
	end
end)

-- Al reaparecer
player.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid").WalkSpeed = velON and velocidad or 16
	char:WaitForChild("Humanoid").JumpPower = saltoON and salto or 50
end)
