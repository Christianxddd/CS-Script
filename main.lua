local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasUI"
gui.ResetOnSpawn = false

-- BOTÓN FLOTANTE CON "C"
local cBtn = Instance.new("TextButton")
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.BorderSizePixel = 0
cBtn.Text = "C"
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.TextScaled = true
cBtn.Font = Enum.Font.GothamBold
cBtn.Draggable = true
cBtn.Parent = gui

-- MENÚ
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 320, 0, 370)
menu.Position = UDim2.new(0.5, -160, 0.5, -185)
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
local velocidad = 16
local salto = 50
local velON = false
local saltoON = false

local function actualizarVelocidad()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = velON and velocidad or 16
    end
    velValor.Text = tostring(velocidad)
end

local function actualizarSalto()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then
        hum.JumpPower = saltoON and salto or 50
    end
    saltoValor.Text = tostring(salto)
end

-- SECCIÓN: VELOCIDAD
local velLabel = Instance.new("TextLabel", menu)
velLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
velLabel.Size = UDim2.new(0.4, 0, 0, 30)
velLabel.Text = "Velocidad:"
velLabel.TextScaled = true
velLabel.Font = Enum.Font.GothamBold
velLabel.TextColor3 = Color3.new(1,1,1)
velLabel.BackgroundTransparency = 1

local velToggle = Instance.new("TextButton", menu)
velToggle.Position = UDim2.new(0.47, 0, 0.15, 0)
velToggle.Size = UDim2.new(0.13, 0, 0, 30)
velToggle.Text = "OFF"
velToggle.TextScaled = true
velToggle.Font = Enum.Font.GothamBold
velToggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
velToggle.TextColor3 = Color3.fromRGB(255, 50, 50)

velToggle.MouseButton1Click:Connect(function()
    velON = not velON
    velToggle.Text = velON and "ON" or "OFF"
    velToggle.TextColor3 = velON and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 50, 50)
    actualizarVelocidad()
end)

velValor = Instance.new("TextLabel", menu)
velValor.Position = UDim2.new(0.61, 0, 0.15, 0)
velValor.Size = UDim2.new(0.1, 0, 0, 30)
velValor.Text = tostring(velocidad)
velValor.TextScaled = true
velValor.Font = Enum.Font.GothamBold
velValor.TextColor3 = Color3.new(1,1,1)
velValor.BackgroundTransparency = 1

local velMas = Instance.new("TextButton", menu)
velMas.Position = UDim2.new(0.72, 0, 0.15, 0)
velMas.Size = UDim2.new(0.13, 0, 0, 30)
velMas.Text = "+"
velMas.TextScaled = true
velMas.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
velMas.TextColor3 = Color3.new(1,1,1)
velMas.MouseButton1Click:Connect(function()
    velocidad += 1
    actualizarVelocidad()
end)

local velMenos = Instance.new("TextButton", menu)
velMenos.Position = UDim2.new(0.86, 0, 0.15, 0)
velMenos.Size = UDim2.new(0.13, 0, 0, 30)
velMenos.Text = "-"
velMenos.TextScaled = true
velMenos.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
velMenos.TextColor3 = Color3.new(1,1,1)
velMenos.MouseButton1Click:Connect(function()
    velocidad = math.max(0, velocidad - 1)
    actualizarVelocidad()
end)

-- SECCIÓN: SALTO
local saltoLabel = Instance.new("TextLabel", menu)
saltoLabel.Position = UDim2.new(0.05, 0, 0.28, 0)
saltoLabel.Size = UDim2.new(0.4, 0, 0, 30)
saltoLabel.Text = "Salto:"
saltoLabel.TextScaled = true
saltoLabel.Font = Enum.Font.GothamBold
saltoLabel.TextColor3 = Color3.new(1,1,1)
saltoLabel.BackgroundTransparency = 1

