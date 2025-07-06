-- Interfaz By ChristianSebas Mejorado
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasUI"
gui.ResetOnSpawn = false

-- Botón flotante "C"
local cBtn = Instance.new("TextButton")
cBtn.Size = UDim2.new(0, 50, 0, 50)
cBtn.Position = UDim2.new(0.5, -25, 0.5, -25)
cBtn.Text = "C"
cBtn.TextScaled = true
cBtn.Font = Enum.Font.SourceSansBold
cBtn.TextColor3 = Color3.new(1, 1, 1)
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.BorderSizePixel = 0
cBtn.Active = true
cBtn.Draggable = true
cBtn.Parent = gui

-- Menú
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 200, 0, 240)
menu.Position = UDim2.new(0.5, -100, 0.5, -120)
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

-- Crear botones
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

local speedBtn = crearBoton("Correr Rápido (Velocidad 100)", 0.2)
local jumpBtn = crearBoton("Saltar Alto (Poder 150)", 0.35)
local flyBtn = crearBoton("Activar Vuelo (Velocidad 80)", 0.5)
local xrayBtn = crearBoton("X-Ray (Ver nombres)", 0.65)
local cerrarBtn = crearBoton("Cerrar", 0.8)
cerrarBtn.TextColor3 = Color3.fromRGB(255, 50, 50)

-- Abrir/Cerrar Menú
cBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)

cerrarBtn.MouseButton1Click:Connect(function()
	menu.Visible = false
end)

-- Velocidad
speedBtn.MouseButton1Click:Connect(function()
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")
	humanoid.WalkSpeed = 100 -- Puedes cambiar este número
end)

-- Salto Alto
jumpBtn.MouseButton1Click:Connect(function()
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")
	humanoid.JumpPower = 150 -- Puedes cambiar este número
end)

-- Fly REAL editable
flyBtn.MouseButton1Click:Connect(function()
	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")
	local flying = true
	local speed = 80 -- Cambia este número para ajustar velocidad de vuelo

	local bodyGyro = Instance.new("BodyGyro", root)
	bodyGyro.P = 9e4
	bodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	bodyGyro.cframe = root.CFrame

	local bodyVelocity = Instance.new("BodyVelocity", root)
	bodyVelocity.velocity = Vector3.new(0,0,0)
	bodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)

	local UIS = game:GetService("UserInputService")
	local control = {F = 0, B = 0, L = 0, R = 0, U = 0}

	local conn1 = UIS.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.W then control.F = 1 end
		if input.KeyCode == Enum.KeyCode.S then control.B = -1 end
		if input.KeyCode == Enum.KeyCode.A then control.L = -1 end
		if input.KeyCode == Enum.KeyCode.D then control.R = 1 end
		if input.KeyCode == Enum.KeyCode.Space then control.U = 1 end
	end)

	local conn2 = UIS.InputEnded:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.W then control.F = 0 end
		if input.KeyCode == Enum.KeyCode.S then control.B = 0 end
		if input.KeyCode == Enum.KeyCode.A then control.L = 0 end
		if input.KeyCode == Enum.KeyCode.D then control.R = 0 end
		if input.KeyCode == Enum.KeyCode.Space then control.U = 0 end
	end)

	spawn(function()
		while flying do
			wait()
			local camCF = workspace.CurrentCamera.CFrame
			bodyGyro.cframe = camCF
			bodyVelocity.velocity = (camCF.lookVector * (control.F + control.B) + camCF.RightVector * (control.R + control.L) + Vector3.new(0, control.U, 0)) * speed
		end
	end)

	wait(12) -- Tiempo que durará el vuelo
	flying = false
	bodyGyro:Destroy()
	bodyVelocity:Destroy()
	conn1:Disconnect()
	conn2:Disconnect()
end)

-- XRAY (ver nombres de todos los jugadores)
xrayBtn.MouseButton1Click:Connect(function()
	for _, v in pairs(game.Players:GetPlayers()) do
		if v.Character and v.Character:FindFirstChild("Head") and not v.Character.Head:FindFirstChild("NameTag") then
			local billboard = Instance.new("BillboardGui", v.Character.Head)
			billboard.Name = "NameTag"
			billboard.Size = UDim2.new(0, 200, 0, 50)
			billboard.Adornee = v.Character.Head
			billboard.AlwaysOnTop = true

			local textLabel = Instance.new("TextLabel", billboard)
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = v.Name
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.TextScaled = true
		end
	end
end)
