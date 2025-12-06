if game.PlaceId == 82013336390273 then

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "lll HUB | Piackaxe Simulator",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "loading",
   LoadingSubtitle = "by Thanetnat",
   ShowText = "lll HUB", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "lll Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "kuyton",
      Subtitle = "Key System",
      Note = "get key from i ton", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = flase, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
  --local Var
  local ClaimAllCode = flase
  local AutoChest = flase
  local selectRebrithValue = nil
  local isAutoRebrith = false
  local Players = game:GetService("Players")
  local player = Players.LocalPlayer
  local TimeDaily = workspace.Chests.DailyChest.UI.GUI.Timer
  local TimeGroup = workspace.Chests.GroupChest.UI.GUI.Timer
  
  -- function 
  local function Daily()
    
      if TimeDaily.Text == "Ready!" then
        local args = {
          "Claim Chest",
          "DailyChest"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Paper"):WaitForChild("Remotes"):WaitForChild("__remotefunction"):InvokeServer(unpack(args))
      end
  end
  
local function Group()
    
      if TimeGroup.Text == "Ready!" then
        local args = {
          "Claim Chest",
          "GroupChest"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Paper"):WaitForChild("Remotes"):WaitForChild("__remotefunction"):InvokeServer(unpack(args))
      end
end
  

  local function code2()
    local args = {
      "Redeem Code",
      "Update2"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Paper"):WaitForChild("Remotes"):WaitForChild("__remotefunction"):InvokeServer(unpack(args))
  end
  local function code3()
    local args = {
      "Redeem Code",
      "Update3"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Paper"):WaitForChild("Remotes"):WaitForChild("__remotefunction"):InvokeServer(unpack(args))
  end
  local function code4()
    local args = {
      "Redeem Code",
      "Update4"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Paper"):WaitForChild("Remotes"):WaitForChild("__remotefunction"):InvokeServer(unpack(args))
  end
  local function code5()
    local args = {
      "Redeem Code",
      "update5"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Paper"):WaitForChild("Remotes"):WaitForChild("__remotefunction"):InvokeServer(unpack(args))
  end
  
 --local list
  
  local RebrithLists = {
    ["+1 Rebrith"] = "1",
    ["+5 Rebrith"] = "2",
    ["+20 Rebrith"] = "3",
    ["+50 Rebrith"] = "4",
    ["+100 Rebrith"] = "5",
    ["+250 Rebrith"] = "6",
    ["+500 Rebrith"] = "7",
    ["+1k Rebrith"] = "8",
    ["+2.5k Rebrith"] = "9",
    ["+5k Rebrith"] = "10",
    ["+10k Rebrith"] = "11",
    ["+25k Rebrith"] = "12",
    ["+50k Rebrith"] = "13",
    ["+100k Rebrith"] = "14",
    ["+250k Rebrith"] = "15",
    ["+500k Rebrith"] = "16",
    ["+1M Rebrith"] = "17",
    ["+2.5M Rebrith"] = "18",
    ["+10M Rebrith"] = "19",
    ["+25M Rebrith"] = "20",
    ["+100M Rebrith"] = "21",
    ["+1B Rebrith"] = "22",
    ["+50B Rebrith"] = "23",
    ["+500B Rebrith"] = "24",
    ["+5T Rebrith"] = "25",
    ["+100T Rebrith"] = "26",
    ["+1Qd Rebrith"] = "27",
    ["+50Qd Rebrith"] = "28",
    ["+500Qd Rebrith"] = "29",
    ["+2.5Qn Rebrith"] = "30",
    ["+50Qn Rebrith"] = "31",
    ["+500Qn Rebrith"] = "32",
    ["+5Sx Rebrith"] = "33",
    ["+100Sx Rebrith"] = "34",
    ["+1Sp Rebrith"] = "35",
    ["+50Sp Rebrith"] = "36"
    
  }
  
local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Section = MainTab:CreateSection("Auto Rebrith")
local SettingTab = Window:CreateTab("Setting", 4483362458)


local Dropdown = MainTab:CreateDropdown({
    Name = "Select ReBrith",
    Options = {
        "+1 Rebrith", "+5 Rebrith", "+20 Rebrith", "+50 Rebrith",
        "+100 Rebrith", "+250 Rebrith", "+500 Rebrith", "+1k Rebrith",
        "+2.5k Rebrith", "+5k Rebrith", "+10k Rebrith", "+25k Rebrith",
        "+50k Rebrith", "+100k Rebrith", "+250k Rebrith", "+500k Rebrith",
        "+1M Rebrith", "+2.5M Rebrith", "+10M Rebrith", "+25M Rebrith",
        "+100M Rebrith", "+1B Rebrith", "+50B Rebrith", "+500B Rebrith",
        "+1T Rebrith", "+100T Rebrith", "+1Qd Rebrith", "+50Qd Rebrith","+500Qd Rebrith",
        "+2.5Qn Rebrith", "+50Qn Rebrith", "+500Qn Rebrith",
        "+55x Rebrith","+100Sx Rebrith","+1Sp Rebrith","+50Sp Rebrith"
    },
    CurrentOption = {"+1 Rebrith"},
    MultipleOptions = false,
    flag = "Dropdown1",
    Callback = function(Options)
        local selectedName = typeof(Options) == "table" and Options[1] or Options
        selectRebrithValue = RebrithLists[selectedName]
    end,
})
  
  
  local Toggle = MainTab:CreateToggle({
    Name = "Auto Rebirth Selected",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        isAutoRebrith = Value

        while isAutoRebrith do

            if selectRebrithValue == nil then
                print("เลือกจำนวนก่อน")
                break
            end

            local args = {
                "Rebirth",
                tonumber(selectRebrithValue)
            }

            game:GetService("ReplicatedStorage")
                :WaitForChild("Paper")
                :WaitForChild("Remotes")
                :WaitForChild("__remotefunction")
                :InvokeServer(unpack(args))

            task.wait()
        end
    end,
})
  


local Section = MainTab:CreateSection("Auto Claim")
  
local ToggleClaim = MainTab:CreateToggle({
    Name = "Auto Claim Chests",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(state)
        AutoChest = state
      if AutoChest then
        Daily()
        Group()
      end
        
    end,
})
  local ToggleClaim = MainTab:CreateToggle({
    Name = "Claim All Code",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Val)
      ClaimAllCode = Val
      if ClaimAllCode then
        code2()
        code3()
        code4()
        code5()
      end
        
    end,
})

  
  local Section = MainTab:CreateSection("Change Speed")
  
local MiningSlider = MainTab:CreateSlider({
    Name = "Mining Speed",
    Range = {1, 10},
    Increment = 1,
    Suffix = "x",
    CurrentValue = 1,
    Flag = "Slider1",
    Callback = function(Value)
        local stats = game:GetService("ReplicatedStorage").Stats:FindFirstChild(player.Name)
        if stats then
            local boost = stats:FindFirstChild("MiningSpeedBoost")
            if boost then
                boost.Value = Value
            end
        end
    end,
})


 local HatchSlider = MainTab:CreateSlider({
    Name = "Hatch Speed",
    Range = {1, 7},
    Increment = 1,
    Suffix = "x",
    CurrentValue = 1,
    Flag = "Slider2",
    Callback = function(Value)
        local stats = game:GetService("ReplicatedStorage").Stats:FindFirstChild(player.Name)
        if stats then
            local eggStats = stats:FindFirstChild("EggStats")
            if eggStats then
                local hatch = eggStats:FindFirstChild("HatchSpeed")
                if hatch then
                    hatch.Value = Value
                end
            end
        end
    end,
})
  
  



  local Section = SettingTab:CreateSection("Change Theme")
--Theme
local ThemeDropdown = SettingTab:CreateDropdown({
    Name = "Select Theme",
    Options = {
        "Default",
        "Amethyst",
        "Bloom",
        "Green",
        "Light",
        "Ocean",
        "Serenity"
    },
    CurrentOption = {"Default"},
    MultipleOptions = false,
    flag = "Dropdown2",
    Callback = function(Options)
        local selectedTheme = typeof(Options) == "table" and Options[1] or Options
        Window.ModifyTheme(selectedTheme)
    end,
})
  
  local Section = SettingTab:CreateSection("Close Ui")
  
local DestroyButton = SettingTab:CreateButton({
   Name = "Destroy Gui",
   Callback = function()
     Rayfield:Destroy()
   end,
})
  
  Rayfield:LoadConfiguration()
  
end
