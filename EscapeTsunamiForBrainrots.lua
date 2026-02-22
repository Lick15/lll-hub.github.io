local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local folder = workspace:WaitForChild("DoomEventParts")

local SAFE_HEIGHT = 120 -- ปรับความสูง
local SPEED = 550 -- ปรับความเร็ว

local function getRoot()
    local character = player.Character or player.CharacterAdded:Wait()
    return character:WaitForChild("HumanoidRootPart")
end

local function moveTo(pos)
    local hrp = getRoot()

    while (hrp.Position - pos).Magnitude > 3 do
        local direction = (pos - hrp.Position).Unit
        hrp.CFrame = hrp.CFrame + direction * SPEED * RunService.Heartbeat:Wait()
    end
end

while true do
    for _, obj in pairs(folder:GetChildren()) do
        if obj.Name == "DoomCoin" then

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
            end

            task.wait(0.2)
        end
    end
    task.wait(0.3)
end
