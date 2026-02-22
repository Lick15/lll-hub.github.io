local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ลบ UI เก่า
if playerGui:FindFirstChild("DoomUI") then
	playerGui.DoomUI:Destroy()
end

-- สร้าง GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DoomUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- ตัวแปรระบบ
local autoEnabled = false
local farming = false

-- =========================
-- UI หลัก
-- =========================
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,370,0,200)
main.Position = UDim2.new(0.5,-185,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(15,35,95)
main.BackgroundTransparency = 0.25
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,20)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(0,200,255)
stroke.Thickness = 2

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "เก็บเหรียญDoom by Bloss999"
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)

-- STATUS LIGHT
local light = Instance.new("Frame", main)
light.Size = UDim2.new(0,15,0,15)
light.Position = UDim2.new(0.5,-80,0,65)
light.BackgroundColor3 = Color3.fromRGB(255,0,0)
Instance.new("UICorner", light).CornerRadius = UDim.new(1,0)

-- STATUS TEXT
local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(0,200,0,30)
status.Position = UDim2.new(0.5,-55,0,57)
status.BackgroundTransparency = 1
status.Text = "ปิดระบบ"
status.Font = Enum.Font.Gotham
status.TextScaled = true
status.TextColor3 = Color3.new(1,1,1)
status.TextXAlignment = Enum.TextXAlignment.Left

-- TOGGLE BUTTON
local toggle = Instance.new("TextButton", main)
toggle.Size = UDim2.new(0.7,0,0,50)
toggle.Position = UDim2.new(0.15,0,0,120)
toggle.Text = "เปิดระบบ"
toggle.Font = Enum.Font.GothamBold
toggle.TextScaled = true
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(0,180,255)
Instance.new("UICorner", toggle)

-- MINIMIZE
local mini = Instance.new("TextButton", main)
mini.Size = UDim2.new(0,28,0,28)
mini.Position = UDim2.new(1,-35,0,8)
mini.Text = "-"
mini.TextScaled = true
mini.BackgroundColor3 = Color3.fromRGB(0,160,255)
mini.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", mini).CornerRadius = UDim.new(1,0)

-- REOPEN BUTTON
local reopen = Instance.new("TextButton", gui)
reopen.Size = UDim2.new(0,110,0,35)
reopen.Position = UDim2.new(0.5,-55,0.3,0)
reopen.Text = "OPEN"
reopen.Visible = false
reopen.BackgroundColor3 = Color3.fromRGB(0,180,255)
reopen.BackgroundTransparency = 0.25
reopen.TextColor3 = Color3.new(1,1,1)
reopen.TextScaled = true
reopen.Active = true
reopen.Draggable = true
Instance.new("UICorner", reopen)

mini.MouseButton1Click:Connect(function()
	main.Visible = false
	reopen.Visible = true
end)

reopen.MouseButton1Click:Connect(function()
	main.Visible = true
	reopen.Visible = false
end)

-- =========================
-- ระบบเก็บเหรียญ
-- =========================

local SAFE_HEIGHT = 120
local SPEED = 550

local function getRoot()
	local character = player.Character or player.CharacterAdded:Wait()
	return character:WaitForChild("HumanoidRootPart")
end

local function moveTo(pos)
	local hrp = getRoot()
	while autoEnabled and (hrp.Position - pos).Magnitude > 3 do
		local direction = (pos - hrp.Position).Unit
		hrp.CFrame += direction * SPEED * RunService.Heartbeat:Wait()
	end
end

local function farmCoins()
	if farming then return end
	farming = true
	
	task.spawn(function()
		while autoEnabled do
			local folder = workspace:FindFirstChild("DoomEventParts")
			local found = false
			
			if folder then
				for _, obj in pairs(folder:GetChildren()) do
					if not autoEnabled then break end
					
					if obj.Name == "DoomCoin" then
						found = true
						
						status.Text = "กำลังเก็บเหรียญ..."
						light.BackgroundColor3 = Color3.fromRGB(0,255,100)
						
						local targetPos
						if obj:IsA("BasePart") then
							targetPos = obj.Position
						elseif obj:IsA("Model") then
							targetPos = obj:GetPivot().Position
						end
						
						if targetPos then
							local hrp = getRoot()
							moveTo(Vector3.new(hrp.Position.X, SAFE_HEIGHT, hrp.Position.Z))
							moveTo(Vector3.new(targetPos.X, SAFE_HEIGHT, targetPos.Z))
							moveTo(targetPos + Vector3.new(0,3,0))
							task.wait(0.2)
						end
					end
				end
			end
			
			if not found then
				status.Text = "รอเหรียญเกิด..."
				light.BackgroundColor3 = Color3.fromRGB(255,170,0)
			end
			
			task.wait(0.4)
		end
		
		farming = false
	end)
end

-- =========================
-- อนิเมชั่นเปิดระบบ
-- =========================
local function playOpenAnimation()
	main.Size = UDim2.new(0,0,0,0)
	TweenService:Create(main,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
		Size = UDim2.new(0,370,0,200)
	}):Play()
	
	TweenService:Create(stroke,TweenInfo.new(0.3),{
		Thickness = 4
	}):Play()
	
	task.delay(0.3,function()
		stroke.Thickness = 2
	end)
end

-- =========================
-- TOGGLE
-- =========================
toggle.MouseButton1Click:Connect(function()
	autoEnabled = not autoEnabled
	
	if autoEnabled then
		toggle.Text = "ปิดระบบ"
		playOpenAnimation()
		farmCoins()
	else
		toggle.Text = "เปิดระบบ"
		status.Text = "ปิดระบบ"
		light.BackgroundColor3 = Color3.fromRGB(255,0,0)
	end
end)
