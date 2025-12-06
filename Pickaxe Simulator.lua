
loadstring([=[
if game.PlaceId==82013336390273 then
local _R=loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local _W=_R:CreateWindow({Name="lll HUB | Piackaxe Simulator",Icon=0,LoadingTitle="loading",LoadingSubtitle="by Thanetnat",ShowText="lll HUB",Theme="Default",ToggleUIKeybind="K",DisableRayfieldPrompts=false,DisableBuildWarnings=false,ConfigurationSaving={Enabled=false,FolderName=nil,FileName="lll Hub"},Discord={Enabled=false,Invite="noinvitelink",RememberJoins=true},KeySystem=false,KeySettings={Title="kuyton",Subtitle="Key System",Note="get key from i ton",FileName="Key",SaveKey=true,GrabKeyFromSite=false,Key={"Hello"}}})
local cC=false;aC=false;sr=nil;ir=false
local P=game:GetService("Players");local pl=P.LocalPlayer
local tD=workspace.Chests.DailyChest.UI.GUI.Timer
local tG=workspace.Chests.GroupChest.UI.GUI.Timer
local function fDaily() if tD and tD.Text=="Ready!" then local a={"Claim Chest","DailyChest"};game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction:InvokeServer(unpack(a)) end end
local function fGroup() if tG and tG.Text=="Ready!" then local a={"Claim Chest","GroupChest"};game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction:InvokeServer(unpack(a)) end end
local function f2() local a={"Redeem Code","update2"};game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction:InvokeServer(unpack(a)) end
local function f3() local a={"Redeem Code","update3"};game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction:InvokeServer(unpack(a)) end
local function f4() local a={"Redeem Code","update4"};game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction:InvokeServer(unpack(a)) end
local function f5() local a={"Redeem Code","update5"};game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction:InvokeServer(unpack(a)) end
local R={["+1 Rebirth"]="1",["+5 Rebirth"]="2",["+20 Rebirth"]="3",["+50 Rebirth"]="4",["+100 Rebirth"]="5",["+250 Rebirth"]="6",["+500 Rebirth"]="7",["+1k Rebirth"]="8",["+2.5k Rebirth"]="9",["+5k Rebirth"]="10",["+10k Rebirth"]="11",["+25k Rebirth"]="12",["+50k Rebirth"]="13",["+100k Rebirth"]="14",["+250k Rebirth"]="15",["+500k Rebirth"]="16",["+1M Rebirth"]="17",["+2.5M Rebirth"]="18",["+10M Rebirth"]="19",["+25M Rebirth"]="20",["+100M Rebirth"]="21",["+1B Rebirth"]="22",["+50B Rebirth"]="23",["+500B Rebirth"]="24",["+1T Rebirth"]="25",["+100T Rebirth"]="26",["+1Qd Rebirth"]="27",["+50Qd Rebirth"]="28",["+500Qd Rebirth"]="29",["+2.5Qn Rebirth"]="30",["+50Qn Rebirth"]="31",["+500Qn Rebirth"]="32",["+5Sx Rebirth"]="33",["+100Sx Rebirth"]="34",["+1Sp Rebirth"]="35",["+50Sp Rebirth"]="36"}
local MT=_W:CreateTab("Main",4483362458)
local _sec=MT:CreateSection("Auto Rebirth")
local ST=_W:CreateTab("Setting",4483362458)
local dd=MT:CreateDropdown({Name="Select Rebirth",Options={"+1 Rebirth","+5 Rebirth","+20 Rebirth","+50 Rebirth","+100 Rebirth","+250 Rebirth","+500 Rebirth","+1k Rebirth","+2.5k Rebirth","+5k Rebirth","+10k Rebirth","+25k Rebirth","+50k Rebirth","+100k Rebirth","+250k Rebirth","+500k Rebirth","+1M Rebirth","+2.5M Rebirth","+10M Rebirth","+25M Rebirth","+100M Rebirth","+1B Rebirth","+50B Rebirth","+500B Rebirth","+1T Rebirth","+100T Rebirth","+1Qd Rebirth","+50Qd Rebirth","+500Qd Rebirth","+2.5Qn Rebirth","+50Qn Rebirth","+500Qn Rebirth","+5Sx Rebirth","+100Sx Rebirth","+1Sp Rebirth","+50Sp Rebirth"},CurrentOption={"+1 Rebirth"},MultipleOptions=false,Flag="Dropdown1",Callback=function(o) local s= typeof(o)=="table" and o[1] or o; sr=R[s] end})
local tog=MT:CreateToggle({Name="Auto Rebirth Selected",CurrentValue=false,Callback=function(v) ir=v; spawn(function() while ir do if not sr then print("เลือกจำนวน Rebirth ก่อน") break end local a={"Rebirth",tonumber(sr)} game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction:InvokeServer(unpack(a)) task.wait() end end) end})
MT:CreateSection("Auto Claim")
MT:CreateToggle({Name="Auto Claim Chests",CurrentValue=false,Callback=function(v) aC=v; spawn(function() while aC do fDaily(); fGroup(); task.wait() end end) end})
MT:CreateToggle({Name="Claim All Code",CurrentValue=false,Callback=function(v) cC=v; if cC then f2(); f3(); f4(); f5() end end})
MT:CreateSection("Change Speed")
MT:CreateSlider({Name="Mining Speed",Range={1,10},Increment=1,Suffix="x",CurrentValue=1,Callback=function(val) local s=game:GetService("ReplicatedStorage").Stats:FindFirstChild(pl.Name); if s and s:FindFirstChild("MiningSpeedBoost") then s.MiningSpeedBoost.Value=val end end})
MT:CreateSlider({Name="Hatch Speed",Range={1,7},Increment=1,Suffix="x",CurrentValue=1,Callback=function(val) local s=game:GetService("ReplicatedStorage").Stats:FindFirstChild(pl.Name); if s and s:FindFirstChild("EggStats") and s.EggStats:FindFirstChild("HatchSpeed") then s.EggStats.HatchSpeed.Value=val end end})
ST:CreateSection("Change Theme")
ST:CreateDropdown({Name="Select Theme",Options={"Default","Amethyst","Bloom","Green","Light","Ocean","Serenity"},CurrentOption={"Default"},MultipleOptions=false,Callback=function(opt) _W.ModifyTheme(opt[1] or opt) end})
ST:CreateSection("Close Ui")
ST:CreateButton({Name="Destroy Gui",Callback=function() _R:Destroy() end})
local vu=game:GetService("VirtualUser")
pl.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame); task.wait(1); vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)
_W:LoadConfiguration()
end
]=])()
