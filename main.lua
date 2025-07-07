local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PanelCS"
gui.ResetOnSpawn = false

-- Sonido miau
local miau = Instance.new("Sound", gui)
miau.SoundId = "rbxassetid://9120470040"
miau.Volume = 1

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- Botón flotante con "C"
local boton = Instance.new("TextButton")
boton.Size = UDim2.new(0, 50, 0, 50)
boton.Position = UDim2.new(0, 20, 0.5, -25)
boton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
boton.Text = "C"
boton.TextScaled = true
boton.Font = Enum.Font.GothamBold
boton.TextColor3 = Color3.new(1, 1, 1)
boton.Parent = gui
Instance.new("UICorner", boton)

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 450, 0, 550)
panel.Position = UDim2.new(0.5, -225, 0.5, -275)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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

-- Sección de scripts
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 3, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 8)

-- Crear botón
local function crearBoton(texto, url)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.Position = UDim2.new(0.05, 0, 0, 0)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.Text = texto
	btn.TextScaled = true
	btn.Font = Enum.Font.Gotham
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.MouseButton1Click:Connect(function()
		pcall(function()
			loadstring(game:HttpGet(url))()
		end)
	end)
	return btn
end

-- Agregar scripts
crearBoton("🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot")
crearBoton("🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular")
crearBoton("🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails")
crearBoton("🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau")
crearBoton("🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
crearBoton("🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194")
crearBoton("📜 Infinity Yield (Comandos)", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

-- Mostrar / ocultar panel
boton.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
	if panel.Visible then miau:Play() end
end)

-- Efecto rainbow
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	for _, child in ipairs(scroll:GetChildren()) do
		if child:IsA("TextButton") then
			child.TextColor3 = color
		end
	end
end)
