-- Ghost Hub V2 by ChristianSebas
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ChristianSebasHub"
gui.ResetOnSpawn = false

-- Sonido miau
local miau = Instance.new("Sound", gui)
miau.SoundId = "rbxassetid://9121281154"
miau.Volume = 2

-- Rainbow
local function rainbow()
  local t = tick()
  return Color3.fromHSV((t%5)/5,1,1)
end

-- Botón flotante "C"
local cBtn = Instance.new("TextButton", gui)
cBtn.Size = UDim2.new(0,60,0,60)
cBtn.Position = UDim2.new(0,20,0,20)
cBtn.Text = "C"
cBtn.TextScaled = true
cBtn.Font = Enum.Font.Arcade
cBtn.BackgroundColor3 = Color3.new(0,0,0)
cBtn.TextColor3 = Color3.new(1,1,1)
cBtn.Draggable = true

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0.95,0,0.65,0)
panel.Position = UDim2.new(0.025,0,0.2,0)
panel.BackgroundColor3 = Color3.fromRGB(20,20,20)
panel.BackgroundTransparency = 0.3
panel.Active = true
panel.Draggable = true
panel.Visible = false
Instance.new("UICorner", panel)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2

-- Título y cierre
local title = Instance.new("TextLabel", panel)
title.Position = UDim2.new(0,0,0,0)
title.Size = UDim2.new(1,0,0,0.1)
title.Text = "👾 Ghost Hub V2"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

local closeBtn = Instance.new("TextButton", panel)
closeBtn.Position = UDim2.new(0.95,0,0,0)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Text = "❌"
closeBtn.Font = Enum.Font.Arcade
closeBtn.TextScaled = true
closeBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)

closeBtn.MouseButton1Click:Connect(function()
  panel.Visible = false
end)

-- Toggle panel + miau
cBtn.MouseButton1Click:Connect(function()
  panel.Visible = not panel.Visible
  if panel.Visible then miau:Play() end
end)

-- Category Frames creator
local function newFrame(y)
  local f = Instance.new("Frame", panel)
  f.Position = UDim2.new(0,0,y,0)
  f.Size = UDim2.new(1,0,0,0.15)
  f.BackgroundTransparency = 1
  return f
end

-- Button creator
local function newBtn(parent,text,x,callback)
  local b = Instance.new("TextButton", parent)
  b.Position = UDim2.new(x,0,0.1,0)
  b.Size = UDim2.new(0.15,0,0.8,0)
  b.Text = text
  b.Font = Enum.Font.Arcade
  b.TextScaled = true
  b.BackgroundColor3 = Color3.fromRGB(40,40,40)
  b.TextColor3 = Color3.new(1,1,1)
  b.MouseButton1Click:Connect(callback)
  return b
end

-- Movement Section
local moveFrame = newFrame(0.1)
newBtn(moveFrame,"+Speed",0.0,function() player.Character.Humanoid.WalkSpeed+=5 end)
newBtn(moveFrame,"-Speed",0.17,function() player.Character.Humanoid.WalkSpeed-=5 end)
newBtn(moveFrame,"Toggle Fly",0.34,function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)
newBtn(moveFrame,"Toggle Noclip",0.51,function()
  local nc = player.Character
  for _,part in pairs(nc:GetDescendants()) do
    if part:IsA("BasePart") then part.CanCollide = not part.CanCollide end
  end
end)
newBtn(moveFrame,"Godmode",0.68,function()
  pcall(function() player.Character.Humanoid.Health = math.huge end)
end)

-- Vision Section
local visFrame = newFrame(0.25)
local espOn = false
newBtn(visFrame,"Toggle ESP",0.0,function()
  espOn = not espOn
  for _,v in pairs(game.Players:GetPlayers()) do
    if v~=player and v.Character and v.Character:FindFirstChild("Head") then
      if espOn then
        local bb = Instance.new("BillboardGui",v.Character.Head)
        bb.Name="ESP"; bb.Size=UDim2.new(0,200,0,50)
        bb.Adornee=v.Character.Head
        bb.AlwaysOnTop=true
        local txt = Instance.new("TextLabel",bb)
        txt.Size=UDim2.new(1,0,1,0);txt.Text=v.Name
        txt.BackgroundTransparency=1; txt.TextScaled=true; txt.TextColor3=Color3.new(1,1,1)
      else
        local old = v.Character.Head:FindFirstChild("ESP")
        if old then old:Destroy() end
      end
    end
  end
end)
newBtn(visFrame,"ESP Boxes",0.17,function()
  -- placeholder for 2D box esp code
end)
newBtn(visFrame,"ESP Distance",0.34,function()
  -- placeholder
end)
newBtn(visFrame,"Aimbot",0.51,function()
  -- placeholder for basic aimbot
end)

-- Scripts Section
local scrFrame = newFrame(0.4)
newBtn(scrFrame,"Blox Fruits",0.0,function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end)
newBtn(scrFrame,"Jailbreak",0.17,function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
end)
newBtn(scrFrame,"Dead Rails",0.34,function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails",true))()
end)
newBtn(scrFrame,"Brainlot",0.51,function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
end)
newBtn(scrFrame,"Ghost Hub OG",0.68,function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
  game.StarterGui:SetCore("SendNotification",{Title="GhostHub",Text="Original cargado",Duration=3})
end)

-- Utilities Section
local utilFrame = newFrame(0.55)
newBtn(utilFrame,"Touch Fling",0.0,function()
  loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"))()
end)
newBtn(utilFrame,"Comandos",0.17,function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
newBtn(utilFrame,"Teleport",0.34,function()
  -- basic teleport GUI --
  pcall(function()
    local tp = Instance.new("ScreenGui",gui)
    tp.Name="TeleporterGUI"
    local c = Instance.new("TextBox",tp);c.Position=UDim2.new(0.4,0,0.4,0)
    c.Size=UDim2.new(0.2,0,0.05,0);c.PlaceholderText="Player name"
    local b = Instance.new("TextButton",tp);b.Position=UDim2.new(0.4,0,0.46,0)
    b.Size=UDim2.new(0.2,0,0.05,0);b.Text="Teleport"
    b.MouseButton1Click:Connect(function()
      local t = game.Players:FindFirstChild(c.Text)
      if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame
      end
    end)
  end)
end)
newBtn(utilFrame,"Anti-Detect",0.51,function()
  -- placeholder
end)
-- TikTok Button
local tk = Instance.new("ImageButton", panel)
tk.Position = UDim2.new(0.9,0,0.88,0)
tk.Size = UDim2.new(0.08,0,0.08,0)
tk.Image = "rbxassetid://14218073818"
tk.MouseButton1Click:Connect(function()
  setclipboard("https://www.tiktok.com/@christ_sebast_7d")
  game.StarterGui:SetCore("SendNotification",{Title="TikTok",Text="Link copiado",Duration=3})
end)

-- Rainbow animation
game:GetService("RunService").RenderStepped:Connect(function()
  local c = rainbow()
  stroke.Color = c
  for _,v in pairs(panel:GetChildren()) do
    if v:IsA("TextLabel") or v:IsA("TextButton") then
      v.TextColor3 = c
    elseif v:IsA("ImageButton") then
      v.ImageColor3 = c
    end
  end
end)

-- Respawn reset
player.CharacterAdded:Connect(function(_,r)
  wait(1)
  -- reset movement toggles
end)
