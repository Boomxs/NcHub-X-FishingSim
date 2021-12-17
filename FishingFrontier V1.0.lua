local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boomxs/NcHub/main/B1.lua"))()
local venyx = library.new("NC HUB", 5012544693)

local prevLocation
local KS = false
local KO = false
local AS = false
local inputService = game:GetService("UserInputService")
local boundSpace = game.Workspace.IgnoredByMouse
local playerList = game:GetService("Players")
local plr = playerList.LocalPlayer
local hrp = plr.Character.HumanoidRootPart
local mse = plr:GetMouse()
local lastLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local LocalPlayer = game:GetService("Players").LocalPlayer

local page1 = venyx:addPage("General", 5012544693)
local page2 = venyx:addPage("Teleport", 5012544693)
local page3 = venyx:addPage("Boat Option", 5012544693)
local page4 = venyx:addPage("Credit", 5012544693)
local Section1 = page2:addSection("Teleport Player")
local Section3 = page2:addSection("Teleport")
local Section7 = page1:addSection("Auto Farm")
local Section2 = page1:addSection("Speed Option")
local Section4 = page1:addSection("Jump Option")
local Section5 = page1:addSection("Other Option")
local Section8 = page3:addSection("Boat Setting")
local Section6 = page4:addSection("This Script Create By BooomXs Or Nc_Dev")


players = {}
 
for i,v in pairs(game:GetService("Players"):GetChildren()) do
   table.insert(players,v.Name)
end
 
Section1:addDropdown("Select Player", players, function(Tpp)
    Select = Tpp
end)

Section5:addKeybind("Ui Visible", Enum.KeyCode.RightControl, function()
venyx:toggle()
end, function()
end)
 
 
Section1:addButton("Refresh", function()
    table.clear(players)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
       table.insert(players,v.Name)
    end
end)

Section1:addButton("Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Select].Character.HumanoidRootPart.CFrame
end)

Section5:addTextbox("Money", "Input Here", function(mgg)
	game:GetService("Players").LocalPlayer.LocalData.Coins.Value = mgg
end)

Section5:addTextbox("Level", "Input Here", function(Lvg)
	game:GetService("Players").LocalPlayer.LocalData.Level.Value = Lvg
end)

Section5:addButton("Give Gilberts Key", function()
    game.ReplicatedStorage.CloudClientResources.Communication.Events.GiveGillbertsKey:FireServer()
end)

Section7:addToggle("KillShark", false, function(KSS)
    if KSS then
        KS = true
        while KS == true do
            Wait(1)
            for i, v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "GreatWhiteShark" then
                prevLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    if game.Players.LocalPlayer.Character.Humanoid.Sit then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                    wait(0.25)
                    game.ReplicatedStorage.CloudClientResources.Communication.Events.DamageSeaMonster:FireServer(v, v.Health, true)
                    wait(0.5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = prevLocation
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16.603273391724, 52.020401000977, -33.084373474121)
                    break
                elseif game.Players.LocalPlayer:FindFirstChild("Backpack") then
                    for p, q in pairs(game.Players.LocalPlayer:FindFirstChild("Backpack"):GetChildren()) do
                        if q:FindFirstChild("Damage") then
                            q.Parent = game.Players.LocalPlayer.Character
                        end
                    end
                end
            end
        end
	end
    else
        KS = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16.603273391724, 52.020401000977, -33.084373474121)
    end
end)

Section7:addToggle("KillOrca", false, function(KOO)
    if KOO then
        KO = true
        while KO == true do
            Wait(1)
            for i, v in pairs(game.Workspace:GetChildren()) do
			if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "KillerWhale" then
				prevLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
					if game.Players.LocalPlayer.Character.Humanoid.Sit then
						game.Players.LocalPlayer.Character.Humanoid.Sit = false
					end
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
					wait(0.25)
					game.ReplicatedStorage.CloudClientResources.Communication.Events.DamageSeaMonster:FireServer(v, v.Health, true)
					wait(0.5)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = prevLocation
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16.603273391724, 52.020401000977, -33.084373474121)
					break
				elseif game.Players.LocalPlayer:FindFirstChild("Backpack") then
					for p, q in pairs(game.Players.LocalPlayer:FindFirstChild("Backpack"):GetChildren()) do
						if q:FindFirstChild("Damage") then
							q.Parent = game.Players.LocalPlayer.Character
						end
					end
				end
			end
		end
	end
    else
        KO = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16.603273391724, 52.020401000977, -33.084373474121)
    end
end)

Section7:addToggle("AutoSell (For KillShark)", false, function(ASS)
    if ASS then
        AS = true
        while AS == true do
            game.ReplicatedStorage.CloudClientResources.Communication.Functions.SellEverything:InvokeServer()
        end
    else
        AS = false
    end
end)

Section7:addButton("GamePass All", function()
    for i, v in pairs(playerList.LocalPlayer.LocalData.Gamepasses:GetChildren()) do
		v.Value = not v.Value
	end
end)

Section7:addButton("Sell All", function()
    game.ReplicatedStorage.CloudClientResources.Communication.Functions.SellEverything:InvokeServer()
end)

Section7:addButton("Teleport to Sunken Ship", function()
    for i, v in pairs(game.Workspace:GetChildren()) do
			if string.find(v.Name, "ShipModel") then
				local newFrame = v.HitBox.CFrame
				lastLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				if game.Players.LocalPlayer.Character.Humanoid.Sit then
					game.Players.LocalPlayer.Character.Humanoid.Sit = false
				end
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = newFrame
				return
			end
		end
		return
end)


Section8:addSlider("Boat Speed", 0, 10, 500, function(new) -- 500 (MaxValue) | 0 (MinValue)
    for i, v in pairs(game.Workspace:GetChildren()) do 
		if v.Name == (game.Players.LocalPlayer.Name.."'s Boat") then
			v.Controller.VehicleSeat.MaxSpeed = tonumber(new)
			break
		end
	end
end)

Section8:addButton("Teleport to boat", function()
    for i, v in pairs(game.Workspace:GetChildren()) do 
		if v.Name == (game.Players.LocalPlayer.Name.."'s Boat") then
			lastLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			if game.Players.LocalPlayer.Character.Humanoid.Sit then
				game.Players.LocalPlayer.Character.Humanoid.Sit = false
			end
			wait()
			local coord = v.Controller.VehicleSeat.CFrame
			playerList.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(coord.x,coord.y + 3,coord.z)
			break
		end
	end
end)

Section2:addSlider("Speed Option", 0, 16, 500, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section4:addSlider("Jump Option", 0, 40, 500, function(s) -- 500 (MaxValue) | 0 (MinValue)      
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s  
end)


Section3:addButton("Port Jackson", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16.603273391724, 52.020401000977, -33.084373474121)
end)

Section3:addButton("Eruption Island", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2796.8173828125, 47.590042114258, 1481.6497802734)
end)

Section3:addButton("Shadow Isles", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2189.79932, 42.294281, -2260.20508)
end)

Section3:addButton("Ancient Shores", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2436.68359375, 44.32999420166, -1775.8912353516)
end)

Section3:addButton("Monster's Borough", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3200.25781, 41.6784821, 2732.46777)
end)

Section3:addButton("Pharaoh's Dunes", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4236.9545898438, 49.309257507324, 366.03695678711)
end)