local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boomxs/NcHub/main/Main"))()
local Window = Library.CreateLib("Nc Hub X Reunion TEam Fishsim V1.0", LightTheme)

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

local Tab1 = Window:NewTab("General")
local Tab2 = Window:NewTab("Teleport")
local Tab3 = Window:NewTab("Boat Option")
local Tab4 = Window:NewTab("Credit")
local Section1 = Tab2:NewSection("Teleport Player")
local Section3 = Tab2:NewSection("Teleport")
local Section7 = Tab1:NewSection("Auto Farm")
local Section2 = Tab1:NewSection("Speed Option")
local Section4 = Tab1:NewSection("Jump Option")
local Section5 = Tab1:NewSection("Other Option")
local Section8 = Tab3:NewSection("Boat Setting")
local Section6 = Tab4:NewSection("This Script Create By BooomXs Or Nc_Dev")


players = {}
 
for i,v in pairs(game:GetService("Players"):GetChildren()) do
   table.insert(players,v.Name)
end
 
Section1:NewDropdown("Select Player", " ", players, function(Tpp)
    Select = Tpp
end)
 
 
Section1:NewButton("Refresh", " ", function()
    table.clear(players)
for i,v in pairs(game:GetService("Players"):GetChildren()) do
   table.insert(players,v.Name)
end
end)

Section1:NewButton("Teleport", " ", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Select].Character.HumanoidRootPart.CFrame
end)

Section5:NewTextBox("Money", "Give Money", function(mgg)
	game:GetService("Players").LocalPlayer.LocalData.Coins.Value = mgg
end)

Section5:NewTextBox("Level", "Give Level", function(Lvg)
	game:GetService("Players").LocalPlayer.LocalData.Level.Value = Lvg
end)

Section5:NewButton("Give Gilberts Key", "Give Gilberts Key", function()
    game.ReplicatedStorage.CloudClientResources.Communication.Events.GiveGillbertsKey:FireServer()
end)

Section7:NewToggle("KillShark", "KillShark", function(KSS)
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
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-52.98069, 54.567421, -20.777195)
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
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-52.98069, 54.567421, -20.777195)
    end
end)

Section7:NewToggle("KillOrca", "KillOrca", function(KOO)
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
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-52.98069, 54.567421, -20.777195)
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
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-52.98069, 54.567421, -20.777195)
    end
end)

Section7:NewToggle("AutoSell (For KillShark)", "AutoSell", function(ASS)
    if ASS then
        AS = true
        while AS == true do
            game.ReplicatedStorage.CloudClientResources.Communication.Functions.SellEverything:InvokeServer()
        end
    else
        AS = false
    end
end)

Section7:NewButton("GamePass All", "GamePass All", function()
    for i, v in pairs(plr.LocalData.Gamepasses:GetChildren()) do
		v.Value = not v.Value
	end
end)

Section7:NewButton("Sell All", "Sell All", function()
    game.ReplicatedStorage.CloudClientResources.Communication.Functions.SellEverything:InvokeServer()
end)

Section7:NewButton("Teleport to Sunken Ship", "Teleport to Sunken Ship", function()
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


Section8:NewSlider("Boat Speed", "Select Speed", 500, 0, function(new) -- 500 (MaxValue) | 0 (MinValue)
    for i, v in pairs(game.Workspace:GetChildren()) do 
		if v.Name == (game.Players.LocalPlayer.Name.."'s Boat") then
			v.Controller.VehicleSeat.MaxSpeed = tonumber(new)
			break
		end
	end
end)

Section8:NewButton("Teleport to boat", "Teleport to boat", function()
    for i, v in pairs(game.Workspace:GetChildren()) do 
		if v.Name == (game.Players.LocalPlayer.Name.."'s Boat") then
			lastLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			if game.Players.LocalPlayer.Character.Humanoid.Sit then
				game.Players.LocalPlayer.Character.Humanoid.Sit = false
			end
			wait()
			local coord = v.Controller.VehicleSeat.CFrame
			hrp.CFrame = CFrame.new(coord.x,coord.y + 3,coord.z)
			break
		end
	end
end)

Section2:NewSlider("Speed Option", "Select Speed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section2:NewButton("Reset Speed", "Reset Speed", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

Section4:NewSlider("Jump Option", "Select JumpPower", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)      
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s  
end)
Section4:NewButton("Reset Speed", "Reset JumpPower", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 40
end)


Section3:NewButton("Port Jackson", "Teleport to Port Jackson", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(56.7393608, 41.4751053, -63.380661)
end)

Section3:NewButton("Volcano Island", "Teleport to Volcano Island", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2815.75854, 41.5044899, 1470.11658)
end)

Section3:NewButton("Shadow Isles", "Teleport to Shadow Isles", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2189.79932, 42.294281, -2260.20508)
end)

Section3:NewButton("Ancient Shores", "Teleport to Ancient Shores", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2244.64795, 42.2645645, -1716.90173)
end)

Section3:NewButton("Monster's Borough", "Teleport to Monster's Borough", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3200.25781, 41.6784821, 2732.46777)
end)

