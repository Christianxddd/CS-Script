local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasProPanel"
gui.ResetOnSpawn = false

-- Función para color rainbow
local function rainbow()
	local t = tick()
	return Color3.fromHSV((t * 0.5) % 1, 1, 1)
end

-- Botón flotante "C"
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

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 350, 0, 600)
panel.Position = UDim2.new(0, 100, 0, 100)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.25
panel.Visible = false
panel.Active = true
panel.Draggable = true
panel.ClipsDescendants = true

local uicorner = Instance.new("UICorner", panel)
uicorner.CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2
stroke.Color = rainbow()

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "By Christian"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)

-- Datos usuario y TikTok
local info = Instance.new("TextLabel", panel)
info.Size = UDim2.new(1, -20, 0, 60)
info.Position = UDim2.new(0, 10, 0, 45)
info.BackgroundTransparency = 1
info.Text = "Usuario Roblox: Christian_xyx\nTikTok: @christ_sebast_7d"
info.Font = Enum.Font.Gotham
info.TextColor3 = Color3.new(1, 1, 1)
info.TextWrapped = true
info.TextYAlignment = Enum.TextYAlignment.Top
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextSize = 18

-- Barra de búsqueda
local searchBox = Instance.new("TextBox", panel)
searchBox.Size = UDim2.new(1, -20, 0, 30)
searchBox.Position = UDim2.new(0, 10, 0, 110)
searchBox.PlaceholderText = "Buscar scripts..."
searchBox.ClearTextOnFocus = false
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 18
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.ClipsDescendants = true
searchBox.AutomaticFocus = false

local uicornerSB = Instance.new("UICorner", searchBox)
uicornerSB.CornerRadius = UDim.new(0, 8)

-- Contenedor scroll para carpetas
local scrollFrame = Instance.new("ScrollingFrame", panel)
scrollFrame.Size = UDim2.new(1, -20, 1, -160)
scrollFrame.Position = UDim2.new(0, 10, 0, 150)
scrollFrame.CanvasSize = UDim2.new(0, 0, 3, 0) -- altura para scroll
scrollFrame.ScrollBarThickness = 6
scrollFrame.BackgroundTransparency = 1

-- Tabla para guardar carpetas (frames)
local folders = {}

