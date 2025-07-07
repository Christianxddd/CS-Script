local player = game.Players.LocalPlayer

-- GUI principal
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CS_UI"
gui.ResetOnSpawn = false

-- Botón "C" para abrir el panel
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 60, 0, 60)
openBtn.Position = UDim2.new(0, 20, 0.5, -30)
openBtn.Text = "C"
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBlack
openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Draggable = true
openBtn.Active = true
Instance.new("UICorner", openBtn)

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 420, 0, 540)
panel.Position = UDim2.new(0.5, -210, 0.5, -270)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.Visible = false
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Im Christian Sebast"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Datos
local user = Instance.new("TextLabel", panel)
user.Size = UDim2.new(1, -20, 0, 30)
user.Position = UDim2.new(0, 10, 0, 50)
user.Text = "Usuario Roblox: Christian_xyx"
user.TextScaled = true
user.Font = Enum.Font.Gotham
user.TextColor3 = Color3.new(1, 1, 1)
user.BackgroundTransparency = 1

local tiktok = Instance.new("TextLabel", panel)
tiktok.Size = UDim2.new(1, -20, 0, 30)
tiktok.Position = UDim2.new(0, 10, 0, 85)
tiktok.Text = "TikTok: @christ_sebast_7d"
tiktok.TextScaled = true
tiktok.Font = Enum.Font.Gotham
tiktok.TextColor3 = Color3.fromRGB(255, 0, 255)
tiktok.BackgroundTransparency = 1

-- Botón "Scripts"
local scriptsBtn = Instance.new("TextButton", panel)
scriptsBtn.Size = UDim2.new(0.9, 0, 0, 40)
scriptsBtn.Position = UDim2.new(0.05, 0, 0, 130)
scriptsBtn.Text = "📂 Scripts"
scriptsBtn.TextScaled = true
scriptsBtn.Font = Enum.Font.GothamBold
scriptsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scriptsBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", scriptsBtn)

-- Sub-pestaña de Scripts
local scriptsPage = Instance.new("Frame", gui)
scriptsPage.Size = UDim2.new(0, 420, 0, 540)
scriptsPage.Position = panel.Position
scriptsPage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scriptsPage.Visible = false
Instance.new("UICorner", scriptsPage)

-- Título scripts
local sTitle = Instance.new("TextLabel", scriptsPage)
sTitle.Size = UDim2.new(1, 0, 0, 40)
sTitle.Text = "📜 Scripts Disponibles"
sTitle.TextScaled = true
sTitle.Font = Enum.Font.GothamBold
sTitle.TextColor3 = Color3.new(1, 1, 1)
sTitle.BackgroundTransparency = 1

-- Botón volver
local volver = Instance.new("TextButton", scriptsPage)
volver.Size = UDim2.new(0.9, 0, 0, 40)
volver.Position = UDim2.new(0.05, 0, 1, -50)
volver.Text = "🔙 Regresar"
volver.TextScaled = true
volver.Font = Enum.Font.Gotham
volver.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
volver.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", volver)

-- Abrir scripts
scriptsBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
	scriptsPage.Visible = true
end)

-- Regresar al panel principal
volver.MouseButton1Click:Connect(function()
	scriptsPage.Visible = false
	panel.Visible = true
end)

-- Mostrar/Ocultar panel
openBtn.MouseButton1Click:Connect(function()
	local anyVisible = panel.Visible or scriptsPage.Visible
	panel.Visible = not anyVisible
	scriptsPage.Visible = false
end)
