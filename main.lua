--// GUI GhostHub V2 - By Christian
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "GhostHubV2"
gui.ResetOnSpawn = false

-- Rainbow Function
local function rainbowColor()
	local t = tick()
	return Color3.fromRGB(
		math.floor(math.sin(t)*127+128),
		math.floor(math.sin(t+2)*127+128),
		math.floor(math.sin(t+4)*127+128)
	)
end

-- Main Frame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 360, 0, 500)
mainFrame.Position = UDim2.new(0.5, -180, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.3
mainFrame.Active = true
mainFrame.Draggable = true

-- UI Rainbow
local stroke = Instance.new("UIStroke", mainFrame)
stroke.Thickness = 2
stroke.Color = rainbowColor()

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌈 Im Christian Sebast"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- User Info
local info = Instance.new("TextLabel", mainFrame)
info.Size = UDim2.new(1, -20, 0, 25)
info.Position = UDim2.new(0, 10, 0, 45)
info.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
info.Font = Enum.Font.GothamSemibold
info.TextScaled = true
info.TextColor3 = Color3.new(1,1,1)
info.BackgroundTransparency = 1

-- Frame donde irán las carpetas
local folderFrame = Instance.new("Frame", mainFrame)
folderFrame.Size = UDim2.new(1, -20, 1, -100)
folderFrame.Position = UDim2.new(0, 10, 0, 80)
folderFrame.BackgroundTransparency = 1

-- Scroll (desplazamiento)
local scroll = Instance.new("ScrollingFrame", folderFrame)
scroll.Size = UDim2.new(1, 0, 1, 0)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1

-- Función para crear carpetas
local function crearCarpeta(nombre, callback)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(1, -10, 0, 40)
	btn.Position = UDim2.new(0, 5, 0, #scroll:GetChildren()*45)
	btn.Text = "📁 " .. nombre
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
	btn.MouseButton1Click:Connect(callback)
end

-- SubPanel para scripts por carpeta
local subPanel = Instance.new("Frame", gui)
subPanel.Size = UDim2.new(0, 360, 0, 500)
subPanel.Position = UDim2.new(0.5, -180, 0.5, -250)
subPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
subPanel.BackgroundTransparency = 0.3
subPanel.Visible = false
subPanel.Active = true
subPanel.Draggable = true

local subScroll = Instance.new("ScrollingFrame", subPanel)
subScroll.Size = UDim2.new(1, -20, 1, -60)
subScroll.Position = UDim2.new(0, 10, 0, 40)
subScroll.CanvasSize = UDim2.new(0, 0, 10, 0)
subScroll.ScrollBarThickness = 4
subScroll.BackgroundTransparency = 1

local subTitle = Instance.new("TextLabel", subPanel)
subTitle.Size = UDim2.new(1, 0, 0, 40)
subTitle.Text = ""
subTitle.Font = Enum.Font.Arcade
subTitle.TextScaled = true
subTitle.TextColor3 = Color3.new(1,1,1)
subTitle.BackgroundTransparency = 1

local regresar = Instance.new("TextButton", subPanel)
regresar.Size = UDim2.new(1, -20, 0, 40)
regresar.Position = UDim2.new(0, 10, 1, -45)
regresar.Text = "🔙 Regresar"
regresar.Font = Enum.Font.Arcade
regresar.TextScaled = true
regresar.TextColor3 = Color3.new(1,1,1)
regresar.BackgroundColor3 = Color3.fromRGB(50,50,50)
regresar.MouseButton1Click:Connect(function()
	subPanel.Visible = false
	mainFrame.Visible = true
end)

-- Función para agregar scripts en la subpestaña
local function mostrarScripts(nombre, scripts)
	subTitle.Text = nombre
	subScroll:ClearAllChildren()
	for i, scriptData in ipairs(scripts) do
		local btn = Instance.new("TextButton", subScroll)
		btn.Size = UDim2.new(1, -10, 0, 35)
		btn.Position = UDim2.new(0, 5, 0, (i-1)*40)
		btn.Text = "▶️ " .. scriptData.name
		btn.Font = Enum.Font.GothamBold
		btn.TextScaled = true
		btn.TextColor3 = Color3.new(1,1,1)
		btn.BackgroundColor3 = Color3.fromRGB(25,25,25)
		btn.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(scriptData.url))()
		end)
	end
	mainFrame.Visible = false
	subPanel.Visible = true
end

-- Scripts organizados
local juegosPopulares = {
	{name="Brainlot", url="https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{name="Jailbreak", url="https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{name="Dead Rails", url="https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{name="Blox Fruits", url="https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
	-- Agrega más si deseas
}

local comandos = {
	{name="Fly V3", url="https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{name="Touch Fling", url="https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{name="ESP Player", url="https://raw.githubusercontent.com/Bidachi/ESP/main/ESP.lua"},
	{name="Infinity Yield", url="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}

local general = {
	{name="Chat Troll", url="https://raw.githubusercontent.com/UltraStuff/scripts2/main/ChatTroll.lua"},
	{name="Zombie Virus", url="https://raw.githubusercontent.com/xennyy/nysource/main/ZombieInfection"},
	{name="Animation Changer", url="https://raw.githubusercontent.com/Syntaxx64/RobloxScripts/main/AnimationChanger.lua"},
	{name="RTX Shader", url="https://raw.githubusercontent.com/mgamingpro1/scripts/main/RTX.lua"},
	{name="Fling GUI", url="https://raw.githubusercontent.com/lerkermer/lua-projects/master/UniversalFlingGui.lua"},
	-- Añade 35+ más si quieres
}

-- Crear carpetas
crearCarpeta("Juegos Populares", function()
	mostrarScripts("Juegos Populares", juegosPopulares)
end)

crearCarpeta("Comandos", function()
	mostrarScripts("Comandos", comandos)
end)

crearCarpeta("General", function()
	mostrarScripts("General", general)
end)

-- Efecto Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local col = rainbowColor()
	stroke.Color = col
	for _, v in pairs(mainFrame:GetDescendants()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			v.TextColor3 = col
		end
	end
	for _, v in pairs(subPanel:GetDescendants()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			v.TextColor3 = col
		end
	end
end)