-- Función para crear carpetas (frames plegables)
local function crearCarpeta(nombre, posY)
	local carpeta = Instance.new("Frame", scrollFrame)
	carpeta.Size = UDim2.new(1, 0, 0, 40)
	carpeta.Position = UDim2.new(0, 0, 0, posY)
	carpeta.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	carpeta.ClipsDescendants = true
	local uicorner = Instance.new("UICorner", carpeta)
	uicorner.CornerRadius = UDim.new(0, 6)
	
	-- Título carpeta (botón para expandir)
	local header = Instance.new("TextButton", carpeta)
	header.Size = UDim2.new(1, 0, 0, 40)
	header.BackgroundTransparency = 1
	header.Text = nombre .. "  [+]"
	header.TextColor3 = Color3.new(1, 1, 1)
	header.Font = Enum.Font.Arcade
	header.TextScaled = true
	header.AutoButtonColor = false
	
	-- Contenedor interno para scripts, inicialmente oculto
	local content = Instance.new("Frame", carpeta)
	content.Size = UDim2.new(1, 0, 0, 0)
	content.Position = UDim2.new(0, 0, 0, 40)
	content.BackgroundTransparency = 1
	content.ClipsDescendants = true
	
	-- Variable estado carpeta
	local abierto = false
	
	-- Función toggle
	header.MouseButton1Click:Connect(function()
		if abierto then
			-- Cerrar
			content:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.3, true)
			header.Text = nombre .. "  [+]"
			abierto = false
		else
			-- Abrir
			content:TweenSize(UDim2.new(1, 0, 0, #content:GetChildren()*40), "Out", "Quad", 0.3, true)
			header.Text = nombre .. "  [-]"
			abierto = true
		end
	end)
	
	-- Función para actualizar altura carpeta según hijos
	local function actualizarAltura()
		local count = 0
		for _, v in pairs(content:GetChildren()) do
			if v:IsA("TextButton") then
				count += 1
			end
		end
		content.Size = UDim2.new(1, 0, 0, count*40)
		carpeta.Size = UDim2.new(1, 0, 0, 40 + (abierto and count*40 or 0))
	end
	
	-- Retorna la carpeta y funciones útiles
	return carpeta, content, actualizarAltura
end

-- Crear carpeta Juegos Populares
local juegosPopulares, contJuegos, actualizarJuegosAltura = crearCarpeta("Juegos Populares", 0)
folders["Juegos Populares"] = {frame = juegosPopulares, content = contJuegos, actualizar = actualizarJuegosAltura}

-- Agregar scripts a Juegos Populares
local juegosScripts = {
	{nombre = "Brainlot", url = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{nombre = "Jailbreak", url = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{nombre = "Dead Rails", url = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{nombre = "Blox Fruits", url = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
	-- Agrega 10 más si quieres
}

for i, scriptData in ipairs(juegosScripts) do
	local btn = Instance.new("TextButton", contJuegos)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, (i-1)*40)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Text = scriptData.nombre
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.AutoButtonColor = true
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptData.url))()
	end)
end
actualizarJuegosAltura()

-- Crear carpeta Comandos
local comandos, contComandos, actualizarComandosAltura = crearCarpeta("Comandos", juegosPopulares.Size.Y.Offset + 10)
folders["Comandos"] = {frame = comandos, content = contComandos, actualizar = actualizarComandosAltura}

-- Agregar scripts a Comandos
local comandosScripts = {
	{nombre = "Fly V3", url = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{nombre = "Touch Fling", url = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{nombre = "ESP Player", url = "https://pastebin.com/raw/GsSG9AEX"}, -- si tienes link o puedes hacer el script directo
	{nombre = "Infinity Yield", url = "https://raw.githubusercontent.com/EdgeIY/infinityyield/master/source"},
	-- Agrega 5 más si quieres
}

for i, scriptData in ipairs(comandosScripts) do
	local btn = Instance.new("TextButton", contComandos)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, (i-1)*40)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Text = scriptData.nombre
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.AutoButtonColor = true
	btn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptData.url))()
	end)
end
actualizarComandosAltura()

-- Botón regresar en carpeta comandos
local regresarBtn = Instance.new("TextButton", contComandos)
regresarBtn.Size = UDim2.new(1, -20, 0, 40)
regresarBtn.Position = UDim2.new(0, 10, 0, #comandosScripts*40 + 10)
regresarBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
regresarBtn.TextColor3 = Color3.new(1,1,1)
regresarBtn.Text = "← Regresar"
regresarBtn.Font = Enum.Font.GothamBold
regresarBtn.TextScaled = true
regresarBtn.AutoButtonColor = true
regresarBtn.MouseButton1Click:Connect(function()
	contComandos.Visible = false
	contJuegos.Visible = true
end)
actualizarComandosAltura()

-- Inicialmente mostrar solo Juegos Populares (content)
contComandos.Visible = false
contJuegos.Visible = true

-- Función para manejar búsqueda simple
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local texto = searchBox.Text:lower()
	
	for _, folder in pairs(folders) do
		for _, btn in pairs(folder.content:GetChildren()) do
			if btn:IsA("TextButton") then
				btn.Visible = btn.Text:lower():find(texto) ~= nil
			end
		end
	end
end)

-- Acción del botón C para mostrar/ocultar panel
toggleBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Rainbow dinámico para borde y textos
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	stroke.Color = color
	title.TextColor3 = color
	toggleBtn.TextColor3 = color
	info.TextColor3 = color
	searchBox.TextColor3 = color
	for _, folder in pairs(folders) do
		folder.frame.BackgroundColor3 = Color3.fromHSV(0,0,0) -- o puedes mantener oscuro
		for _, btn in pairs(folder.content:GetChildren()) do
			if btn:IsA("TextButton") then
				btn.TextColor3 = color
			end
		end
	end
end)
