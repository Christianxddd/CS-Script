local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "GhostHubV2"
gui.ResetOnSpawn = false

-- Sonido Miau al abrir
local sound = Instance.new("Sound", gui)
sound.SoundId = "rbxassetid://9123471643"
sound.Volume = 1

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- Botón flotante C
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

-- Panel principal
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0.9, 0, 0.8, 0)
frame.Position = UDim2.new(0.05, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.3
frame.Visible = false
frame.Active = true
frame.Draggable = true

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.08, 0)
title.Text = "I'm Christian Sebast"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

-- ScrollFrame para scripts
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Position = UDim2.new(0, 0, 0.09, 0)
scroll.Size = UDim2.new(1, 0, 0.91, 0)
scroll.CanvasSize = UDim2.new(0, 0, 5, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", scroll)
UIListLayout.Padding = UDim.new(0.01, 0)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Función para crear botones
local function newBtn(text, scriptURL)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(0.95, 0, 0, 40)
	btn.Text = text
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptURL))()
	end)
end

-- Scripts organizados por categoría

-- 🚀 JUEGOS
newBtn("Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau")
newBtn("Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular")
newBtn("Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails")
newBtn("Brookhaven", "https://raw.githubusercontent.com/DookDekDEE/Brookhaven/main/Script")
newBtn("Doors", "https://rawscripts.net/raw/DOORS-DOORS-Script-4451")

-- 🧠 UTILIDADES
newBtn("Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
newBtn("Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194")
newBtn("ESP Player", "https://pastebin.com/raw/1b4gkR6F")
newBtn("Speed + Jump", "https://pastebin.com/raw/qEzpWY3x")
newBtn("Anti AFK", "https://pastebin.com/raw/ygzvH9qL")

-- 🔐 ADMIN Y COMANDOS
newBtn("Infinity Yield (Comandos)", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
newBtn("Admin Commands GUI", "https://pastebin.com/raw/tzTXmYf2")
newBtn("Anti-Ban Detector", "https://pastebin.com/raw/ZzHkQs1T")

-- 🔍 FUNCIÓN DE BÚSQUEDA (próxima versión)

-- TikTok logo con enlace
local tiktokBtn = Instance.new("TextButton", scroll)
tiktokBtn.Size = UDim2.new(0.95, 0, 0, 40)
tiktokBtn.Text = "📱 TikTok: @christ_sebast_7d"
tiktokBtn.Font = Enum.Font.Arcade
tiktokBtn.TextScaled = true
tiktokBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
tiktokBtn.TextColor3 = Color3.new(1,1,1)
tiktokBtn.MouseButton1Click:Connect(function()
	setclipboard("https://www.tiktok.com/@christ_sebast_7d")
end)

-- Abrir / cerrar con sonido
cBtn.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
	if frame.Visible then sound:Play() end
end)

-- Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	for _, b in pairs(scroll:GetChildren()) do
		if b:IsA("TextButton") then
			b.TextColor3 = color
		end
	end
end)
