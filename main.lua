local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasGamerUI"
gui.ResetOnSpawn = false

-- Rainbow efecto
local function rainbow()
    local t = tick()
    return Color3.fromRGB(
        math.sin(t) * 127 + 128,
        math.sin(t + 2 * math.pi / 3) * 127 + 128,
        math.sin(t + 4 * math.pi / 3) * 127 + 128
    )
end

-- Botón flotante "C"
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.BorderSizePixel = 0
cBtn.Text = "C"
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.TextScaled = true
cBtn.Font = Enum.Font.Arcade
cBtn.Draggable = true

-- Panel horizontal gamer
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 900, 0, 150)
menu.Position = UDim2.new(0.5, -450, 0.5, -75)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menu.BackgroundTransparency = 0.4
menu.Visible = false
menu.Active = true
menu.Draggable = true
Instance.new("UICorner", menu)
local stroke = Instance.new("UIStroke", menu)
stroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(0.15, 0, 1, 0)
title.Text = "🎮 ChristianSebas Menu"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

cBtn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

local velocidad = 16
local salto = 50
local velON = false
local saltoON = false

local function actualizarHumanoid()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = velON and velocidad or 16
        hum.JumpPower = saltoON and salto or 50
    end
end

local function crearSeccionHorizontal(texto, posX, aumentar, disminuir, toggleVar, valor)
    local label = Instance.new("TextLabel", menu)
    label.Position = UDim2.new(posX, 0, 0.1, 0)
    label.Size = UDim2.new(0.1, 0, 0.3, 0)
    label.Text = texto
    label.TextScaled = true
    label.Font = Enum.Font.Arcade
    label.TextColor3 = Color3.new(1,1,1)
    label.BackgroundTransparency = 1

    local toggle = Instance.new("TextButton", menu)
    toggle.Position = UDim2.new(posX + 0.11, 0, 0.1, 0)
    toggle.Size = UDim2.new(0.06, 0, 0.3, 0)
    toggle.Text = "OFF"
    toggle.TextScaled = true
    toggle.Font = Enum.Font.Arcade
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggle.TextColor3 = Color3.fromRGB(255, 0, 0)

    local valLabel = Instance.new("TextLabel", menu)
    valLabel.Position = UDim2.new(posX + 0.18, 0, 0.1, 0)
    valLabel.Size = UDim2.new(0.05, 0, 0.3, 0)
    valLabel.Text = tostring(valor)
    valLabel.TextScaled = true
    valLabel.Font = Enum.Font.Arcade
    valLabel.TextColor3 = Color3.new(1,1,1)
    valLabel.BackgroundTransparency = 1

    local plus = Instance.new("TextButton", menu)
    plus.Position = UDim2.new(posX + 0.24, 0, 0.1, 0)
    plus.Size = UDim2.new(0.05, 0, 0.3, 0)
    plus.Text = "+"
    plus.TextScaled = true
    plus.Font = Enum.Font.Arcade
    plus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    plus.TextColor3 = Color3.new(1,1,1)

    local minus = Instance.new("TextButton", menu)
    minus.Position = UDim2.new(posX + 0.3, 0, 0.1, 0)
    minus.Size = UDim2.new(0.05, 0, 0.3, 0)
    minus.Text = "-"
    minus.TextScaled = true
    minus.Font = Enum.Font.Arcade
    minus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    minus.TextColor3 = Color3.new(1,1,1)

    plus.MouseButton1Click:Connect(function()
        aumentar()
        valLabel.Text = tostring(valor)
        actualizarHumanoid()
    end)

    minus.MouseButton1Click:Connect(function()
        disminuir()
        valLabel.Text = tostring(valor)
        actualizarHumanoid()
    end)

    toggle.MouseButton1Click:Connect(function()
        _G[toggleVar] = not _G[toggleVar]
        toggle.Text = _G[toggleVar] and "ON" or "OFF"
        toggle.TextColor3 = _G[toggleVar] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
        actualizarHumanoid()
    end)
end

crearSeccionHorizontal("Velocidad", 0.16,
    function() velocidad += 1 end,
    function() velocidad = math.max(1, velocidad - 1) end,
    "velON", velocidad
)

crearSeccionHorizontal("Salto", 0.36,
    function() salto += 1 end,
    function() salto = math.max(1, salto - 1) end,
    "saltoON", salto
)

local function crearBoton(texto, posX)
    local btn = Instance.new("TextButton", menu)
    btn.Size = UDim2.new(0.12, 0, 0.5, 0)
    btn.Position = UDim2.new(posX, 0, 0.45, 0)
    btn.Text = texto
    btn.TextScaled = true
    btn.Font = Enum.Font.Arcade
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    return btn
end

-- Botones y funciones
local fly = crearBoton("🚀 Fly V3", 0.56)
local esp = crearBoton("👁 ESP (OFF)", 0.69)
local fling = crearBoton("🌀 Touch Fling", 0.82)
local brain = crearBoton("🧠 Brainlot", 0.10)
local jail = crearBoton("🚓 Jailbreak", 0.23)
local dead = crearBoton("🚂 Dead Rails", 0.36)
local blox = crearBoton("🍉 Blox Fruits", 0.49)

fly.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

local espOn = false
esp.MouseButton1Click:Connect(function()
    espOn = not espOn
    esp.Text = espOn and "👁 ESP (ON)" or "👁 ESP (OFF)"
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
            if espOn then
                local guiTag = Instance.new("BillboardGui", v.Character.Head)
                guiTag.Name = "NameTag"
                guiTag.Size = UDim2.new(0,200,0,50)
                guiTag.AlwaysOnTop = true
                local txt = Instance.new("TextLabel", guiTag)
                txt.Size = UDim2.new(1,0,1,0)
                txt.BackgroundTransparency = 1
                txt.Text = v.Name
                txt.TextScaled = true
                txt.TextColor3 = Color3.new(1,1,1)
            else
                local tag = v.Character.Head:FindFirstChild("NameTag")
                if tag then tag:Destroy() end
            end
        end
    end
end)

local flingUsed = false
fling.MouseButton1Click:Connect(function()
    if not flingUsed then
        flingUsed = true
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))()
    end
end)

brain.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
end)

jail.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
end)

dead.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
end)

blox.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end)

local cerrar = crearBoton("❌ Close", 0.92)
cerrar.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- Rainbow loop
game:GetService("RunService").RenderStepped:Connect(function()
    local color = rainbow()
    stroke.Color = color
    for _, b in pairs(menu:GetChildren()) do
        if b:IsA("TextButton") or b:IsA("TextLabel") then
            b.TextColor3 = color
        end
    end
end)

player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid").WalkSpeed = velON and velocidad or 16
    char:WaitForChild("Humanoid").JumpPower = saltoON and salto or 50
end)
