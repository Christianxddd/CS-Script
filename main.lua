local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianProPanel"
gui.ResetOnSpawn = false

-- Botón flotante con "C"
local iconBtn = Instance.new("TextButton", gui)
iconBtn.Size = UDim2.new(0, 50, 0, 50)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.Text = "C"
iconBtn.BackgroundColor3 = Color3.new(0, 0, 0)
iconBtn.TextColor3 = Color3.new(1, 1, 1)
iconBtn.Font = Enum.Font.Arcade
iconBtn.TextScaled = true
iconBtn.Draggable = true
iconBtn.Active = true
iconBtn.ZIndex = 5

-- Panel Principal
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 500)
main.Position = UDim2.new(0.5, -200, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BackgroundTransparency = 0.2
main.Visible = false
main.Active = true
main.Draggable = true

-- Título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "By Christian"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Barra de búsqueda
local searchBox = Instance.new("TextBox", main)
searchBox.PlaceholderText = "Buscar..."
searchBox.Size = UDim2.new(1, -20, 0, 35)
searchBox.Position = UDim2.new(0, 10, 0, 60)
searchBox.Font = Enum.Font.Code
searchBox.TextScaled = true
searchBox.Text = ""
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.BackgroundColor3 = Color3.fromRGB(50,50,50)

-- ScrollingFrame para las carpetas
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -20, 1, -140)
scroll.Position = UDim2.new(0, 10, 0, 110)
scroll.CanvasSize = UDim2.new(0, 0, 10, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 10)

-- Crear botón de carpeta
local function crearCarpeta(nombre, scripts)
	local folderBtn = Instance.new("TextButton", scroll)
	folderBtn.Size = UDim2.new(1, 0, 0, 40)
	folderBtn.Text = "📁 " .. nombre
	folderBtn.Font = Enum.Font.Arcade
	folderBtn.TextScaled = true
	folderBtn.TextColor3 = Color3.new(1, 1, 1)
	folderBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	folderBtn.MouseButton1Click:Connect(function()
		main.Visible = false
		local subFrame = Instance.new("Frame", gui)
		subFrame.Size = main.Size
		subFrame.Position = main.Position
		subFrame.BackgroundColor3 = main.BackgroundColor3
		subFrame.Draggable = true
		subFrame.Active = true

		local back = Instance.new("TextButton", subFrame)
		back.Size = UDim2.new(0, 100, 0, 40)
		back.Position = UDim2.new(0, 10, 1, -50)
		back.Text = "🔙 Regresar"
		back.Font = Enum.Font.Arcade
		back.TextScaled = true
		back.BackgroundColor3 = Color3.fromRGB(60,60,60)
		back.TextColor3 = Color3.new(1,1,1)

		local list = Instance.new("ScrollingFrame", subFrame)
		list.Size = UDim2.new(1, -20, 1, -60)
		list.Position = UDim2.new(0, 10, 0, 10)
		list.CanvasSize = UDim2.new(0,0,10,0)
		list.ScrollBarThickness = 6
		list.BackgroundTransparency = 1
		local lay = Instance.new("UIListLayout", list)
		lay.Padding = UDim.new(0, 10)

		for nombre, url in pairs(scripts) do
			local btn = Instance.new("TextButton", list)
			btn.Size = UDim2.new(1, 0, 0, 40)
			btn.Text = nombre
			btn.Font = Enum.Font.Arcade
			btn.TextScaled = true
			btn.TextColor3 = Color3.new(1,1,1)
			btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
			btn.MouseButton1Click:Connect(function()
				loadstring(game:HttpGet(url))()
			end)
		end

		back.MouseButton1Click:Connect(function()
			subFrame:Destroy()
			main.Visible = true
		end)
	end)
end

-- Contenido de las carpetas
local juegosPopulares = {
	["🧠 Brainlot"] = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot",
	["🚓 Jailbreak"] = "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular",
	["🚂 Dead Rails"] = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails",
	["🍉 Blox Fruits"] = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau",
	["💣 Da Hood"] = "https://raw.githubusercontent.com/lerkermer/lua-projects/master/DaHoodAutoBuy.lua",
	["🏆 BedWars"] = "https://raw.githubusercontent.com/LOLking123456/bedwars/main/beta",
	["🏙 Brookhaven"] = "https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/Brookhaven",
	["🧱 Build A Boat"] = "https://raw.githubusercontent.com/VxpeWasTaken/Boat/main/Main",
	["🐒 Pet Simulator X"] = "https://raw.githubusercontent.com/Synolope/PSX/main/SynolopePSX.lua",
	["👮 Prison Life"] = "https://raw.githubusercontent.com/ResetPower/executor/main/prisonlife.lua",
}

local comandos = {
	["🚀 Fly V3"] = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt",
	["🌀 Touch Fling"] = "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194",
	["👁 ESP Player"] = "https://raw.githubusercontent.com/zt2t/esp/main/esp.lua",
	["💻 Infinity Yield"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
}

local general = {
	["👽 Alien Shooter"] = "https://pastebin.com/raw/VhK7t65x",
	["🔫 Gun Mayhem"] = "https://pastebin.com/raw/FstSJD1N",
	["🚗 Car Crusher"] = "https://pastebin.com/raw/LZXXS1Pt",
	["🌆 City Tycoon"] = "https://pastebin.com/raw/FyK9x4pF",
	["🏕 Camping 2"] = "https://pastebin.com/raw/dvMcDdsV",
	["🧱 Build Simulator"] = "https://pastebin.com/raw/JFfGh1tM",
	["🚂 Train System"] = "https://pastebin.com/raw/1GQFzhv3",
	["🔥 Tower Defense"] = "https://pastebin.com/raw/2uGbNuQX",
	["🗡 Ninja Legends"] = "https://pastebin.com/raw/k4UUkENZ",
	["🏝 Tropical Resort Tycoon"] = "https://pastebin.com/raw/vWuMkwKL",
	["🛸 UFO Simulator"] = "https://pastebin.com/raw/8Uv7aMkJ",
	["🎮 Script Hub"] = "https://pastebin.com/raw/1NUz9UpK",
}

-- Crear carpetas
crearCarpeta("Juegos Populares", juegosPopulares)
crearCarpeta("Comandos", comandos)
crearCarpeta("General", general)

-- Pantalla de bienvenida épica
iconBtn.MouseButton1Click:Connect(function()
	if not main.Visible then
		local splash = Instance.new("TextLabel", gui)
		splash.Size = UDim2.new(1, 0, 1, 0)
		splash.Position = UDim2.new(0, 0, 0, 0)
		splash.BackgroundColor3 = Color3.new(0, 0, 0)
		splash.BackgroundTransparency = 0
		splash.Text = "By Christian"
		splash.TextScaled = true
		splash.Font = Enum.Font.Arcade
		splash.TextColor3 = Color3.new(1, 1, 1)
		splash.ZIndex = 10

		local tweenService = game:GetService("TweenService")
		wait(0.5)
		local fadeOut = tweenService:Create(splash, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1,
			TextTransparency = 1
		})

		fadeOut:Play()
		fadeOut.Completed:Wait()
		splash:Destroy()
		main.Visible = true
	else
		main.Visible = false
	end
end)
