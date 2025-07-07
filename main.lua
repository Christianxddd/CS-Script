local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "GhostHubV2"
gui.ResetOnSpawn = false

-- Sonido al abrir
local miau = Instance.new("Sound", gui)
miau.SoundId = "rbxassetid://9123471643"
miau.Volume = 1

-- Rainbow color
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
cBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
cBtn.Text = "C"
cBtn.Font = Enum.Font.Arcade
cBtn.TextScaled = true
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.Draggable = true
cBtn.BorderSizePixel = 0

-- Panel vertical
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0.3, 0, 0.9, 0)
panel.Position = UDim2.new(0.02, 0, 0.05, 0)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.BackgroundTransparency = 0.2
panel.Visible = false
panel.Active = true
panel.Draggable = true
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "I'm Christian Sebast"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- ScrollFrame para los scripts
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Position = UDim2.new(0, 0, 0, 45)
scroll.Size = UDim2.new(1, 0, 1, -50)
scroll.CanvasSize = UDim2.new(0, 0, 10, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1
local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0.01, 0)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Crear sección
local function newSection(name)
	local sec = Instance.new("TextLabel", scroll)
	sec.Size = UDim2.new(1, -10, 0, 30)
	sec.Text = name
	sec.Font = Enum.Font.Arcade
	sec.TextScaled = true
	sec.TextColor3 = Color3.new(1, 1, 1)
	sec.BackgroundTransparency = 1
end

-- Crear botón
local function newBtn(name, url)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(1, -10, 0, 40)
	btn.Text = name
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url))()
	end)
end

-- ========================
-- 📂 SECCIONES Y FUNCIONES
-- ========================

newSection("🎮 Juegos Populares")
newBtn("Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau")
newBtn("Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular")
newBtn("Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails")
newBtn("Brookhaven", "https://raw.githubusercontent.com/DookDekDEE/Brookhaven/main/Script")
newBtn("Doors", "https://rawscripts.net/raw/DOORS-DOORS-Script-4451")

newSection("⚙️ Utilidades")
newBtn("Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
newBtn("Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194")
newBtn("ESP Player", "https://pastebin.com/raw/1b4gkR6F")
newBtn("Speed + Jump", "https://pastebin.com/raw/qEzpWY3x")
newBtn("Anti AFK", "https://pastebin.com/raw/ygzvH9qL")

newSection("🔒 Comandos / Admin")
newBtn("Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
newBtn("Admin GUI", "https://pastebin.com/raw/tzTXmYf2")
newBtn("Anti-Ban", "https://pastebin.com/raw/ZzHkQs1T")

newSection("📱 Mi TikTok")
local tiktokBtn = Instance.new("TextButton", scroll)
tiktokBtn.Size = UDim2.new(1, -10, 0, 40)
tiktokBtn.Text = "TikTok: @christ_sebast_7d"
tiktokBtn.Font = Enum.Font.Arcade
tiktokBtn.TextScaled = true
tiktokBtn.TextColor3 = Color3.new(1,1,1)
tiktokBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
tiktokBtn.MouseButton1Click:Connect(function()
	setclipboard("https://www.tiktok.com/@christ_sebast_7d")
end)

scroll.Parent = panel

-- Mostrar/ocultar
cBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
	if panel.Visible then miau:Play() end
end)

-- Rainbow efecto
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	for _, v in pairs(scroll:GetChildren()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			v.TextColor3 = color
		end
	end
end)
