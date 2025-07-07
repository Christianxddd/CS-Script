-- GUI By ChristianSebas con controles + y - en correr y salto
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasUI"
gui.ResetOnSpawn = false

-- BOTÓN FLOTANTE
local cBtn = Instance.new("ImageButton")
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.BorderSizePixel = 0
cBtn.Image = "rbxassetid://94777373855263" -- Tu logo "C"
cBtn.Draggable = true
cBtn.Parent = gui

-- MENÚ
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 250, 0, 320)
menu.Position = UDim2.new(0.5, -125, 0.5, -160)
menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
menu.Visible = false

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "By ChristianSebas"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Mostrar/ocultar menú
cBtn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- Variables iniciales
local velocidadActual = 16
local saltoActual = 50

-- Función para actualizar velocidad
local function actualizarVelocidad()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = velocidadActual end
    velTexto.Text = "Velocidad: " .. velocidadActual
end

-- Función para actualizar salto
local function actualizarSalto()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then hum.JumpPower = saltoActual end
    saltoTexto.Text = "Salto: " .. saltoActual
end

-- VELOCIDAD
local velTexto = Instance.new("TextLabel", menu)
velTexto.Position = UDim2.new(0.05, 0, 0.2, 0)
velTexto.Size = UDim2.new(0.9, 0, 0, 30)
velTexto.Text = "Velocidad: " .. velocidadActual
velTexto.TextScaled = true
velTexto.Font = Enum.Font.Gotham
velTexto.TextColor3 = Color3.new(1,1,1)
velTexto.BackgroundTransparency = 1

local velMenos = Instance.new("TextButton", menu)
velMenos.Position = UDim2.new(0.1, 0, 0.27, 0)
velMenos.Size = UDim2.new(0.35, 0, 0, 30)
velMenos.Text = "- Vel"
velMenos.TextScaled = true
velMenos.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
velMenos.TextColor3 = Color3.new(1,1,1)

local velMas = Instance.new("TextButton", menu)
velMas.Position = UDim2.new(0.55, 0, 0.27, 0)
velMas.Size = UDim2.new(0.35, 0, 0, 30)
velMas.Text = "+ Vel"
velMas.TextScaled = true
velMas.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
velMas.TextColor3 = Color3.new(1,1,1)

velMenos.MouseButton1Click:Connect(function()
    velocidadActual = math.max(1, velocidadActual - 5)
    actualizarVelocidad()
end)

velMas.MouseButton1Click:Connect(function()
    velocidadActual = math.min(500, velocidadActual + 5)
    actualizarVelocidad()
end)

-- SALTO
local saltoTexto = Instance.new("TextLabel", menu)
saltoTexto.Position = UDim2.new(0.05, 0, 0.4, 0)
saltoTexto.Size = UDim2.new(0.9, 0, 0, 30)
saltoTexto.Text = "Salto: " .. saltoActual
saltoTexto.TextScaled = true
saltoTexto.Font = Enum.Font.Gotham
saltoTexto.TextColor3 = Color3.new(1,1,1)
saltoTexto.BackgroundTransparency = 1

local saltoMenos = Instance.new("TextButton", menu)
saltoMenos.Position = UDim2.new(0.1, 0, 0.47, 0)
saltoMenos.Size = UDim2.new(0.35, 0, 0, 30)
saltoMenos.Text = "- Jump"
saltoMenos.TextScaled = true
saltoMenos.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
saltoMenos.TextColor3 = Color3.new(1,1,1)

local saltoMas = Instance.new("TextButton", menu)
saltoMas.Position = UDim2.new(0.55, 0, 0.47, 0)
saltoMas.Size = UDim2.new(0.35, 0, 0, 30)
saltoMas.Text = "+ Jump"
saltoMas.TextScaled = true
saltoMas.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
saltoMas.TextColor3 = Color3.new(1,1,1)

saltoMenos.MouseButton1Click:Connect(function()
    saltoActual = math.max(10, saltoActual - 10)
    actualizarSalto()
end)

saltoMas.MouseButton1Click:Connect(function()
    saltoActual = math.min(500, saltoActual + 10)
    actualizarSalto()
end)

-- FLY
local flyBtn = Instance.new("TextButton", menu)
flyBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
flyBtn.Size = UDim2.new(0.9, 0, 0, 35)
flyBtn.Text = "Fly V3"
flyBtn.TextScaled = true
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextColor3 = Color3.new(1, 1, 1)
flyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
flyBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

-- XRAY
local xrayBtn = Instance.new("TextButton", menu)
xrayBtn.Position = UDim2.new(0.05, 0, 0.7, 0)
xrayBtn.Size = UDim2.new(0.9, 0, 0, 35)
xrayBtn.Text = "X-Ray (Nombres)"
xrayBtn.TextScaled = true
xrayBtn.Font = Enum.Font.GothamBold
xrayBtn.TextColor3 = Color3.new(1, 1, 1)
xrayBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

xrayBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Head") and not v.Character.Head:FindFirstChild("NameTag") then
            local billboard = Instance.new("BillboardGui", v.Character.Head)
            billboard.Name = "NameTag"
            billboard.Size = UDim2.new(0,200,0,50)
            billboard.Adornee = v.Character.Head
            billboard.AlwaysOnTop = true
            local textLabel = Instance.new("TextLabel", billboard)
            textLabel.Size = UDim2.new(1,0,1,0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = v.Name
            textLabel.TextColor3 = Color3.new(1,1,1)
            textLabel.TextScaled = true
        end
    end
end)

-- CERRAR
local cerrarBtn = Instance.new("TextButton", menu)
cerrarBtn.Position = UDim2.new(0.05, 0, 0.82, 0)
cerrarBtn.Size = UDim2.new(0.9, 0, 0, 35)
cerrarBtn.Text = "Cerrar"
cerrarBtn.TextScaled = true
cerrarBtn.Font = Enum.Font.GothamBold
cerrarBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
cerrarBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
cerrarBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- Aplicar al cargar personaje
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid").WalkSpeed = velocidadActual
    char:WaitForChild("Humanoid").JumpPower = saltoActual
end)
