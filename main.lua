local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "ChristianPanel"
gui.ResetOnSpawn = false

-- RAINBOW COLOR FUNCTION
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2) * 127 + 128,
		math.sin(t + 4) * 127 + 128
	)
end

-- BOTÓN FLOTANTE "C"
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 60, 0, 60)
icon.Position = UDim2.new(0, 20, 0, 20)
icon.Text = "C"
icon.TextScaled = true
icon.Font = Enum.Font.Arcade
icon.BackgroundColor3 = Color3.new(0, 0, 0)
icon.TextColor3 = Color3.new(1, 1, 1)
icon.Name = "OpenPanel"

-- PANEL PRINCIPAL
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0.9, 0, 0.4, 0)
panel.Position = UDim2.new(0.05, 0, 0.3, 0)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.3
panel.Visible = false
panel.ClipsDescendants = true
panel.Active = true
panel.Draggable = true

local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- TÍTULO
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- FUNCIÓN PARA CREAR BOTONES
local function createBtn(text, xPos, callback)
	local btn = Instance.new("TextButton", panel)
	btn.Size = UDim2.new(0, 140, 0, 40)
	btn.Position = UDim2.new(0, xPos, 0, 50)
	btn.Text = text
	btn.TextScaled = true
	btn.Font = Enum.Font.Arcade
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.MouseButton1Click:Connect(callback)
	return btn
end

-- BOTONES CON FUNCIONES
createBtn("🚀 Fly V3", 10, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

local espToggle = false
createBtn("👁 ESP Player", 160, function()
	espToggle = not espToggle
	for _, v in pairs(game.Players:GetPlayers()) do
		if v ~= plr and v.Character and v.Character:FindFirstChild("Head") then
			if espToggle then
				local tag = Instance.new("BillboardGui", v.Character.Head)
				tag.Name = "NameTag"
				tag.Size = UDim2.new(0, 200, 0, 50)
				tag.AlwaysOnTop = true
				tag.Adornee = v.Character.Head
				local label = Instance.new("TextLabel", tag)
				label.Size = UDim2.new(1, 0, 1, 0)
				label.BackgroundTransparency = 1
				label.Text = v.Name
				label.TextScaled = true
				label.TextColor3 = Color3.new(1,1,1)
			else
				local tag = v.Character.Head:FindFirstChild("NameTag")
				if tag then tag:Destroy() end
			end
		end
	end
end)

local flingUsed = false
createBtn("🌀 Touch Fling", 310, function()
	if not flingUsed then
		flingUsed = true
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))()
	end
end)

createBtn("🧠 Brainlot", 460, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
end)

createBtn("🚓 Jailbreak", 610, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
end)

createBtn("🚂 Dead Rails", 760, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
end)

createBtn("🍉 Blox Fruits", 910, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end)

-- CERRAR PANEL
local closeBtn = Instance.new("TextButton", panel)
closeBtn.Size = UDim2.new(0, 60, 0, 30)
closeBtn.Position = UDim2.new(1, -70, 0, 10)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.Arcade
closeBtn.TextColor3 = Color3.new(1, 0.2, 0.2)
closeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
closeBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
end)

-- ABRIR PANEL
icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- RAINBOW
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	for _, c in pairs(panel:GetChildren()) do
		if c:IsA("TextButton") or c:IsA("TextLabel") then
			c.TextColor3 = color
		end
	end
end)
