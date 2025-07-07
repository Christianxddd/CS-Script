-- GUI By ChristianSebas con controles + y - al lado derecho
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasUI"
gui.ResetOnSpawn = false

-- BOTÓN flotante (logo de la C)
local cBtn = Instance.new("ImageButton")
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.BorderSizePixel = 0
cBtn.Image = "rbxassetid://94777373855263" -- ← LOGO C
cBtn.Draggable = true
cBtn.Parent = gui

-- MENÚ
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 260, 0, 320)
menu.Position = UDim2.new(0.5, -130, 0.5, -160)
menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
menu.Visible = false

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "By ChristianSebas"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

cBtn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- VARIABLES
local velocidadActual = 0
local saltoActual = 0

-- FUNCIONES
local function actualizarVelocidad()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = velocidadActual end
    velValor.Text = tostring(velocidadActual)
end

local function actualizarSalto()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then hum.JumpPower = saltoActual end
    saltoValor.Text = tostring(saltoActual)
end

-- SECCIÓN VELOCIDAD
local velLabel = Instance.new("TextLabel", menu)
velLabel.Position = UDim2.new(0.05, 0, 0.2, 0)
velLabel.Size = UDim2.new(0.5, 0, 0, 30)
velLabel.Text = "Velocidad:"
velLabel.TextScaled = true
velLabel.Font = Enum.Font.GothamBold
velLabel.TextColor3 = Color3.new(1,1,1)
velLabel.BackgroundTransparency = 1

local velValor = Instance.new("TextLabel", menu)
velValor.Position = UDim2.new(0.55, 0, 0.2, 0)
velValor.Size = UDim2.new(0.15, 0, 0, 30)
velValor.Text = tostring(velocidadActual)
velValor.TextScaled = true
velValor.Font = Enum.Font.GothamBold
velValor.TextColor3 = Color3.new(1,1,1)
velValor.BackgroundTransparency = 1

local velMas = Instance.new("TextButton", menu)
velMas.Position = UDim2.new(0.72, 0, 0.2, 0)
velMas.Size = UDim2.new(0.1, 0, 0, 30)
velMas.Text = "+"
velMas.TextScaled = true
velMas.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
velMas.TextColor3 = Color3.new(1,1,1)

local velMenos = Instance.new("TextButton", menu)
velMenos.Position = UDim2.new(0.84, 0, 0.2, 0)
velMenos.Size = UDim2.new(0.1, 0, 0, 30)
velMenos.Text = "-"
velMenos.TextScaled = true
velMenos.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
velMenos.TextColor3 = Color3.new(1,1,1)

velMas.MouseButton1Click:Connect(function()
    velocidadActual = math.min(500, velocidadActual + 5)
    actualizarVelocidad()
end)

velMenos.MouseButton1Click:Connect(function()
    velocidadActual = math.max(0, velocidadActual - 5)
    actualizarVelocidad()
end)

-- SECCIÓN SALTO
local saltoLabel = Instance.new("TextLabel", menu)
saltoLabel.Position = UDim2.new(0.05, 0, 0.32, 0)
saltoLabel.Size = UDim2.new(0.5, 0, 0, 30)
saltoLabel.Text = "Salto:"
saltoLabel.TextScaled = true
saltoLabel.Font = Enum.Font.GothamBold
saltoLabel.TextColor3 = Color3.new(1,1,1)
saltoLabel.BackgroundTransparency = 1

local saltoValor = Instance.new("TextLabel", menu)
saltoValor.Position = UDim2.new(0.55, 0, 0.32, 0)
saltoValor.Size = UDim2.new(0.15, 0, 0, 30)
saltoValor.Text = tostring(saltoActual)
saltoValor.TextScaled = true
saltoValor.Font = Enum.Font.GothamBold
saltoValor.TextColor3 = Color3.new(1,1,1)
saltoValor.BackgroundTransparency = 1

local saltoMas = Instance.new("TextButton", menu)
saltoMas.Position = UDim2.new(0.72, 0, 0.32, 0)
saltoMas.Size = UDim2.new(0.1, 0, 0, 30)
saltoMas.Text = "+"
saltoMas.TextScaled = true
saltoMas.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
saltoMas.TextColor3 = Color3.new(1,1,1)

local saltoMenos = Instance.new("TextButton", menu)
saltoMenos.Position = UDim2.new(0.84, 0, 0.32, 0)
saltoMenos.Size = UDim2.new(0.1, 0, 0, 30)
saltoMenos.Text = "-"
saltoMenos.TextScaled = true
saltoMenos.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
saltoMenos.TextColor3 = Color3.new(1,1,1)

saltoMas.MouseButton1Click:Connect(function()
    saltoActual = math.min(500, saltoActual + 10)
    actualizarSalto()
end)

saltoMenos.MouseButton1Click:Connect(function()
    saltoActual = math.max(0, saltoActual - 10)
    actualizarSalto()
end)

-- FLY V3
local flyBtn = Instance.new("TextButton", menu)
flyBtn.Position = UDim2.new(0.05, 0, 0.48, 0)
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
xrayBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
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
cerrarBtn.Position = UDim2.new(0.05, 0, 0.75, 0)
cerrarBtn.Size = UDim2.new(0.9, 0, 0, 35)
cerrarBtn.Text = "Cerrar"
cerrarBtn.TextScaled = true
cerrarBtn.Font = Enum.Font.GothamBold
cerrarBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
cerrarBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
cerrarBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- APLICAR CAMBIOS EN REAPARECER
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid").WalkSpeed = velocidadActual
    char:WaitForChild("Humanoid").JumpPower = saltoActual
end)
