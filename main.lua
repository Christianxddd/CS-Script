local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianPanelUI"
gui.ResetOnSpawn = false

-- 🟩 Botón flotante con tu logo personalizado
local iconBtn = Instance.new("ImageButton", gui)
iconBtn.Size = UDim2.new(0, 60, 0, 60)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.BackgroundTransparency = 1
iconBtn.Image = "rbxassetid://94777373855263"
iconBtn.Draggable = true
iconBtn.Name = "OpenBtn"

-- 🎨 Función arcoíris gamer
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

-- 🧱 Panel principal
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 420, 0, 520)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.2
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true

local uilist = Instance.new("UIListLayout", mainFrame)
uilist.SortOrder = Enum.SortOrder.LayoutOrder
uilist.Padding = UDim.new(0, 5)

-- 🌈 Rainbow efecto dinámico
local stroke = Instance.new("UIStroke", mainFrame)
stroke.Thickness = 2

-- 🏷️ Título y datos de usuario
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.LayoutOrder = 0

local datos = Instance.new("TextLabel", mainFrame)
datos.Size = UDim2.new(1, 0, 0, 25)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.Gotham
datos.TextColor3 = Color3.new(1,1,1)
datos.BackgroundTransparency = 1
datos.LayoutOrder = 1

-- 🔍 Barra de búsqueda
local buscador = Instance.new("TextBox", mainFrame)
buscador.PlaceholderText = "Buscar script..."
buscador.Size = UDim2.new(1, -20, 0, 30)
buscador.Position = UDim2.new(0, 10, 0, 75)
buscador.TextScaled = true
buscador.Font = Enum.Font.Gotham
buscador.TextColor3 = Color3.new(1,1,1)
buscador.BackgroundColor3 = Color3.fromRGB(50,50,50)
buscador.LayoutOrder = 2

-- 📂 Contenedor de contenido scrollable
local contentFrame = Instance.new("ScrollingFrame", mainFrame)
contentFrame.Size = UDim2.new(1, -10, 1, -160)
contentFrame.CanvasSize = UDim2.new(0,0,0,0)
contentFrame.ScrollBarThickness = 6
contentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
contentFrame.BackgroundTransparency = 1
contentFrame.LayoutOrder = 3

local listLayout = Instance.new("UIListLayout", contentFrame)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 6)

-- 🧩 Función para crear carpetas (categorías)
local function crearCarpeta(nombre)
	local folder = Instance.new("Frame")
	folder.Size = UDim2.new(1, -10, 0, 40)
	folder.BackgroundColor3 = Color3.fromRGB(45,45,45)

	local label = Instance.new("TextLabel", folder)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = "📁 " .. nombre
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.new(1,1,1)
	label.BackgroundTransparency = 1

	local subContent = Instance.new("Frame", contentFrame)
	subContent.Size = UDim2.new(1, -20, 0, 0)
	subContent.BackgroundTransparency = 1
	subContent.AutomaticSize = Enum.AutomaticSize.Y

	local subList = Instance.new("UIListLayout", subContent)
	subList.SortOrder = Enum.SortOrder.LayoutOrder
	subList.Padding = UDim.new(0, 3)

	folder.MouseEnter:Connect(function()
		folder.BackgroundColor3 = Color3.fromRGB(60,60,60)
	end)
	folder.MouseLeave:Connect(function()
		folder.BackgroundColor3 = Color3.fromRGB(45,45,45)
	end)

	folder.MouseButton1Click:Connect(function()
		subContent.Visible = not subContent.Visible
	end)

	folder.Parent = contentFrame
	subContent.Visible = false
	return subContent
end

-- 🔘 Función para crear botones de scripts
local function crearScript(nombre, scriptURL, padre)
	local btn = Instance.new("TextButton", padre)
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.Text = "▶ " .. nombre
	btn.TextScaled = true
	btn.Font = Enum.Font.Gotham
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptURL))()
	end)
end

-- 📁 Carpetas
local juegosPopulares = crearCarpeta("Juegos Populares")
local comandos = crearCarpeta("Comandos")

-- 🎮 Juegos Populares
crearScript("🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot", juegosPopulares)
crearScript("🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular", juegosPopulares)
crearScript("🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", juegosPopulares)
crearScript("🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau", juegosPopulares)

-- 🧰 Comandos
crearScript("🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt", comandos)
crearScript("🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194", comandos)
crearScript("👁 ESP Player", "https://raw.githubusercontent.com/yourESPscriptlink", comandos) -- reemplaza por tu link si tienes
crearScript("⌨️ Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", comandos)

-- 🔙 Botón regresar
local volver = Instance.new("TextButton", mainFrame)
volver.Size = UDim2.new(1, 0, 0, 30)
volver.Text = "⬅️ Regresar"
volver.TextScaled = true
volver.Font = Enum.Font.GothamBold
volver.TextColor3 = Color3.new(1,1,1)
volver.BackgroundColor3 = Color3.fromRGB(45,45,45)
volver.LayoutOrder = 5
volver.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

-- 🖌️ Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local col = rainbow()
	stroke.Color = col
	for _, c in pairs(mainFrame:GetDescendants()) do
		if c:IsA("TextLabel") or c:IsA("TextButton") then
			c.TextColor3 = col
		end
	end
end)

-- 🎮 Botón para abrir/cerrar el panel
iconBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)
