local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "Christian_UI"
gui.ResetOnSpawn = false

-- BOTÓN "C"
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
openBtn.Text = "C"
openBtn.Font = Enum.Font.GothamBlack
openBtn.TextScaled = true
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.Draggable = true
openBtn.Parent = gui

-- PANEL PRINCIPAL
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true

-- TÍTULO
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "By Christian"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.BackgroundTransparency = 1

-- DATOS PERSONALES
local info = Instance.new("TextLabel", mainFrame)
info.Size = UDim2.new(1, -20, 0, 30)
info.Position = UDim2.new(0, 10, 0, 45)
info.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
info.Font = Enum.Font.Gotham
info.TextColor3 = Color3.new(1,1,1)
info.TextScaled = true
info.BackgroundTransparency = 1

-- BOTÓN "Scripts"
local scriptsBtn = Instance.new("TextButton", mainFrame)
scriptsBtn.Size = UDim2.new(0.5, -15, 0, 40)
scriptsBtn.Position = UDim2.new(0, 10, 0, 85)
scriptsBtn.Text = "📂 Scripts"
scriptsBtn.Font = Enum.Font.GothamBlack
scriptsBtn.TextScaled = true
scriptsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scriptsBtn.TextColor3 = Color3.new(1,1,1)

-- PANEL DE SCRIPTS
local scriptsFrame = Instance.new("Frame", gui)
scriptsFrame.Size = UDim2.new(0, 400, 0, 300)
scriptsFrame.Position = mainFrame.Position
scriptsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
scriptsFrame.Visible = false
scriptsFrame.Active = true
scriptsFrame.Draggable = true

-- TÍTULO Scripts
local scriptsTitle = Instance.new("TextLabel", scriptsFrame)
scriptsTitle.Size = UDim2.new(1, 0, 0, 40)
scriptsTitle.Position = UDim2.new(0, 0, 0, 0)
scriptsTitle.Text = "🎮 Juegos Populares"
scriptsTitle.Font = Enum.Font.GothamBold
scriptsTitle.TextColor3 = Color3.new(1, 1, 1)
scriptsTitle.TextScaled = true
scriptsTitle.BackgroundTransparency = 1

-- SCROLL CONTAINER
local scroll = Instance.new("ScrollingFrame", scriptsFrame)
scroll.Size = UDim2.new(1, -20, 1, -80)
scroll.Position = UDim2.new(0, 10, 0, 50)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 8

-- FUNCIÓN PARA CREAR BOTÓN DE SCRIPT
local function crearBoton(nombre, scriptURL, y)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(1, 0, 0, 40)
	btn.Position = UDim2.new(0, 0, 0, y)
	btn.Text = nombre
	btn.Font = Enum.Font.GothamBlack
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptURL))()
	end)
end

-- LISTA DE SCRIPTS
local scripts = {
	{"🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{"🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{"🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{"🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
	{"🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{"🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{"👁 ESP Player", "https://pastebin.com/raw/DZ3uT8tF"},
	{"🧱 Comandos (Infinity Yield)", "https://raw.githubusercontent.com/EdgeIY/infinityyield/master/source"}
}

-- CREAR TODOS LOS BOTONES
for i, data in ipairs(scripts) do
	crearBoton(data[1], data[2], (i - 1) * 45)
end

-- BOTÓN REGRESAR
local backBtn = Instance.new("TextButton", scriptsFrame)
backBtn.Size = UDim2.new(1, -20, 0, 40)
backBtn.Position = UDim2.new(0, 10, 1, -45)
backBtn.Text = "⬅️ Regresar"
backBtn.Font = Enum.Font.GothamBold
backBtn.TextScaled = true
backBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
backBtn.TextColor3 = Color3.new(1,1,1)

-- FUNCIONES DE MOSTRAR
openBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

scriptsBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	scriptsFrame.Visible = true
end)

backBtn.MouseButton1Click:Connect(function()
	scriptsFrame.Visible = false
	mainFrame.Visible = true
end)
