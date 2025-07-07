-- Panel Gamer V2 Profesional by ChristianSebast

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

-- Función efecto rainbow
local function rainbowColor()
	local t = tick()
	return Color3.fromHSV((t * 0.5) % 1, 1, 1)
end

-- Crear ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "ChristianSebasGamerPanelV2"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Sonido miau
local sound = Instance.new("Sound", gui)
sound.SoundId = "rbxassetid://145069956" -- Sonido miau clásico
sound.Volume = 0.7

-- Icono Creeper botón flotante
local iconBtn = Instance.new("ImageButton", gui)
iconBtn.Name = "IconCreeperBtn"
iconBtn.Size = UDim2.new(0, 60, 0, 60)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.BackgroundColor3 = Color3.new(0, 0, 0)
iconBtn.BorderSizePixel = 0
iconBtn.Image = "rbxassetid://81656946" -- Creeper face icon
iconBtn.AutoButtonColor = true
iconBtn.ZIndex = 5
iconBtn.Active = true
iconBtn.Draggable = true

-- Panel principal (vertical)
local panel = Instance.new("Frame", gui)
panel.Name = "MainPanel"
panel.Size = UDim2.new(0, 300, 0.75, 0) -- vertical panel, 75% alto de pantalla
panel.Position = UDim2.new(0, 20, 0, 90)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.35
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.ZIndex = 4

-- UICorner para panel
local panelCorner = Instance.new("UICorner", panel)
panelCorner.CornerRadius = UDim.new(0, 10)

-- Borde con UIStroke
local panelStroke = Instance.new("UIStroke", panel)
panelStroke.Thickness = 2
panelStroke.Color = Color3.new(1, 0, 0) -- se actualizará con rainbow

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Im Christian Sebast"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.ZIndex = 5

-- Barra de búsqueda
local searchBox = Instance.new("TextBox", panel)
searchBox.Size = UDim2.new(0.95, 0, 0, 30)
searchBox.Position = UDim2.new(0.025, 0, 0, 50)
searchBox.PlaceholderText = "🔍 Buscar..."
searchBox.ClearTextOnFocus = false
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
searchBox.TextScaled = true
searchBox.Font = Enum.Font.Arcade
searchBox.ZIndex = 5
local searchCorner = Instance.new("UICorner", searchBox)
searchCorner.CornerRadius = UDim.new(0,6)

-- Botón minimizar
local minimizeBtn = Instance.new("TextButton", panel)
minimizeBtn.Size = UDim2.new(0, 40, 0, 30)
minimizeBtn.Position = UDim2.new(1, -45, 0, 5)
minimizeBtn.Text = "—"
minimizeBtn.Font = Enum.Font.Arcade
minimizeBtn.TextScaled = true
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
minimizeBtn.ZIndex = 5
local minBtnCorner = Instance.new("UICorner", minimizeBtn)
minBtnCorner.CornerRadius = UDim.new(0,5)

minimizeBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
end)

-- Contenedor para las secciones
local sectionsFrame = Instance.new("ScrollingFrame", panel)
sectionsFrame.Size = UDim2.new(0.95, 0, 1, -90)
sectionsFrame.Position = UDim2.new(0.025, 0, 0, 80)
sectionsFrame.BackgroundTransparency = 1
sectionsFrame.ScrollBarThickness = 5
sectionsFrame.CanvasSize = UDim2.new(0, 0, 2, 0) -- ajuste dinámico después
sectionsFrame.ZIndex = 5

-- UIListLayout para ordenar secciones verticalmente
local sectionsLayout = Instance.new("UIListLayout", sectionsFrame)
sectionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
sectionsLayout.Padding = UDim.new(0, 8)

