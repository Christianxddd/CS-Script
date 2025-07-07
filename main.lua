local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PanelChristian"
gui.ResetOnSpawn = false

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
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0.35, 0, 0.7, 0)
mainFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.3
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true

local uiList = Instance.new("UIListLayout", mainFrame)
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 8)

-- Título
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.LayoutOrder = 1

-- Datos usuario y red social
local datos = Instance.new("TextLabel", mainFrame)
datos.Size = UDim2.new(1, 0, 0, 25)
datos.Text = "Usuario: Christian_xyx | TikTok: @christ_sebast_7d"
datos.TextScaled = true
datos.Font = Enum.Font.Arcade
datos.TextColor3 = Color3.new(1, 1, 1)
datos.BackgroundTransparency = 1
datos.LayoutOrder = 2

-- Barra de búsqueda
local searchBox = Instance.new("TextBox", mainFrame)
searchBox.Size = UDim2.new(1, -20, 0, 30)
searchBox.Position = UDim2.new(0, 10, 0, 65)
searchBox.PlaceholderText = "Buscar scripts..."
searchBox.TextScaled = true
searchBox.Font = Enum.Font.Arcade
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
searchBox.ClearTextOnFocus = false
searchBox.LayoutOrder = 3

-- Scrolling Frame para carpetas
local scrollFrame = Instance.new("ScrollingFrame", mainFrame)
scrollFrame.Size = UDim2.new(1, 0, 1, -100)
scrollFrame.Position = UDim2.new(0, 0, 0, 95)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollFrame.ScrollBarThickness = 8

local carpetaLayout = Instance.new("UIListLayout", scrollFrame)
carpetaLayout.SortOrder = Enum.SortOrder.LayoutOrder
carpetaLayout.Padding = UDim.new(0, 6)

-- Función para crear una carpeta expandible
local function crearCarpeta(nombre)
    local carpeta = Instance.new("Frame")
    carpeta.Size = UDim2.new(1, 0, 0, 35) -- tamaño inicial (solo título)
    carpeta.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    carpeta.LayoutOrder = 1
    carpeta.ClipsDescendants = true

    local titulo = Instance.new("TextButton", carpeta)
    titulo.Size = UDim2.new(1, 0, 0, 35)
    titulo.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    titulo.Text = "📁 "..nombre
    titulo.TextColor3 = Color3.new(1,1,1)
    titulo.Font = Enum.Font.Arcade
    titulo.TextScaled = true
    titulo.LayoutOrder = 1

    local contenido = Instance.new("Frame", carpeta)
    contenido.Name = "Contenido"
    contenido.Size = UDim2.new(1, 0, 0, 0) -- contenido oculto al inicio
    contenido.Position = UDim2.new(0, 0, 0, 35)
    contenido.BackgroundTransparency = 1
    contenido.LayoutOrder = 2

    local contenidoLayout = Instance.new("UIListLayout", contenido)
    contenidoLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contenidoLayout.Padding = UDim.new(0, 4)

    local abierto = false

    titulo.MouseButton1Click:Connect(function()
        abierto = not abierto
        if abierto then
            local btnCount = 0
            for _, child in pairs(contenido:GetChildren()) do
                if child:IsA("TextButton") then
                    btnCount += 1
                end
            end
            local altura = btnCount * 40
            contenido:TweenSize(UDim2.new(1,0,0,altura), "Out", "Quad", 0.3, true)
            carpeta:TweenSize(UDim2.new(1, 0, 0, 35 + altura), "Out", "Quad", 0.3, true)
        else
            contenido:TweenSize(UDim2.new(1,0,0,0), "Out", "Quad", 0.3, true)
            carpeta:TweenSize(UDim2.new(1, 0, 0, 35), "Out", "Quad", 0.3, true)
        end
        -- Ajustar CanvasSize para scroll
        wait(0.35)
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, carpetaLayout.AbsoluteContentSize.Y + 10)
    end)

    return carpeta, contenido
end

-- Función para crear botones de scripts
local function crearBotonScript(nombre, link)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Text = "▶️ "..nombre
    btn.Font = Enum.Font.Arcade
    btn.TextScaled = true
    btn.AutoButtonColor = true

    btn.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(link))()
        end)
        if not success then
            warn("Error cargando script: "..nombre.."\n"..tostring(err))
        end
    end)

    return btn
end

-- Crear carpetas principales
local carpetaJuegos, contenidoJuegos = crearCarpeta("Juegos Populares")
carpetaJuegos.Parent = scrollFrame
carpetaJuegos.LayoutOrder = 3

local carpetaComandos, contenidoComandos = crearCarpeta("Comandos")
carpetaComandos.Parent = scrollFrame
carpetaComandos.LayoutOrder = 4

-- Agregar scripts a "Juegos Populares"
local juegosScripts = {
    {nombre = "🧠 Brainlot", link = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
    {nombre = "🚓 Jailbreak", link = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
    {nombre = "🚂 Dead Rails", link = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
    {nombre = "🍉 Blox Fruits", link = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
}
for _, v in ipairs(juegosScripts) do
    local btn = crearBotonScript(v.nombre, v.link)
    btn.Parent = contenidoJuegos
end

-- Agregar scripts a "Comandos"
local comandosScripts = {
    {nombre = "🚀 Fly V3", link = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
    {nombre = "🌀 Touch Fling", link = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
    {nombre = "👁 ESP Player", link = "https://raw.githubusercontent.com/zekewaze/ESP-NameTags/main/main.lua"},
    {nombre = "📜 Infinity Yield", link = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}
for _, v in ipairs(comandosScripts) do
    local btn = crearBotonScript(v.nombre, v.link)
    btn.Parent = contenidoComandos
end

-- Ajustar CanvasSize inicial
wait(0.2)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, carpetaLayout.AbsoluteContentSize.Y + 10)

-- Filtrado por búsqueda
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = searchBox.Text:lower()
    -- Filtrar Juegos Populares
    for _, btn in pairs(contenidoJuegos:GetChildren()) do
        if btn:IsA("TextButton") then
            btn.Visible = btn.Text:lower():find(text) ~= nil
        end
    end
    -- Filtrar Comandos
    for _, btn in pairs(contenidoComandos:GetChildren()) do
        if btn:IsA("TextButton") then
            btn.Visible = btn.Text:lower():find(text) ~= nil
        end
    end
    -- Ajustar tamaño carpetas si están abiertas para nuevo contenido visible
    local function actualizarAltura(carpetaFrame, contenidoFrame)
        local visibleCount = 0
        for _, child in pairs(contenidoFrame:GetChildren()) do
            if child:IsA("TextButton") and child.Visible then
                visibleCount += 1
            end
        end
        local newHeight = visibleCount * 40
        if newHeight == 0 then newHeight = 0 end
        contenidoFrame:TweenSize(UDim2.new(1,0,0,newHeight), "Out", "Quad", 0.3, true)
        carpetaFrame:TweenSize(UDim2.new(1,0,0,35 + newHeight), "Out", "Quad", 0.3, true)
    end
    actualizarAltura(carpetaJuegos, contenidoJuegos)
    actualizarAltura(carpetaComandos, contenidoComandos)

    wait(0.35)
    scrollFrame.CanvasSize = UDim2
