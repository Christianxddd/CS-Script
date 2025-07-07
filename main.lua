local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MovableTestUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- PANEL BASE
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 300, 0, 600)
panel.Position = UDim2.new(0.3, 0, 0.1, 0)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.BackgroundTransparency = 0.3
panel.Active = true
panel.Draggable = false -- lo controlamos con el frame superior

-- BOTÓN C
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0, 60, 0, 60)
cBtn.Position = UDim2.new(0, 20, 0, 20)
cBtn.Text = "C"
cBtn.Font = Enum.Font.Arcade
cBtn.TextScaled = true
cBtn.BackgroundColor3 = Color3.new(0, 0, 0)
cBtn.TextColor3 = Color3.new(1,1,1)
cBtn.Draggable = true

-- FRAME SUPERIOR INVISIBLE PARA MOVER
local dragZone = Instance.new("TextButton", panel)
dragZone.Size = UDim2.new(1, 0, 0, 50)
dragZone.Position = UDim2.new(0, 0, 0, 0)
dragZone.Text = ""
dragZone.BackgroundTransparency = 1
dragZone.AutoButtonColor = false
dragZone.ZIndex = 10

-- FUNCIÓN DE DRAG MANUAL
local dragging, dragInput, startPos, startDrag
dragZone.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		startPos = input.Position
		startDrag = panel.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

dragZone.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		local delta = input.Position - startPos
		panel.Position = UDim2.new(
			startDrag.X.Scale, startDrag.X.Offset + delta.X,
			startDrag.Y.Scale, startDrag.Y.Offset + delta.Y
		)
	end
end)

-- SCROLLING FRAME INTERNO
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, 0, 1, -50)
scroll.Position = UDim2.new(0, 0, 0, 50)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.AutomaticSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 6

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)

-- EJEMPLO DE CONTENIDO
for i = 1, 20 do
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(0.9, 0, 0, 40)
	btn.Text = "Botón " .. i
	btn.Font = Enum.Font.Arcade
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
end