-- Tabla para guardar todos los scripts de juegos y utilidades
local gamesPopular = {
	{ name = "Blox Fruits", script = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau", desc = "Script para Blox Fruits. Diviértete y desbloquea frutas." },
	{ name = "Jailbreak", script = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular", desc = "Script para Jailbreak con funcionalidades de farm." },
	{ name = "Dead Rails", script = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", desc = "Script para Dead Rails, automatiza tareas." },
	{ name = "BedWars", script = "https://raw.githubusercontent.com/RegularVynixu/Utilities/main/BedWars/bedwars.lua", desc = "Script para BedWars con hacks y funciones." },
	{ name = "Brookhaven 🏡", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/Brookhaven.lua", desc = "Script para Brookhaven para mejoras y trucos." },
	{ name = "Pet Simulator X 🐾", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/PetSimulatorX.lua", desc = "Scripts para Pet Simulator X con utilidades." },
	{ name = "Arsenal 🔫", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/Arsenal.lua", desc = "Script para Arsenal con mods y hacks." },
	{ name = "Doors 🚪", script = "https://raw.githubusercontent.com/TheEpicBlox/Fly/main/Doors.lua", desc = "Script para Doors, ayuda y mejoras." },
	{ name = "Evade 💨", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/Evade.lua", desc = "Scripts para Evade con funciones extra." },
	{ name = "Shindo Life 🌀", script = "https://raw.githubusercontent.com/RegularVynixu/Utilities/main/ShindoLife/ShindoLife.lua", desc = "Script para Shindo Life con mejoras." },
	{ name = "Murder Mystery 2 🔪", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/MM2.lua", desc = "Script para Murder Mystery 2 con mods." },
	{ name = "Anime Fighters 🥊", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/AnimeFighters.lua", desc = "Script para Anime Fighters con hacks." },
	{ name = "Phantom Forces 🎯", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/PhantomForces.lua", desc = "Script para Phantom Forces con mods." },
	{ name = "Natural Disaster Survival 🌪️", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/NaturalDisaster.lua", desc = "Script para Natural Disaster Survival." },
	{ name = "Tower of Hell 🗼", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/TowerOfHell.lua", desc = "Script para Tower of Hell, trucos y más." }
}

local utilities = {
	{ name = "Fly V3", script = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt", desc = "Activa el modo vuelo con Fly V3." },
	{ name = "ESP Player", script = "", desc = "Muestra el nombre de los jugadores sobre sus cabezas. Toggle ON/OFF." },
	{ name = "Touch Fling", script = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194", desc = "Activa el script de Touch Fling ultra power." },
	{ name = "Brainlot", script = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot", desc = "Script para Brainlot." },
	{ name = "Infinity Yield (Comandos)", script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", desc = "Panel de comandos universal." },
	{ name = "Anti AFK", script = "https://raw.githubusercontent.com/EdgeIY/AntiAfk/master/source", desc = "Evita que te baneen por estar AFK." },
	{ name = "Chat Spy", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/ChatSpy.lua", desc = "Visualiza chats ocultos en juegos." },
	{ name = "Admin Panel", script = "https://raw.githubusercontent.com/EdgeIY/AdminV3ForRoblox/master/Source", desc = "Panel de admin para juegos." },
	{ name = "Walk on Walls", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/WalkOnWalls.lua", desc = "Permite caminar sobre paredes." },
	{ name = "Auto Clicker", script = "https://raw.githubusercontent.com/Project-X-Roblox/Project-X-Roblox/main/AutoClicker.lua", desc = "Automatiza clicks." }
}

-- Helper para crear botones secciones (expandibles)
local function crearSeccion(titulo, items)
	local container = Instance.new("Frame", sectionsFrame)
	container.Size = UDim2.new(1, 0, 0, 40)
	container.BackgroundColor3 = Color3.fromRGB(30,30,30)
	container.BackgroundTransparency = 0.5
	container.LayoutOrder = #sectionsFrame:GetChildren()
	container.ClipsDescendants = true

	local corner = Instance.new("UICorner", container)
	corner.CornerRadius = UDim.new(0,8)

	local header = Instance.new("TextButton", container)
	header.Size = UDim2.new(1, 0, 0, 40)
	header.BackgroundColor3 = Color3.fromRGB(40,40,40)
	header.TextColor3 = Color3.new(1,1,1)
	header.Text = titulo .. " ▼"
	header.Font = Enum.Font.Arcade
	header.TextScaled = true
	header.AutoButtonColor = false
	header.LayoutOrder = 1
	header.ZIndex = 6

	local itemsFrame = Instance.new("Frame", container)
	itemsFrame.Size = UDim2.new(1, 0, 0, 0)
	itemsFrame.Position = UDim2.new(0, 0, 0, 40)
	itemsFrame.BackgroundTransparency = 1
	itemsFrame.ClipsDescendants = true
	itemsFrame.LayoutOrder = 2
	itemsFrame.Visible = false

	local layout = Instance.new("UIListLayout", itemsFrame)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0,6)

	-- Función para alternar visibilidad
	header.MouseButton1Click:Connect(function()
		itemsFrame.Visible = not itemsFrame.Visible
		header.Text = titulo .. (itemsFrame.Visible and " ▲" or " ▼")
		if itemsFrame.Visible then
			local totalHeight = #items * 45
			itemsFrame:TweenSize(UDim2.new(1, 0, 0, totalHeight), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
			container:TweenSize(UDim2.new(1, 0, 0, 40 + totalHeight), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
		else
			itemsFrame:TweenSize(UDim2.new(1,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
			container:TweenSize(UDim2.new(1,0,0,40), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
		end
	end)

	-- Crear botón para cada script
	for i, item in ipairs(items) do
		local btn = Instance.new("TextButton", itemsFrame)
		btn.Size = UDim2.new(1, 0, 0, 40)
		btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
		btn.TextColor3 = Color3.new(1,1,1)
		btn.Font = Enum.Font.Arcade
		btn.TextScaled = true
		btn.Text = item.name
		btn.AutoButtonColor = false
		btn.LayoutOrder = i
		btn.ZIndex = 7

		local cornerBtn = Instance.new("UICorner", btn)
		cornerBtn.CornerRadius = UDim.new(0,6)

		-- Al tocar botón abrir subventana con info
		btn.MouseButton1Click:Connect(function()
			openInfoWindow(item)
		end)
	end

	return container
end

-- Crear la ventana modal de info del script
local infoWindow = Instance.new("Frame", gui)
infoWindow.Name = "InfoWindow"
infoWindow.Size = UDim2.new(0, 350, 0, 200)
infoWindow.Position = UDim2.new(0.5, -175, 0.5, -100)
infoWindow.BackgroundColor3 = Color3.fromRGB(30,30,30)
infoWindow.BackgroundTransparency = 0.25
infoWindow.Visible = false
infoWindow.ZIndex = 10
infoWindow.ClipsDescendants = true
infoWindow.Active = true
infoWindow.Draggable = true

local infoCorner = Instance.new("UICorner", infoWindow)
infoCorner.CornerRadius = UDim.new(0, 10)

local infoTitle = Instance.new("TextLabel", infoWindow)
infoTitle.Size = UDim2.new(1, -20, 0, 40)
infoTitle.Position = UDim2.new(0, 10, 0, 10)
infoTitle.BackgroundTransparency = 1
infoTitle.TextColor3 = Color3.new(1,1,1)
infoTitle.Font = Enum.Font.Arcade
infoTitle.TextScaled = true
infoTitle.TextXAlignment = Enum.TextXAlignment.Left

local infoDesc = Instance.new("TextLabel", infoWindow)
infoDesc.Size = UDim2.new(1, -20, 0, 80)
infoDesc.Position = UDim2.new(0, 10, 0, 60)
infoDesc.BackgroundTransparency = 1
infoDesc.TextColor3 = Color3.new(1,1,1)
infoDesc.Font = Enum.Font.Arcade
infoDesc.TextWrapped = true
infoDesc.TextXAlignment = Enum.TextXAlignment.Left
infoDesc.TextYAlignment = Enum.TextYAlignment.Top
infoDesc.TextScaled = false
infoDesc.TextSize = 16

local executeBtn = Instance.new("TextButton", infoWindow)
executeBtn.Size = UDim2.new(0.4, 0, 0, 40)
executeBtn.Position = UDim2.new(0.05, 0, 1, -50)
executeBtn.Text = "Ejecutar"
executeBtn.Font = Enum.Font.Arcade
executeBtn.TextScaled = true
executeBtn.TextColor3 = Color3.new(1,1,1)
executeBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
executeBtn.AutoButtonColor = false
local executeCorner = Instance.new("UICorner", executeBtn)
executeCorner.CornerRadius = UDim.new(0, 8)

local cancelBtn = Instance.new("TextButton", infoWindow)
cancelBtn.Size = UDim2.new(0.4, 0, 0, 40)
cancelBtn.Position = UDim2.new(0.55, 0, 1, -50)
cancelBtn.Text = "Cancelar"
cancelBtn.Font = Enum.Font.Arcade
cancelBtn.TextScaled = true
cancelBtn.TextColor3 = Color3.new(1,1,1)
cancelBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
cancelBtn.AutoButtonColor = false
local cancelCorner = Instance.new("UICorner", cancelBtn)
cancelCorner.CornerRadius = UDim.new(0, 8)

local currentScript = nil

function openInfoWindow(item)
	infoTitle.Text = item.name
	infoDesc.Text = item.desc
	infoWindow.Visible = true
	currentScript = item.script
end

executeBtn.MouseButton1Click:Connect(function()
	if currentScript and currentScript ~= "" then
		local success, err = pcall(function()
			loadstring(game:HttpGet(currentScript))()
		end)
		if not success then
			warn("Error al ejecutar script: ", err)
		end
	end
	infoWindow.Visible = false
end)

cancelBtn.MouseButton1Click:Connect(function()
	infoWindow.Visible = false
end)

-- Crear las secciones en el panel
local juegosPopularesSection = crearSeccion("🔥 Juegos Populares", gamesPopular)
local utilidadesSection = crearSeccion("🛠️ Utilidades", utilities)

-- Efecto rainbow dinámico para texto y bord
