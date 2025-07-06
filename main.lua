-- GUI By ChristianSebas con Fly V3, X-Ray, salto y velocidad
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasUI"
gui.ResetOnSpawn = false

-- Botón flotante con imagen personalizada (ID correcto)
local cBtn = Instance.new("ImageButton")
cBtn.Size = UDim2.new(0, 50, 0, 50)
cBtn.Position = UDim2.new(0.5, -25, 0.5, -25)
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.BorderSizePixel = 0
cBtn.Image = "rbxassetid://94777373855263" -- Tu imagen subida
cBtn.Active = true
cBtn.Draggable = true
cBtn.Parent = gui

-- Menú principal oculto al inicio
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 200, 0, 260)
menu.Position = UDim2.new(0.5, -100, 0.5, -130)
menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
menu.Visible = false
menu.Parent = gui

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "By ChristianSebas"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Crear botones del menú
local function crearBoton(nombre, y)
    local btn = Instance.new("TextButton", menu)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, y, 0)
    btn.Text = nombre
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    return btn
end

local speedBtn = crearBoton("Correr Rápido (100)", 0.2)
local jumpBtn = crearBoton("Saltar Alto (150)", 0.35)
local flyBtn = crearBoton("Fly V3", 0.5)
local xrayBtn = crearBoton("X-Ray (Nombres)", 0.65)
local cerrarBtn = crearBoton("Cerrar", 0.8)
cerrarBtn.TextColor3 = Color3.fromRGB(255, 50, 50)

-- Mostrar / ocultar menú al tocar el icono
cBtn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- Cerrar menú desde botón interno
cerrarBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- Funciones
local function setSpeed(val)
    local hum = player.Character and player.Character:FindFirstChild("Humanoid") or player.CharacterAdded:Wait():WaitForChild("Humanoid")
    hum.WalkSpeed = val
end

local function setJump(val)
    local hum = player.Character and player.Character:FindFirstChild("Humanoid") or player.CharacterAdded:Wait():WaitForChild("Humanoid")
    hum.JumpPower = val
end

-- Botón de velocidad
speedBtn.MouseButton1Click:Connect(function()
    setSpeed(100)
end)

-- Botón de salto
jumpBtn.MouseButton1Click:Connect(function()
    setJump(150)
end)

-- Botón de Fly V3 (original)
flyBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

-- Botón X-Ray (nombres)
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