local saltoToggle = Instance.new("TextButton", menu)
saltoToggle.Position = UDim2.new(0.47, 0, 0.28, 0)
saltoToggle.Size = UDim2.new(0.13, 0, 0, 30)
saltoToggle.Text = "OFF"
saltoToggle.TextScaled = true
saltoToggle.Font = Enum.Font.GothamBold
saltoToggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
saltoToggle.TextColor3 = Color3.fromRGB(255, 50, 50)

saltoToggle.MouseButton1Click:Connect(function()
    saltoON = not saltoON
    saltoToggle.Text = saltoON and "ON" or "OFF"
    saltoToggle.TextColor3 = saltoON and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 50, 50)
    actualizarSalto()
end)

saltoValor = Instance.new("TextLabel", menu)
saltoValor.Position = UDim2.new(0.61, 0, 0.28, 0)
saltoValor.Size = UDim2.new(0.1, 0, 0, 30)
saltoValor.Text = tostring(salto)
saltoValor.TextScaled = true
saltoValor.Font = Enum.Font.GothamBold
saltoValor.TextColor3 = Color3.new(1,1,1)
saltoValor.BackgroundTransparency = 1

local saltoMas = Instance.new("TextButton", menu)
saltoMas.Position = UDim2.new(0.72, 0, 0.28, 0)
saltoMas.Size = UDim2.new(0.13, 0, 0, 30)
saltoMas.Text = "+"
saltoMas.TextScaled = true
saltoMas.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
saltoMas.TextColor3 = Color3.new(1,1,1)
saltoMas.MouseButton1Click:Connect(function()
    salto += 1
    actualizarSalto()
end)

local saltoMenos = Instance.new("TextButton", menu)
saltoMenos.Position = UDim2.new(0.86, 0, 0.28, 0)
saltoMenos.Size = UDim2.new(0.13, 0, 0, 30)
saltoMenos.Text = "-"
saltoMenos.TextScaled = true
saltoMenos.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
saltoMenos.TextColor3 = Color3.new(1,1,1)
saltoMenos.MouseButton1Click:Connect(function()
    salto = math.max(0, salto - 1)
    actualizarSalto()
end)

-- FLY V3
local flyBtn = Instance.new("TextButton", menu)
flyBtn.Position = UDim2.new(0.05, 0, 0.42, 0)
flyBtn.Size = UDim2.new(0.9, 0, 0, 35)
flyBtn.Text = "Fly V3"
flyBtn.TextScaled = true
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextColor3 = Color3.new(1, 1, 1)
flyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
flyBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

-- ESP PLAYER
local espBtn = Instance.new("TextButton", menu)
espBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
espBtn.Size = UDim2.new(0.9, 0, 0, 35)
espBtn.Text = "ESP Player"
espBtn.TextScaled = true
espBtn.Font = Enum.Font.GothamBold
espBtn.TextColor3 = Color3.new(1, 1, 1)
espBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
espBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") and not v.Character.Head:FindFirstChild("NameTag") then
            local esp = Instance.new("BillboardGui", v.Character.Head)
            esp.Name = "NameTag"
            esp.Size = UDim2.new(0, 200, 0, 50)
            esp.Adornee = v.Character.Head
            esp.AlwaysOnTop = true
            local text = Instance.new("TextLabel", esp)
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = v.Name
            text.TextColor3 = Color3.new(1, 1, 1)
            text.TextScaled = true
        end
    end
end)

-- CERRAR MENÚ
local cerrarBtn = Instance.new("TextButton", menu)
cerrarBtn.Position = UDim2.new(0.05, 0, 0.7, 0)
cerrarBtn.Size = UDim2.new(0.9, 0, 0, 35)
cerrarBtn.Text = "Cerrar"
cerrarBtn.TextScaled = true
cerrarBtn.Font = Enum.Font.GothamBold
cerrarBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
cerrarBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
cerrarBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- RESTAURAR VALORES AL MORIR
player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = velON and velocidad or 16
    hum.JumpPower = saltoON and salto or 50
end)
