local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebastPanel"
gui.ResetOnSpawn = false

-- Sonido de maullido
local miau = Instance.new("Sound", gui)
miau.SoundId = "rbxassetid://9120470040"
miau.Volume = 1

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- Botón flotante "C"
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0.5, -25)
openBtn.BackgroundColor3 = Color3.new(0, 0, 0)
openBtn.BorderSizePixel = 0
openBtn.Text = "C"
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBlack
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Draggable = true

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 450, 0, 580)
panel.Position = UDim2.new(0.5, -225, 0.5, -290)
panel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
panel.BackgroundTransparency = 0.2
panel.Visible = false
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "Im Christian Sebast"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Barra de búsqueda
local searchBox = Instance.new("TextBox", panel)
searchBox.PlaceholderText = "🔍 Buscar script..."
searchBox.Size = UDim2.new(0.95, 0, 0, 30)
searchBox.Position = UDim2.new(0.025, 0, 0, 40)
searchBox.TextScaled = true
searchBox.Font = Enum.Font.Gotham
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.BackgroundColor3 = Color3.fromRGB(30,30,30)

-- Contenedor scroll
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Position = UDim2.new(0, 0, 0, 80)
scroll.Size = UDim2.new(1, 0, 1, -120)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 8)

-- Crear sección
local function crearSeccion(nombre)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, -20, 0, 30)
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	frame.BorderSizePixel = 0

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = nombre
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1

	return frame
end

-- Crear botón de script
local function crearBoton(nombre, scriptURL)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -40, 0, 35)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.Text = nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBold
	btn.TextColor3 = Color3.new(1,1,1)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptURL))()
	end)
	return btn
end

-- Juegos Populares
scroll:AddChild(crearSeccion("🎮 Juegos Populares"))
scroll:AddChild(crearBoton("🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))
scroll:AddChild(crearBoton("🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))
scroll:AddChild(crearBoton("🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"))
scroll:AddChild(crearBoton("🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))
scroll:AddChild(crearBoton("🔥 Anime Fighters", "https://raw.githubusercontent.com/synolope/robloxscripts/main/animefighters.lua"))
scroll:AddChild(crearBoton("🌀 Slap Battles", "https://raw.githubusercontent.com/zaeburYT/RobloxScripts/main/SlapBattles.lua"))
scroll:AddChild(crearBoton("🕹️ Bedwars", "https://raw.githubusercontent.com/KinqzScripts/Free/main/bedwars.lua"))
scroll:AddChild(crearBoton("💣 Arsenal", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))
scroll:AddChild(crearBoton("🔫 Phantom Forces", "https://raw.githubusercontent.com/FilteringEnabled/FE/main/Phantom.lua"))
scroll:AddChild(crearBoton("⛏️ Mining Simulator", "https://raw.githubusercontent.com/GenesisRoblox/Roblox-Scripts/main/MiningSimulator.lua"))

-- Utilidades
scroll:AddChild(crearSeccion("🛠️ Utilidades"))
scroll:AddChild(crearBoton("🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))
scroll:AddChild(crearBoton("👁 ESP Player", "https://rawscripts.net/raw/ESP-Script-Advanced-Player-30201"))
scroll:AddChild(crearBoton("🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))
scroll:AddChild(crearBoton("🧠 Steal Brain", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))
scroll:AddChild(crearBoton("📜 Comandos (Infinity Yield)", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))

-- Botón Regresar
local backBtn = Instance.new("TextButton", panel)
backBtn.Size = UDim2.new(1, 0, 0, 35)
backBtn.Position = UDim2.new(0, 0, 1, -35)
backBtn.Text = "🔙 Regresar"
backBtn.TextScaled = true
backBtn.Font = Enum.Font.GothamBlack
backBtn.TextColor3 = Color3.new(1, 0.2, 0.2)
backBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
backBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
end)

-- Mostrar panel con sonido
openBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
	if panel.Visible then miau:Play() end
end)

-- Rainbow efecto
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	for _, v in pairs(scroll:GetChildren()) do
		if v:IsA("TextButton") or v:IsA("TextLabel") then
			v.TextColor3 = color
		end
	end
end)

-- Barra de búsqueda
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local term = searchBox.Text:lower()
	for _, btn in pairs(scroll:GetChildren()) do
		if btn:IsA("TextButton") then
			local match = btn.Text:lower():find(term)
			btn.Visible = match ~= nil
		end
	end
end)
