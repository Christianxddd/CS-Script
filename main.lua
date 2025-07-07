local player = game.Players.LocalPlayer

-- GUI principal
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebas_UI"
gui.ResetOnSpawn = false

-- Sonido miau al abrir
local miau = Instance.new("Sound", gui)
miau.SoundId = "rbxassetid://9120470040"
miau.Volume = 1

-- Botón flotante "C"
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0.5, -25)
openBtn.Text = "C"
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBlack
openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Draggable = true
openBtn.Active = true
Instance.new("UICorner", openBtn)

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 400, 0, 500)
panel.Position = UDim2.new(0.5, -200, 0.5, -250)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.Visible = false
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)

-- UIStroke rainbow
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Im Christian Sebast"
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Scroll con scripts
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 3, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)

-- Función rainbow
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- Botón para scripts
local function crearBoton(nombre, url)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.Position = UDim2.new(0.05, 0, 0, 0)
	btn.Text = nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.Gotham
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.MouseButton1Click:Connect(function()
		pcall(function()
			loadstring(game:HttpGet(url))()
		end)
	end)
	return btn
end

-- Scripts populares
crearBoton("🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot")
crearBoton("🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular")
crearBoton("🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails")
crearBoton("🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau")
crearBoton("🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
crearBoton("🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194")
crearBoton("📜 Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

-- Abrir/Cerrar panel
openBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
	if panel.Visible then
		miau:Play()
	end
end)

-- Rainbow en tiempo real
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	for _, btn in pairs(scroll:GetChildren()) do
		if btn:IsA("TextButton") then
			btn.TextColor3 = color
		end
	end
end)
