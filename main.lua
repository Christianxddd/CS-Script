local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CS_F3XStyleUI"
gui.ResetOnSpawn = false

-- CONTRASEÑA INICIAL
local authFrame = Instance.new("Frame", gui)
authFrame.Size = UDim2.new(0.3, 0, 0.2, 0)
authFrame.Position = UDim2.new(0.35, 0, 0.4, 0)
authFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
authFrame.BorderSizePixel = 0
authFrame.Active = true
authFrame.Draggable = true

local authLabel = Instance.new("TextLabel", authFrame)
authLabel.Size = UDim2.new(1, 0, 0.4, 0)
authLabel.Text = "Introduce el código:"
authLabel.TextColor3 = Color3.new(1, 1, 1)
authLabel.Font = Enum.Font.Arcade
authLabel.TextScaled = true
authLabel.BackgroundTransparency = 1

local authBox = Instance.new("TextBox", authFrame)
authBox.Size = UDim2.new(1, -20, 0.3, 0)
authBox.Position = UDim2.new(0, 10, 0.4, 0)
authBox.PlaceholderText = "Código aquí..."
authBox.Font = Enum.Font.Arcade
authBox.TextScaled = true
authBox.Text = ""
authBox.TextColor3 = Color3.new(1,1,1)
authBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

local authBtn = Instance.new("TextButton", authFrame)
authBtn.Size = UDim2.new(1, -20, 0.25, 0)
authBtn.Position = UDim2.new(0, 10, 0.75, 0)
authBtn.Text = "Verificar"
authBtn.Font = Enum.Font.Arcade
authBtn.TextScaled = true
authBtn.TextColor3 = Color3.new(1,1,1)
authBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)

local verified = false
authBtn.MouseButton1Click:Connect(function()
	if authBox.Text == "AYAM" then
		authFrame:Destroy()
		verified = true
	else
		authLabel.Text = "Código incorrecto ❌"
	end
end)

-- ESPERA CÓDIGO
repeat task.wait() until verified

-- BOTÓN FLOTANTE "C"
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 50, 0, 50)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
cBtn.Text = "C"
cBtn.TextScaled = true
cBtn.Font = Enum.Font.Arcade
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.Active = true
cBtn.Draggable = true

-- PANEL PRINCIPAL
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0.22, 0, 0.7, 0)
panel.Position = UDim2.new(0, 80, 0.15, 0)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.Visible = false
panel.Active = true
panel.Draggable = true

-- TÍTULO
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0.08, 0)
title.Text = "By Christian"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.BackgroundTransparency = 1

-- FUNCIÓN PARA CREAR CARPETAS (secciones)
local function crearCarpeta(nombre, scripts, posY)
	local folderBtn = Instance.new("TextButton", panel)
	folderBtn.Size = UDim2.new(0.9, 0, 0.06, 0)
	folderBtn.Position = UDim2.new(0.05, 0, posY, 0)
	folderBtn.Text = "📁 " .. nombre
	folderBtn.Font = Enum.Font.Arcade
	folderBtn.TextScaled = true
	folderBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	folderBtn.TextColor3 = Color3.new(1,1,1)

	local frame = Instance.new("Frame", panel)
	frame.Size = UDim2.new(0.9, 0, 0.25, 0)
	frame.Position = UDim2.new(0.05, 0, posY + 0.06, 0)
	frame.Visible = false
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	
	local layout = Instance.new("UIListLayout", frame)
	layout.FillDirection = Enum.FillDirection.Vertical
	layout.Padding = UDim.new(0, 4)

	for _, data in ipairs(scripts) do
		local b = Instance.new("TextButton", frame)
		b.Size = UDim2.new(1, 0, 0, 30)
		b.Text = data.name
		b.Font = Enum.Font.Arcade
		b.TextScaled = true
		b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		b.TextColor3 = Color3.new(1,1,1)
		b.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(data.url))()
		end)
	end

	folderBtn.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)
end

-- SECCIONES
crearCarpeta("🕹 Juegos Populares", {
	{name="🧠 Brainlot", url="https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{name="🚓 Jailbreak", url="https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{name="🚂 Dead Rails", url="https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{name="🍉 Blox Fruits", url="https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
}, 0.1)

crearCarpeta("🧰 Comandos", {
	{name="🚀 Fly V3", url="https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{name="👁 ESP Player", url=""}, -- se implementa abajo
	{name="🌀 Touch Fling", url="https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{name="⚙️ Infinity Yield", url="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}, 0.42)

crearCarpeta("🌐 General", {
	{name="🔥 Admin V2", url="https://pastebin.com/raw/GnywzK8h"},
	{name="🎯 Aimlock", url="https://pastebin.com/raw/qUw3S3xy"},
	{name="💬 Chat Spy", url="https://pastebin.com/raw/uH0h5KxT"},
	{name="🎮 FPS Boost", url="https://pastebin.com/raw/P8yDdqB2"},
	{name="🧲 Gravity Tool", url="https://pastebin.com/raw/UXbE7SSt"},
}, 0.74)

-- BOTÓN ABRIR PANEL
cBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- ESP PLAYER FUNCIONALIDAD
local function toggleESP()
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
			if not plr.Character.Head:FindFirstChild("NameTag") then
				local gui = Instance.new("BillboardGui", plr.Character.Head)
				gui.Name = "NameTag"
				gui.Size = UDim2.new(0, 200, 0, 50)
				gui.AlwaysOnTop = true
				local txt = Instance.new("TextLabel", gui)
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.BackgroundTransparency = 1
				txt.Text = plr.Name
				txt.TextScaled = true
				txt.TextColor3 = Color3.fromRGB(0,255,0)
			else
				plr.Character.Head:FindFirstChild("NameTag"):Destroy()
			end
		end
	end
end

-- ASOCIAR BOTÓN ESP
for _, f in pairs(panel:GetDescendants()) do
	if f:IsA("TextButton") and f.Text:find("ESP Player") then
		f.MouseButton1Click:Connect(toggleESP)
	end
end
