local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "ByChristianUI"
gui.ResetOnSpawn = false

-- Pantalla de bienvenida
local wel = Instance.new("TextLabel", gui)
wel.Size = UDim2.new(1,0,1,0)
wel.BackgroundTransparency = 0
wel.BackgroundColor3 = Color3.new(0, 0, 0)
wel.Text = "By Christian"
wel.TextColor3 = Color3.new(1, 1, 1)
wel.Font = Enum.Font.Arcade
wel.TextScaled = true

for i = 0, 1, 0.05 do
	wel.BackgroundTransparency = i
	wait(0.05)
end
wel:Destroy()

-- Pantalla de contraseña
local pwFrame = Instance.new("Frame", gui)
pwFrame.Size = UDim2.new(0.4, 0, 0.25, 0)
pwFrame.Position = UDim2.new(0.3, 0, 0.375, 0)
pwFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
pwFrame.BorderSizePixel = 0
local pwText = Instance.new("TextBox", pwFrame)
pwText.Size = UDim2.new(0.8,0,0.4,0)
pwText.Position = UDim2.new(0.1,0,0.2,0)
pwText.PlaceholderText = "Enter password"
pwText.Font = Enum.Font.Arcade
pwText.TextScaled = true
pwText.Text = ""
pwText.TextColor3 = Color3.new(1,1,1)
pwText.BackgroundColor3 = Color3.fromRGB(40,40,40)
local pwBtn = Instance.new("TextButton", pwFrame)
pwBtn.Size = UDim2.new(0.6, 0, 0.25, 0)
pwBtn.Position = UDim2.new(0.2, 0, 0.7, 0)
pwBtn.Text = "ENTER"
pwBtn.Font = Enum.Font.Arcade
pwBtn.TextScaled = true
pwBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
pwBtn.TextColor3 = Color3.new(1,1,1)

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2) * 127 + 128,
		math.sin(t + 4) * 127 + 128
	)
end

-- Botón flotante "C"
local openBtn = Instance.new("TextButton")
openBtn.Text = "C"
openBtn.Size = UDim2.new(0, 60, 0, 60)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.TextScaled = true
openBtn.Font = Enum.Font.Arcade
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.BackgroundColor3 = Color3.new(0,0,0)
openBtn.Draggable = true
openBtn.Visible = false
openBtn.Parent = gui

-- Panel principal
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0.55, 0, 0.65, 0)
panel.Position = UDim2.new(0.2, 0, 0.15, 0)
panel.BackgroundTransparency = 0.4
panel.BackgroundColor3 = Color3.fromRGB(20,20,20)
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.Parent = gui

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0.08, 0)
title.Position = UDim2.new(0,0,0,0)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

-- ScrollArea para las carpetas
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1,0,0.9,0)
scroll.Position = UDim2.new(0,0,0.1,0)
scroll.CanvasSize = UDim2.new(0, 0, 3, 0)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 8

local layout = Instance.new("UIListLayout", scroll)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 6)

-- Función para crear carpetas
local function crearCarpeta(nombre, scripts)
	local folder = Instance.new("Frame", scroll)
	folder.Size = UDim2.new(1, -20, 0, 40)
	folder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

	local btn = Instance.new("TextButton", folder)
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.Text = "📂 " .. nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.Arcade
	btn.BackgroundTransparency = 0.2
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.TextColor3 = Color3.new(1,1,1)

	btn.MouseButton1Click:Connect(function()
		panel.Visible = false
		local sub = Instance.new("ScrollingFrame", gui)
		sub.Size = UDim2.new(0.5, 0, 0.6, 0)
		sub.Position = UDim2.new(0.25, 0, 0.2, 0)
		sub.CanvasSize = UDim2.new(0,0,#scripts * 0.15,0)
		sub.ScrollBarThickness = 8
		sub.BackgroundColor3 = Color3.fromRGB(20,20,20)
		sub.BackgroundTransparency = 0.4
		sub.Name = "SubMenu"
		local sublayout = Instance.new("UIListLayout", sub)
		sublayout.SortOrder = Enum.SortOrder.LayoutOrder
		sublayout.Padding = UDim.new(0,5)

		for _, s in pairs(scripts) do
			local b = Instance.new("TextButton", sub)
			b.Size = UDim2.new(1,-10,0,40)
			b.Text = s.name
			b.Font = Enum.Font.Arcade
			b.TextScaled = true
			b.BackgroundColor3 = Color3.fromRGB(40,40,40)
			b.TextColor3 = Color3.new(1,1,1)
			b.MouseButton1Click:Connect(function()
				loadstring(game:HttpGet(s.link))()
			end)
		end

		-- Regresar
		local back = Instance.new("TextButton", sub)
		back.Size = UDim2.new(1,-10,0,40)
		back.Text = "🔙 Regresar"
		back.Font = Enum.Font.Arcade
		back.TextScaled = true
		back.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
		back.TextColor3 = Color3.new(1,1,1)
		back.MouseButton1Click:Connect(function()
			sub:Destroy()
			panel.Visible = true
		end)
	end)
end

-- Scripts por carpeta
local juegosPopulares = {
	{name="🧠 Brainlot", link="https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{name="🚓 Jailbreak", link="https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{name="🚂 Dead Rails", link="https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{name="🍉 Blox Fruits", link="https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
	-- Agrega 10 más aquí si deseas
}

local comandos = {
	{name="🚀 Fly V3", link="https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{name="🌀 Touch Fling", link="https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{name="👁 ESP Player", link="https://pastebin.com/raw/8f33FW6h"},
	{name="📜 Infinity Yield", link="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}

local general = {
	{name="🔥 Fireball", link="https://pastebin.com/raw/jztajK3t"},
	{name="💸 Auto Cash", link="https://pastebin.com/raw/JzZpFke5"},
	{name="🔫 Arsenal OP", link="https://pastebin.com/raw/fH4dgzsc"},
	{name="💥 Destroyer", link="https://pastebin.com/raw/dqE4iQEv"},
	-- ... Agrega más (puedes duplicar y personalizar)
}

crearCarpeta("🎮 Juegos Populares", juegosPopulares)
crearCarpeta("📦 Comandos", comandos)
crearCarpeta("🧰 General", general)

-- Mostrar ícono después de contraseña
pwBtn.MouseButton1Click:Connect(function()
	if pwText.Text == "AYAM" then
		pwFrame:Destroy()
		openBtn.Visible = true
	else
		pwText.Text = ""
		pwText.PlaceholderText = "Código incorrecto"
	end
end)

-- Toggle panel
openBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Rainbow effect
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	title.TextColor3 = color
	for _, f in pairs(scroll:GetChildren()) do
		if f:IsA("Frame") and f:FindFirstChildWhichIsA("TextButton") then
			f:FindFirstChildWhichIsA("TextButton").TextColor3 = color
		end
	end
end)
