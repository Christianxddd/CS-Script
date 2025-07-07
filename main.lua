local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

-- Botón "C"
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.Text = "C"
openBtn.BackgroundColor3 = Color3.new(0, 0, 0)
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Font = Enum.Font.Arcade
openBtn.TextScaled = true
openBtn.Draggable = true
openBtn.Active = true
Instance.new("UICorner", openBtn)

-- Panel oculto
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 400, 0, 300)
panel.Position = UDim2.new(0.5, -200, 0.5, -150)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.Visible = false
panel.Active = true
panel.Draggable = true
Instance.new("UICorner", panel)

-- Abrir/Cerrar panel
openBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)
