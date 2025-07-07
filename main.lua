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

-- Título del panel
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "By Christian"
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Acción del botón C para abrir/cerrar panel
toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)
