local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "ByChristianUI"
gui.ResetOnSpawn = false

-- Botón flotante
local btn = Instance.new("TextButton", gui)
btn.Text = "C"
btn.Size = UDim2.new(0, 60, 0, 60)
btn.Position = UDim2.new(0, 20, 0, 20)
btn.Font = Enum.Font.Arcade
btn.TextScaled = true
btn.TextColor3 = Color3.new(1,1,1)
btn.BackgroundColor3 = Color3.new(0,0,0)
btn.Draggable = true

-- Panel
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0.55, 0, 0.65, 0)
panel.Position = UDim2.new(0.2, 0, 0.15, 0)
panel.BackgroundTransparency = 0.4
panel.BackgroundColor3 = Color3.fromRGB(20,20,20)
panel.Visible = false
panel.Active = true
panel.Draggable = true

-- Título
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0.08, 0)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

-- Contenedor scroll
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, 0, 0.92, 0)
scroll.Position = UDim2.new(0, 0, 0.08, 0)
scroll.CanvasSize = UDim2.new(0, 0, 5, 0)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 6

local layout = Instance.new("UIListLayout", scroll)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 5)

-- Función carpeta
local function crearCarpeta(nombre, scripts)
	local folder = Instance.new("TextButton", scroll)
	folder.Size = UDim2.new(1, -20, 0, 40)
	folder.Text = "📁 " .. nombre
	folder.Font = Enum.Font.Arcade
	folder.TextScaled = true
	folder.TextColor3 = Color3.new(1,1,1)
	folder.BackgroundColor3 = Color3.fromRGB(30,30,30)

	folder.MouseButton1Click:Connect(function()
		panel.Visible = false
		local sub = Instance.new("ScrollingFrame", gui)
		sub.Size = UDim2.new(0.5, 0, 0.6, 0)
		sub.Position = UDim2.new(0.25, 0, 0.2, 0)
		sub.CanvasSize = UDim2.new(0,0,#scripts * 0.15,0)
		sub.ScrollBarThickness = 8
		sub.BackgroundColor3 = Color3.fromRGB(20,20,20)
		sub.BackgroundTransparency = 0.4
		sub.Name = "SubMenu"
		local sublayout = Instance.new("UIListLayout", sub)
		sublayout.SortOrder = Enum.SortOrder.LayoutOrder
		sublayout.Padding = UDim.new(0,5)

		for _, s in pairs(scripts) do
			local b = Instance.new("TextButton", sub)
			b.Size = UDim2.new(1,-10,0,40)
			b.Text = s.name
			b.Font = Enum.Font.Arcade
			b.TextScaled = true
			b.BackgroundColor3 = Color3.fromRGB(40,40,40)
			b.TextColor3 = Color3.new(1,1,1)
			b.MouseButton1Click:Connect(function()
				loadstring(game:HttpGet(s.link))()
			end)
		end

		local back = Instance.new("TextButton", sub)
		back.Size = UDim2.new(1,-10,0,40)
		back.Text = "🔙 Regresar"
		back.Font = Enum.Font.Arcade
		back.TextScaled = true
		back.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
		back.TextColor3 = Color3.new(1,1,1)
		back.MouseButton1Click:Connect(function()
			sub:Destroy()
			panel.Visible = true
		end)
	end)
end

-- Carpetas
crearCarpeta("Juegos Populares", {
	{name="Brainlot", link="https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{name="Jailbreak", link="https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{name="Dead Rails", link="https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{name="Blox Fruits", link="https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
})

crearCarpeta("Comandos", {
	{name="Fly V3", link="https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{name="Touch Fling", link="https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{name="ESP Player", link="https://pastebin.com/raw/8f33FW6h"},
	{name="Infinity Yield", link="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
})

crearCarpeta("General", {
	{name="Arsenal OP", link="https://pastebin.com/raw/fH4dgzsc"},
	{name="AntiBan", link="https://pastebin.com/raw/PgVxhx8W"},
	{name="BTools", link="https://pastebin.com/raw/UB6G3D5G"},
	{name="Auto Clicker", link="https://pastebin.com/raw/mwdfqGHY"},
})

-- Abrir/cerrar panel
btn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)
