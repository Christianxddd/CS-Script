--[[
🔰 PANEL PROFESIONAL by ChristianSebas
-- Discord: @christianxyx
-- TikTok: @christ_sebast_7d
-- GitHub: github.com/Christianxddd
]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PanelProCS"
gui.ResetOnSpawn = false

-- Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- Botón "C"
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
openBtn.Text = "C"
openBtn.Font = Enum.Font.Arcade
openBtn.TextScaled = true
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Active = true
openBtn.Draggable = true

-- Panel principal
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 450)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.3
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true
local stroke = Instance.new("UIStroke", mainFrame)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Im Christian Sebast"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Arcade
title.TextScaled = true

-- Datos
local datos = Instance.new("TextLabel", mainFrame)
datos.Size = UDim2.new(1, 0, 0, 20)
datos.Position = UDim2.new(0, 0, 0, 30)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextColor3 = Color3.new(1, 1, 1)
datos.BackgroundTransparency = 1
datos.Font = Enum.Font.Gotham
datos.TextScaled = true

-- Botón cerrar
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.Arcade
closeBtn.TextScaled = true
closeBtn.TextColor3 = Color3.new(1, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

-- Mostrar panel
openBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- Lista de carpetas
local carpetas = {
	["Juegos Populares"] = {
		{nombre = "Blox Fruits", url = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
		{nombre = "Brainlot", url = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
		{nombre = "Jailbreak", url = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
		{nombre = "Dead Rails", url = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", raw = true},
		-- + Agrega más scripts aquí
	},

	["Comandos"] = {
		{nombre = "Fly V3", url = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
		{nombre = "Touch Fling", url = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
		{nombre = "ESP Player", esToggle = true},
		{nombre = "Infinity Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
	},

	["General"] = {
		-- Más de 40 scripts variados y útiles
		{nombre = "Anti Lag", url = "https://pastebin.com/raw/HXG1qEwx"},
		{nombre = "Admin GUI", url = "https://raw.githubusercontent.com/FilteringEnabled/FE/main/FEAdminV2"},
		-- Agrega más aquí...
	},

	["Utilidades"] = {
		{nombre = "FPS Booster", url = "https://pastebin.com/raw/KwS3U8mE"},
		{nombre = "Bypasser", url = "https://raw.githubusercontent.com/xxzzr/testing/main/bypass"},
	},

	["Troll y Experimentos"] = {
		{nombre = "Morph GUI", url = "https://raw.githubusercontent.com/Squex01/MorphGUI/main/main.lua"},
		{nombre = "Screamer GUI", url = "https://pastebin.com/raw/WpM3QwZK"},
	}
}

-- Función para crear pestañas
local function crearPestana(nombreCarpeta, scripts)
	local scroll = Instance.new("ScrollingFrame", mainFrame)
	scroll.Size = UDim2.new(1, -20, 1, -80)
	scroll.Position = UDim2.new(0, 10, 0, 60)
	scroll.CanvasSize = UDim2.new(0, 0, 0, #scripts * 45)
	scroll.ScrollBarThickness = 6
	scroll.Visible = false
	scroll.Name = nombreCarpeta
	scroll.BackgroundTransparency = 1

	for i, script in ipairs(scripts) do
		local b = Instance.new("TextButton", scroll)
		b.Size = UDim2.new(1, -10, 0, 40)
		b.Position = UDim2.new(0, 5, 0, (i - 1) * 45)
		b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		b.TextColor3 = Color3.new(1, 1, 1)
		b.Font = Enum.Font.GothamBold
		b.TextScaled = true
		b.Text = script.nombre
		b.MouseButton1Click:Connect(function()
			if script.esToggle then
				-- Toggle ESP
				local state = not _G.espOn
				_G.espOn = state
				for _, v in pairs(game.Players:GetPlayers()) do
					if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
						if state then
							local gui = Instance.new("BillboardGui", v.Character.Head)
							gui.Name = "NameTag"
							gui.Size = UDim2.new(0, 200, 0, 50)
							gui.AlwaysOnTop = true
							gui.Adornee = v.Character.Head
							local txt = Instance.new("TextLabel", gui)
							txt.Size = UDim2.new(1, 0, 1, 0)
							txt.BackgroundTransparency = 1
							txt.Text = v.Name
							txt.TextColor3 = Color3.new(1, 1, 1)
							txt.TextScaled = true
						else
							local tag = v.Character.Head:FindFirstChild("NameTag")
							if tag then tag:Destroy() end
						end
					end
				end
			elseif script.url then
				local success, err = pcall(function()
					loadstring(game:HttpGet(script.url, script.raw or false))()
				end)
				if not success then warn("Error al cargar:", err) end
			end
		end)
	end

	return scroll
end

-- Barra de búsqueda
local search = Instance.new("TextBox", mainFrame)
search.Size = UDim2.new(0.5, 0, 0, 25)
search.Position = UDim2.new(0.05, 0, 1, -30)
search.PlaceholderText = "🔍 Buscar script..."
search.Font = Enum.Font.Gotham
search.TextScaled = true
search.TextColor3 = Color3.new(1,1,1)
search.BackgroundColor3 = Color3.fromRGB(30,30,30)

-- Carpeta activa
local pestañas = {}
local actual = nil

-- Botones de carpetas
for i, carpeta in ipairs({"Juegos Populares", "Comandos", "General", "Utilidades", "Troll y Experimentos"}) do
	local btn = Instance.new("TextButton", mainFrame)
	btn.Size = UDim2.new(0.18, 0, 0, 30)
	btn.Position = UDim2.new(0.02 + ((i - 1) * 0.19), 0, 0, 55)
	btn.Text = carpeta
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)

	local p = crearPestana(carpeta, carpetas[carpeta])
	pestañas[carpeta] = p

	btn.MouseButton1Click:Connect(function()
		for _, frame in pairs(pestañas) do
			frame.Visible = false
		end
		p.Visible = true
	end)
end

-- Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local c = rainbow()
	title.TextColor3 = c
	stroke.Color = c
	for _, obj in ipairs(mainFrame:GetDescendants()) do
		if obj:IsA("TextButton") or obj:IsA("TextLabel") then
			obj.TextColor3 = c
		end
	end
end)
