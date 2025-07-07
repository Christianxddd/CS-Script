-- 🔒 PANEL PROFESIONAL CON PROTECCIÓN DE CONTRASEÑA

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebas_UI"
gui.ResetOnSpawn = false

-- 🌈 Efecto Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.floor(math.sin(t) * 127 + 128),
		math.floor(math.sin(t + 2) * 127 + 128),
		math.floor(math.sin(t + 4) * 127 + 128)
	)
end

-- 🔘 Botón flotante con "C"
local iconBtn = Instance.new("TextButton", gui)
iconBtn.Name = "OpenButton"
iconBtn.Size = UDim2.new(0, 50, 0, 50)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconBtn.Text = "C"
iconBtn.Font = Enum.Font.Arcade
iconBtn.TextColor3 = Color3.new(1, 1, 1)
iconBtn.TextScaled = true
iconBtn.Active = true
iconBtn.Draggable = true
Instance.new("UICorner", iconBtn)

-- 🪟 Panel principal (oculto al inicio)
local panel = Instance.new("Frame", gui)
panel.Name = "MainPanel"
panel.Size = UDim2.new(0, 540, 0, 400)
panel.Position = UDim2.new(0.5, -270, 0.5, -200)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0.3
panel.Visible = false
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)

-- ✏️ Título
local titulo = Instance.new("TextLabel", panel)
titulo.Size = UDim2.new(1, 0, 0.1, 0)
titulo.Position = UDim2.new(0, 0, 0, 0)
titulo.Text = "By Christian"
titulo.Font = Enum.Font.Arcade
titulo.TextScaled = true
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.BackgroundTransparency = 1

-- 🧑 Datos del creador
local info = Instance.new("TextLabel", panel)
info.Size = UDim2.new(1, 0, 0.08, 0)
info.Position = UDim2.new(0, 0, 0.1, 0)
info.Text = "Usuario Roblox: Christian_xyx | TikTok: @christ_sebast_7d"
info.Font = Enum.Font.Arcade
info.TextScaled = true
info.TextColor3 = Color3.new(1, 1, 1)
info.BackgroundTransparency = 1

-- 📁 Carpeta de Scripts
local carpetaBtn = Instance.new("TextButton", panel)
carpetaBtn.Size = UDim2.new(0.4, 0, 0.1, 0)
carpetaBtn.Position = UDim2.new(0.05, 0, 0.25, 0)
carpetaBtn.Text = "📂 Scripts"
carpetaBtn.Font = Enum.Font.Arcade
carpetaBtn.TextScaled = true
carpetaBtn.TextColor3 = Color3.new(1, 1, 1)
carpetaBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", carpetaBtn)

-- 🔁 Botón de regresar (se muestra dentro de otras secciones)
local function crearBotonRegresar(parent)
	local regresar = Instance.new("TextButton", parent)
	regresar.Size = UDim2.new(0.2, 0, 0.08, 0)
	regresar.Position = UDim2.new(0.75, 0, 0.9, 0)
	regresar.Text = "🔙 Regresar"
	regresar.Font = Enum.Font.Arcade
	regresar.TextScaled = true
	regresar.TextColor3 = Color3.new(1, 1, 1)
	regresar.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
	Instance.new("UICorner", regresar)
	return regresar
end

-- 🪪 PANTALLA DE CONTRASEÑA
local function mostrarLogin()
	local loginFrame = Instance.new("Frame", gui)
	loginFrame.Size = UDim2.new(0, 360, 0, 180)
	loginFrame.Position = UDim2.new(0.5, -180, 0.5, -90)
	loginFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	loginFrame.ZIndex = 10
	Instance.new("UICorner", loginFrame)

	local label = Instance.new("TextLabel", loginFrame)
	label.Size = UDim2.new(1, 0, 0.25, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Text = "🔐 Ingresa el código para abrir el panel:"
	label.Font = Enum.Font.Arcade
	label.TextScaled = true
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1

	local linkBtn = Instance.new("TextButton", loginFrame)
	linkBtn.Size = UDim2.new(0.8, 0, 0.2, 0)
	linkBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
	linkBtn.Text = "Obtener código aquí 🔑"
	linkBtn.Font = Enum.Font.Arcade
	linkBtn.TextScaled = true
	linkBtn.TextColor3 = Color3.new(1, 1, 1)
	linkBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
	Instance.new("UICorner", linkBtn)

	linkBtn.MouseButton1Click:Connect(function()
		setclipboard("https://direct-link.net/1368874/wNwAURpoRoSy")
		linkBtn.Text = "🔗 Link copiado al portapapeles"
	end)

	local textbox = Instance.new("TextBox", loginFrame)
	textbox.Size = UDim2.new(0.8, 0, 0.2, 0)
	textbox.Position = UDim2.new(0.1, 0, 0.55, 0)
	textbox.Font = Enum.Font.Arcade
	textbox.TextScaled = true
	textbox.PlaceholderText = "Escribe el código aquí..."
	textbox.Text = ""
	textbox.TextColor3 = Color3.new(1, 1, 1)
	textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Instance.new("UICorner", textbox)

	local okBtn = Instance.new("TextButton", loginFrame)
	okBtn.Size = UDim2.new(0.5, 0, 0.2, 0)
	okBtn.Position = UDim2.new(0.25, 0, 0.8, 0)
	okBtn.Text = "Aceptar"
	okBtn.Font = Enum.Font.Arcade
	okBtn.TextScaled = true
	okBtn.TextColor3 = Color3.new(1, 1, 1)
	okBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	Instance.new("UICorner", okBtn)

	okBtn.MouseButton1Click:Connect(function()
		if textbox.Text == "AYAM" then
			panel.Visible = true
			loginFrame:Destroy()
		else
			textbox.Text = ""
			textbox.PlaceholderText = "❌ Código incorrecto"
			textbox.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
		end
	end)
end

-- 🌈 Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	iconBtn.TextColor3 = color
	titulo.TextColor3 = color
	info.TextColor3 = color
	carpetaBtn.TextColor3 = color
end)

-- ⏯️ Al presionar la "C"
iconBtn.MouseButton1Click:Connect(function()
	if not panel.Visible then
		mostrarLogin()
	end
end)
