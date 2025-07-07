local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianPanelV2"
gui.ResetOnSpawn = false

-- BOTÓN DE LA "C"
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 60, 0, 60)
toggleBtn.Position = UDim2.new(0, 20, 0, 20)
toggleBtn.Text = "C"
toggleBtn.Font = Enum.Font.Arcade
toggleBtn.TextScaled = true
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.ZIndex = 5
toggleBtn.Draggable = true

-- PANEL PRINCIPAL
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0.6, 0, 0.8, 0)
mainFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.3
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true

local uiList = Instance.new("UIListLayout", mainFrame)
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 6)

-- TÍTULO Y DATOS
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

local datos = Instance.new("TextLabel", mainFrame)
datos.Size = UDim2.new(1, 0, 0, 30)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.Arcade
datos.TextColor3 = Color3.new(1, 1, 1)
datos.BackgroundTransparency = 1

-- SCROLL DE SECCIONES
local scroll = Instance.new("ScrollingFrame", mainFrame)
scroll.Size = UDim2.new(1, 0, 1, -80)
scroll.CanvasSize = UDim2.new(0, 0, 5, 0)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 5
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
local sectionList = Instance.new("UIListLayout", scroll)
sectionList.SortOrder = Enum.SortOrder.LayoutOrder
sectionList.Padding = UDim.new(0, 4)

-- FUNCIÓN: CREAR CARPETA SECCIÓN
local function crearCarpeta(nombre)
	local carpeta = Instance.new("Frame")
	carpeta.Size = UDim2.new(1, 0, 0, 30)
	carpeta.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

	local title = Instance.new("TextButton", carpeta)
	title.Size = UDim2.new(1, 0, 1, 0)
	title.Text = "📁 "..nombre
	title.TextScaled = true
	title.Font = Enum.Font.Arcade
	title.TextColor3 = Color3.new(1,1,1)
	title.BackgroundTransparency = 1

	local contenedor = Instance.new("Frame", carpeta)
	contenedor.Name = "Contenido"
	contenedor.Size = UDim2.new(1, 0, 0, 0)
	contenedor.ClipsDescendants = true
	contenedor.BackgroundTransparency = 1
	contenedor.LayoutOrder = 2

	local lista = Instance.new("UIListLayout", contenedor)
	lista.SortOrder = Enum.SortOrder.LayoutOrder
	lista.Padding = UDim.new(0, 4)

	local abierto = false
	title.MouseButton1Click:Connect(function()
		abierto = not abierto
		contenedor.Size = abierto and UDim2.new(1,0,0, #contenedor:GetChildren()*40) or UDim2.new(1,0,0,0)
	end)

	return carpeta, contenedor
end

-- FUNCIÓN: CREAR BOTÓN DE SCRIPT
local function crearScript(nombre, link)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.Text = "▶️ "..nombre
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(link))()
	end)
	return btn
end

-- 📂 JUEGOS POPULARES
local carpetaJuegos, contenidoJuegos = crearCarpeta("Juegos Populares")
carpetaJuegos.Parent = scroll

contenidoJuegos:AddChild(crearScript("🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))
contenidoJuegos:AddChild(crearScript("🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))
contenidoJuegos:AddChild(crearScript("🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"))
contenidoJuegos:AddChild(crearScript("🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))
-- Agrega más juegos aquí...

-- 📂 COMANDOS
local carpetaComandos, contenidoComandos = crearCarpeta("Comandos")
carpetaComandos.Parent = scroll

contenidoComandos:AddChild(crearScript("🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))
contenidoComandos:AddChild(crearScript("🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))
contenidoComandos:AddChild(crearScript("👁 ESP Player", "https://raw.githubusercontent.com/zekewaze/ESP-NameTags/main/main.lua"))
contenidoComandos:AddChild(crearScript("📜 Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))

-- BOTÓN DE REGRESAR EN SECCIONES EXPANDIDAS (solo visible si lo necesitas)
local function crearRegresar()
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.Text = "⬅️ Regresar"
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.MouseButton1Click:Connect(function()
		for _, v in pairs(scroll:GetChildren()) do
			if v:IsA("Frame") and v:FindFirstChild("Contenido") then
				v.Contenido.Size = UDim2.new(1, 0, 0, 0)
			end
		end
	end)
	return btn
end

scroll:AddChild(crearRegresar())

-- MOSTRAR PANEL CON BOTÓN "C"
toggleBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)
