--[[
    Panel Gamer Profesional V2 by Christian
    Icono "C", panel vertical, efecto rainbow, carpetas organizadas
--]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianProPanel"
gui.ResetOnSpawn = false

-- Rainbow dinámico
local function rainbowColor()
    local t = tick()
    return Color3.fromRGB(
        math.sin(t) * 127 + 128,
        math.sin(t + 2) * 127 + 128,
        math.sin(t + 4) * 127 + 128
    )
end

-- Botón flotante "C"
local iconBtn = Instance.new("TextButton", gui)
iconBtn.Size = UDim2.new(0, 50, 0, 50)
iconBtn.Position = UDim2.new(0, 15, 0, 15)
iconBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconBtn.Text = "C"
iconBtn.TextScaled = true
iconBtn.Font = Enum.Font.Arcade
iconBtn.TextColor3 = Color3.new(1, 1, 1)
iconBtn.Draggable = true

-- Panel principal
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 300, 0, 400)
main.Position = UDim2.new(0.5, -150, 0.5, -200)
main.BackgroundTransparency = 0.4
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Visible = false
main.Active = true
main.Draggable = true

local uiCorner = Instance.new("UICorner", main)
local uiStroke = Instance.new("UIStroke", main)
uiStroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Im Christian Sebast"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Datos
local datos = Instance.new("TextLabel", main)
datos.Size = UDim2.new(1, 0, 0, 20)
datos.Position = UDim2.new(0, 0, 0, 40)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.Arcade
datos.TextColor3 = Color3.new(1, 1, 1)
datos.BackgroundTransparency = 1

-- Contenedor de botones
local btnFrame = Instance.new("Frame", main)
btnFrame.Size = UDim2.new(1, -20, 1, -80)
btnFrame.Position = UDim2.new(0, 10, 0, 70)
btnFrame.BackgroundTransparency = 1

local uiList = Instance.new("UIListLayout", btnFrame)
uiList.Padding = UDim.new(0, 10)
uiList.FillDirection = Enum.FillDirection.Vertical
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiList.SortOrder = Enum.SortOrder.LayoutOrder

-- Función para crear botones de carpetas
local function crearBoton(nombre, scripts)
    local btn = Instance.new("TextButton", btnFrame)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Text = nombre
    btn.TextScaled = true
    btn.Font = Enum.Font.Arcade
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.new(1, 1, 1)

    -- Subpestaña
    btn.MouseButton1Click:Connect(function()
        main.Visible = false
        local sub = Instance.new("Frame", gui)
        sub.Size = UDim2.new(0, 300, 0, 400)
        sub.Position = UDim2.new(0.5, -150, 0.5, -200)
        sub.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        sub.BackgroundTransparency = 0.4
        sub.Active = true
        sub.Draggable = true

        Instance.new("UICorner", sub)
        local scroll = Instance.new("ScrollingFrame", sub)
        scroll.Size = UDim2.new(1, -10, 1, -50)
        scroll.Position = UDim2.new(0, 5, 0, 5)
        scroll.CanvasSize = UDim2.new(0, 0, 0, #scripts * 50)
        scroll.ScrollBarThickness = 5
        scroll.BackgroundTransparency = 1

        local list = Instance.new("UIListLayout", scroll)
        list.SortOrder = Enum.SortOrder.LayoutOrder
        list.Padding = UDim.new(0, 5)

        for _, scriptData in ipairs(scripts) do
            local sBtn = Instance.new("TextButton", scroll)
            sBtn.Size = UDim2.new(1, 0, 0, 40)
            sBtn.Text = scriptData.name
            sBtn.TextScaled = true
            sBtn.Font = Enum.Font.Arcade
            sBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            sBtn.TextColor3 = Color3.new(1, 1, 1)
            sBtn.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet(scriptData.url))()
            end)
        end

        local back = Instance.new("TextButton", sub)
        back.Size = UDim2.new(1, 0, 0, 40)
        back.Position = UDim2.new(0, 0, 1, -40)
        back.Text = "← Regresar"
        back.TextScaled = true
        back.Font = Enum.Font.Arcade
        back.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
        back.TextColor3 = Color3.new(1, 1, 1)
        back.MouseButton1Click:Connect(function()
            sub:Destroy()
            main.Visible = true
        end)
    end)
end

-- Lista de scripts por carpetas
local scriptsData = {
    ["Juegos Populares"] = {
        {name = "Brainlot", url = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
        {name = "Jailbreak", url = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
        {name = "Dead Rails", url = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
        {name = "Blox Fruits", url = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
    },
    ["Comandos"] = {
        {name = "Fly V3", url = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
        {name = "Touch Fling", url = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
        {name = "ESP Player", url = "https://pastebin.com/raw/5z5b2vd2"},
        {name = "Infinity Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    },
    ["General"] = {
        {name = "Backdoor Finder", url = "https://raw.githubusercontent.com/iK4oS/backdoor.exe/main/source.lua"},
        {name = "Dark Dex", url = "https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"},
        {name = "Simple ESP", url = "https://pastebin.com/raw/BzZcMZzB"},
        {name = "Fe Hat Spin", url = "https://pastebin.com/raw/1hYkLqkQ"},
        -- puedes seguir añadiendo más hasta 40 aquí...
    },
    ["Exploits"] = {
        {name = "Remote Spy", url = "https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"},
        {name = "Server Crasher", url = "https://pastebin.com/raw/M4R2jDUq"},
    },
    ["Diversión"] = {
        {name = "Ragdoll Script", url = "https://pastebin.com/raw/BJYTWv3M"},
        {name = "Gravity Gun", url = "https://pastebin.com/raw/MuVwChm1"},
    }
}

-- Crear carpetas
for carpeta, lista in pairs(scriptsData) do
    crearBoton(carpeta, lista)
end

-- Mostrar panel al presionar la "C"
iconBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- Rainbow dinámico
game:GetService("RunService").RenderStepped:Connect(function()
    local color = rainbowColor()
    uiStroke.Color = color
    title.TextColor3 = color
    for _, b in pairs(btnFrame:GetChildren()) do
        if b:IsA("TextButton") then
            b.TextColor3 = color
        end
    end
end)
