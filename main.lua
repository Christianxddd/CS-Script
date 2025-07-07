-- GUI By ChristianSebas con logo personalizado y funciones extra
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasUI"
gui.ResetOnSpawn = false

-- Botón flotante con tu imagen (cuadrado, sin bordes redondeados)
local cBtn = Instance.new("ImageButton")
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0.5, -30, 0.5, -30)
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.BorderSizePixel = 0
cBtn.Image = "rbxassetid://105836169250279" -- ← Tu logo "Gatoppppp"
cBtn.Active = true
cBtn.Draggable = true
cBtn.AutoButtonColor = true
cBtn.Parent = gui
cBtn.ClipsDescendants = false
cBtn.ImageColor3 = Color3.new(1, 1, 1)
cBtn.ImageTransparency = 0

-- Menú principal
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 200, 0, 260)
menu.Position = UDim2.new(0.5, -100, 0.5, -130)
menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
menu.BorderSizePixel = 0
menu.Visible = false
menu.Parent = gui

local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "By ChristianSebas"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Función para crear botones del menú (cuadrados)
local function crearBoton(nombre, y)
    local btn = Instance.new("TextButton", menu)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, y, 0)
    btn.Text = nombre
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.BorderSizePixel = 0
    return btn
end

-- Botones
local speedBtn = crearBoton("Correr Rápido (100)", 0.2)
lo
