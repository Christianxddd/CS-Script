local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianHub"
gui.ResetOnSpawn = false

-- Botón con "C"
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 10, 0, 10)
openBtn.Text = "C"
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBold
openBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Draggable = true

-- Panel principal vertical
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 300, 0, 500)
main.Position = UDim2.new(0.5, -150, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Visible = false
main.Draggable = true
main.Active = true

-- Rainbow efecto
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2

local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- Título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "By Christian"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Datos
local info = Instance.new("TextLabel", main)
info.Size = UDim2.new(1, -10, 0, 40)
info.Position = UDim2.new(0, 5, 0, 40)
info.Text = "Usuario: Christian_xyx\nTikTok: @christ_sebast_7d"
info.TextColor3 = Color3.new(1, 1, 1)
info.TextScaled = true
info.BackgroundTransparency = 1
info.Font = Enum.Font.Gotham

-- ScrollingFrame
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -10, 1, -90)
scroll.Position = UDim2.new(0, 5, 0, 90)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1

-- Función para crear secciones
local function crearSeccion(nombre, y)
	local label = Instance.new("TextLabel", scroll)
	label.Position = UDim2.new(0, 0, 0, y)
	label.Size = UDim2.new(1, 0, 0, 30)
	label.Text = "📂 " .. nombre
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.new(1,1,1)
	label.BackgroundTransparency = 1
	return label
end

-- Función para crear botón de script
local function crearScript(nombre, y, url)
	local btn = Instance.new("TextButton", scroll)
	btn.Position = UDim2.new(0.05, 0, 0, y)
	btn.Size = UDim2.new(0.9, 0, 0, 30)
	btn.Text = nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.Gotham
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url))()
	end)
	return btn
end

-- Sección: Juegos Populares
local y = 0
crearSeccion("Juegos Populares", y)
y += 35
crearScript("🧠 Brainlot", y, "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot")
y += 35
crearScript("🚓 Jailbreak", y, "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular")
y += 35
crearScript("🍉 Blox Fruits", y, "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau")
y += 35
crearScript("🚂 Dead Rails", y, "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails")

-- Sección: Comandos
y += 45
crearSeccion("Comandos", y)
y += 35
crearScript("🚀 Fly V3", y, "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
y += 35
crearScript("👁 ESP Player", y, "https://raw.githubusercontent.com/YourESPLinkHere") -- ← Puedes personalizar si quieres
y += 35
crearScript("🌀 Touch Fling", y, "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194")
y += 35
crearScript("💻 Infinity Yield", y, "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

-- Mostrar/ocultar panel
openBtn.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
end)

-- Efecto Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	for _, child in pairs(scroll:GetChildren()) do
		if child:IsA("TextButton") or child:IsA("TextLabel") then
			child.TextColor3 = color
		end
	end
end)
