loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local marketplaceService = game:GetService("MarketplaceService")
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)

_G.Noclip = false
_G.InfJump = false

if game.PlaceId ~= 13864667823 then
	if game.PlaceId == 14775231477 or game.PlaceId == 13864661000 then	
		local Main = Library:Init({
			name = "Break In 2 (Lobby)"
		})
		
		local Tab = Main:CreateTab({
			name = "Player",
			icon = "rbxassetid://15101013637"
		})
		
		Tab:Section({
			text = "Player"
		})
		
		local Slider = Tab:Slider({
			name = "Walk Speed",
			minimum = 1,
			maximum = 1000,
			default = 16,
			valuename = "walkspeed",
			gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
			callback = function(Value)
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Value)
			end
		})
		
		local Slider = Tab:Slider({
			name = "Jump Power",
			minimum = 1,
			maximum = 1000,
			default = 50,
			valuename = "jumppower",
			gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
			callback = function(Value)
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(Value)
			end
		})
		
		local Toggle = Tab:Toggle({
			name = "Noclip",
			callback = function(Value)
				_G.Noclip = Value
				local temp
				temp = game:GetService("RunService").Heartbeat:connect(function()
					if _G.Noclip then
						for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
							if v:IsA("BasePart") then
								v.CanCollide = false
							end
						end
					else
						temp:Disconnect()
						for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
							if v.Name == "LowerTorso" or v.Name == "UpperTorso" then
								v.CanCollide = true
							end
						end
					end
				end)
			end
		})
		
		local Toggle = Tab:Toggle({
			name = "Infinite Jump",
			callback = function(Value)
				_G.InfJump = Value
				local InfJumpFunc
				game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
				InfJumpFunc = game:GetService("UserInputService").JumpRequest:Connect(function()
					if _G.InfJump == true then
						game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
					else
						InfJumpFunc:Disconnect()
					end
				end)
			end
		})
		
		local Tab = Main:CreateTab({
			name = "Roles",
			icon = "rbxassetid://15101013637"
		})
		
		Tab:Section({
			text = "Free Roles"
		})
		
		local Button = Tab:Button({
			name = "Hyper Role",
			callback = (function()
				game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("Lollipop", false, false)
			end)
		})
		
		local Button = Tab:Button({
			name = "Sporty Role",
			callback = (function()
				game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("Bottle", false, false)
			end)
		})
		
		local Button = Tab:Button({
			name = "Medic Role",
			callback = (function()
				game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("MedKit", false, false)
			end)
		})
		
		local Button = Tab:Button({
			name = "Protector Role",
			callback = (function()
				game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("Bat", false, false)
			end)
		})
		
		Tab:Section({
			text = "Gamepass Roles"
		})
		
		local Button = Tab:Button({
			name = "Hacker Role",
			callback = (function()
				game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Phone", true, false)
			end)
		})
		
		local Button = Tab:Button({
			name = "Nerd Role",
			callback = (function()
				game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Book", true, false)
			end)
		})
	end
else
	local SecretEndingTable = {
		"HatCollected",
		"MaskCollected",
		"CrowbarCollected"
	}

	-- Items
	local ItemsTable = {
		"Apple",
		"Armor",
		"Bat",
		"Battery",
		"Bloxy Cola",
		"Book",
		"Bottle",
		"Broom",
		"Chips",
		"Cookie",
		"Crowbar",
		"Golden Crowbar",
		"Diamond Crowbar",
		"Expired Bloxy Cola",
		"Gold Key",
		"Gold Pizza",
		"Golden Apple",
		"Hammer",
		"Key",
		"Ladder",
		"Lollipop",
		"Louise",
		"Med Kit",
		"Phone",
		"Pitchfork",
		"Pizza",
		"Rainbow Pizza Box",
		"Rainbow Pizza",
		"Wrench",
	}

	-- Local Modules
	local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
	local SelectedItem = "Med Kit"
	local Damange = 5
	local namecall
	local ScriptLoaded = false
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Lighting = game:GetService("Lighting")
	local OriginalWalkspeed = LocalPlayer.Character.Humanoid.WalkSpeed
	local OriginalJumpPower = LocalPlayer.Character.Humanoid.JumpPower
	local ModifiedWalkspeed = 50
	local ModifiedJumpPower = 100
	local OriginalBrightness = Lighting.Brightness
	local OriginalFog = Lighting.FogEnd
	local OriginalShadow = Lighting.GlobalShadows
	
	_G.RemoveSlipping = false
	_G.SemiGodmode = false
	_G.WalkSpeedOn = false
	_G.JumpPowerOn = false
	_G.PlayersESP = false
	_G.HiddenItemsESP = false
	
	local Part = Instance.new("Part")
	Part.Size = Vector3.new(5, 1, 5)
	Part.Parent = game:GetService("Workspace")
	Part.Anchored = true
	Part.Transparency = 1
	
	local function tpNpc(Npc, NpcPos)
		if Npc:FindFirstChild("HumanoidRootPart") then
			if Npc.HumanoidRootPart:FindFirstChild("Hold") then
				Npc.HumanoidRootPart.Hold:Destroy()
			end
			if Npc.HumanoidRootPart:FindFirstChild("Turn") then
				Npc.HumanoidRootPart.Turn:Destroy()
			end
			if Npc.HumanoidRootPart:FindFirstChild("BodyPosition") then
				Npc.HumanoidRootPart.BodyPosition:Destroy()
			end
			for i,v in pairs(Npc:GetChildren()) do
				if (v.ClassName == "MeshPart" or v.ClassName == "Part") and v.CanCollide == true then
					v.CanCollide = false
				end
			end
			if not Npc.HumanoidRootPart:FindFirstChild("MyForceInstance") then
				local ForceInstance = Instance.new("BodyPosition")
				ForceInstance.Name = "MyForceInstance"
				ForceInstance.P = 1000000
				ForceInstance.Parent = Npc.HumanoidRootPart
				ForceInstance.MaxForce = Vector3.new(2500000, 2500000, 2500000)
			end
			Npc.HumanoidRootPart.MyForceInstance.Position = NpcPos
		end
	end
	
	local function GiveItem(Item)
		if Item == "Armor" then
			Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(LocalPlayer), 1)
		else
			Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
		end
	end
	local function EquipAllTools()
		for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Character
			end
		end
	end
	local function UnequipAllTools()
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Backpack
			end
		end
	end
	local function Train(Ability)
		Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
	end
	local function TakeDamange(Amount)
		Events:WaitForChild("Energy"):FireServer(-Amount, false, false)
	end
	local function TeleportTo(CFrameArg)
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameArg
	end
	local function HealAllPlayers()
		UnequipAllTools()
		task.wait(.2)
		GiveItem("Golden Apple")
		task.wait(.5)
		LocalPlayer.Backpack:WaitForChild("GoldenApple").Parent = LocalPlayer.Character
		task.wait(.5)
		Events:WaitForChild("HealTheNoobs"):FireServer()
	end
	local function HealYourself()
		GiveItem("Pizza")
		Events.Energy:FireServer(25, "Pizza")
	end
	local function BreakBarricades()
		for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
			for i = 1, 20 do
				if v:FindFirstChild("TreeHitPart") then
					Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
				end
			end
		end
	end
	local function BreakEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
		end)
	end
	local function KillEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 100, 4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 996)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 100, 4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 100, 4)
			end
			if game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true) then
				Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true), 64.8, 4)
			end
			if game:GetService("Workspace"):FindFirstChild("BadGuyBrute") then
				Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace").BadGuyBrute, 64.8, 4)
			end
		end)
	end

	local function GetDog()
		for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
			if v.Name:match("Circle") and v.Visible == true then
				GiveItem(tostring(v.Name:gsub("Circle", "")))
				task.wait(.1)
				LocalPlayer.Backpack:WaitForChild(tostring(v.Name:gsub("Circle", ""))).Parent = LocalPlayer.Character
				TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
				task.wait(.5)
				Events:WaitForChild("CatFed"):FireServer(tostring(v.Name:gsub("Circle", "")))
			end
		end
		task.wait(2)
		for i = 1, 3 do
			TeleportTo(CFrame.new(-203.533081, 30.4500484, -790.901428, -0.0148558766, 8.85941187e-09, -0.999889672, 2.65695732e-08, 1, 8.46563175e-09, 0.999889672, -2.64408779e-08, -0.0148558766) + Vector3.new(0, 5, 0))
			task.wait(.1)
		end
	end

	local function GetAgent()
		GiveItem("Louise")
		task.wait(.1)
		LocalPlayer.Backpack:WaitForChild("Louise").Parent = LocalPlayer.Character
		Events:WaitForChild("LouiseGive"):FireServer(2)
	end

	local function GetUncle()
		GiveItem("Key")
		task.wait(.1)
		LocalPlayer.Backpack:WaitForChild("Key").Parent = LocalPlayer.Character
		wait(.5)
		Events.KeyEvent:FireServer()
	end
	local function ClickPete()
		fireclickdetector(game:GetService("Workspace").UnclePete.ClickDetector)
	end
	local function CollectCash()
		for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			if v.Name == "Part" and v:FindFirstChild("TouchInterest") and v:FindFirstChild("Weld") and v.Transparency == 1 then
				firetouchinterest(v, LocalPlayer.Character.HumanoidRootPart, 0)
			end
		end
	end
	local function GetAllOutsideItems()
		TeleportTo(CFrame.new(-199.240555, 30.0009422, -790.182739, 0.08340507, 2.48169538e-08, 0.996515751, -2.7112752e-09, 1, -2.46767993e-08, -0.996515751, -6.43658127e-10, 0.08340507))
		for i, v in pairs(game:GetService("Workspace").OutsideParts:GetChildren()) do
			fireclickdetector(v.ClickDetector)
		end
		LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(-10, 0, 0))
	end
	local function BringAllEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end

			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
		end)
	end
	local function GetSecretEnding()
		for i, v in next, SecretEndingTable do
			Events.LarryEndingEvent:FireServer(v, true)
		end
	end

	local function GetGAppleBadge()
		for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
			for i = 1, 20 do
				if v:FindFirstChild("TreeHitPart") then
					Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
				end
			end
		end
		task.wait(1)

		TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
		task.wait(.5)
		fireclickdetector(game:GetService("Workspace").GoldenApple.ClickDetector)
	end

	local function AntiMud(Touchable)
		for i, v in pairs(game:GetService("Workspace").BogArea.Bog:GetDescendants()) do
			if v.Name == "Mud" and v:IsA("Part") then
				if Touchable == true then
					v.CanTouch = false
				else 
					v.CanTouch = false
				end
			end
		end
	end
	local function AntiWind()
		if game:GetService("Workspace"):FindFirstChild("WavePart") then
			game:GetService("Workspace").WavePart.CanTouch = false
		end
	end
	
	local Main = Library:Init({
		name = "Break In 2 (Main Game)"
	})
	
	local Tab = Main:CreateTab({
		name = "Player",
		icon = "rbxassetid://15101013637"
	})
	
	Tab:Section({
		text = "Player"
	})
	
	local Slider = Tab:Slider({
		name = "Walk Speed",
		minimum = 1,
		maximum = 1000,
		default = game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed,
		valuename = "walkspeed",
		gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
		callback = function(Value)
			ModifiedWalkspeed = Value
		end
	})
	
	local Toggle = Tab:Toggle({
		name = "Enable Walk Speed",
		callback = function(Value)
			_G.WalkSpeedOn = Value
			local temp
			temp = game:GetService("RunService").Stepped:connect(function()
				if _G.WalkSpeedOn == true then
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ModifiedWalkspeed
				else
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
					temp:Disconnect()
				end
			end)
		end
	})
	
	local Slider = Tab:Slider({
		name = "Jump Power",
		minimum = 1,
		maximum = 1000,
		default = game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower,
		valuename = "jumppower",
		gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
		callback = function(Value)

		end
	})
	
	local Toggle = Tab:Toggle({
		name = "Enable Jump Power",
		callback = function(Value)
			_G.JumpPowerOn = Value
			local temp
			temp = game:GetService("RunService").Stepped:connect(function()
				if _G.JumpPowerOn == true then
					game.Players.LocalPlayer.Character.Humanoid.JumpPower = ModifiedJumpPower
					game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = Value
				else
					game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
					temp:Disconnect()
				end
			end)
		end
	})
	
	local Toggle = Tab:Toggle({
		name = "Noclip",
		callback = function(Value)
			_G.Noclip = Value
			local temp
			temp = game:GetService("RunService").Heartbeat:connect(function()
				if _G.Noclip then
					for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
				else
					temp:Disconnect()
					for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.Name == "LowerTorso" or v.Name == "UpperTorso" then
							v.CanCollide = true
						end
					end
				end
			end)
		end
	})
	
	local Toggle = Tab:Toggle({
		name = "Infinite Jump",
		callback = function(Value)
			_G.InfJump = Value
			local InfJumpFunc
			game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
			InfJumpFunc = game:GetService("UserInputService").JumpRequest:Connect(function()
				if _G.InfJump == true then
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
				else
					InfJumpFunc:Disconnect()
				end
			end)
		end
	})
	
	local Toggle = Tab:Toggle({
		name = "Players ESP",
		callback = function(Value)
			_G.PlayersESP = Value
			if _G.PlayersESP then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v.Name ~= game.Players.LocalPlayer.Name then
						local NewHighlight = Instance.new("Highlight", v.Character)
						NewHighlight.FillColor = Color3.fromRGB(255, 255, 255)
						NewHighlight.FillTransparency = 0.25
						NewHighlight.OutlineTransparency = 0.25
						NewHighlight.OutlineColor = Color3.fromRGB(0, 0, 0)
					end
				end
			else
				for i,v in pairs(game.Players:GetPlayers()) do
					if v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("Hihglight") then
						v.Highlight:Destroy()
					end
				end
			end
		end
	})
	
	local Toggle = Tab:Toggle({
		name = "Hidden Items ESP",
		callback = function(Value)
			_G.HiddenItemsESP = Value
			if _G.HiddenItemsESP then
				for i, v in pairs(game:GetService("Workspace").Hidden:GetChildren()) do
					local highlight = Instance.new("Highlight", v)
					highlight.FillColor = Color3.fromRGB(255, 0, 255)
					highlight.FillTransparency = 0
					highlight.OutlineTransparency = 0
					highlight.OutlineColor = Color3.fromRGB(0, 0, 255)
				end
			else
				for i, v in pairs(game:GetService("Workspace").Hidden:GetChildren()) do
					if v:FindFirstChild("Highlight") then
						v.Highlight:Destroy()
					end
				end
			end
		end
	})
	
	local Tab = Main:CreateTab({
		name = "Game",
		icon = "rbxassetid://15101013637"
	})
	
	Tab:Section({
		text = "Stats"
	})
	
	local Button = Tab:Button({
		name = "Get +1 Strength",
		callback = (function()
			Train("Strength")
		end)
	})
	
	local Button = Tab:Button({
		name = "Get +1 Speed",
		callback = (function()
			Train("Speed")
		end)
	})
	
	Tab:Section({
		text = "Items"
	})
	
	local Dropdown = Tab:Dropdown({
		name = "Get Item",
		callback = function(Name, Value)
			local GiveCrowbar = game:GetService("ReplicatedStorage").Events.GiveCrowbar
			local Vending = game:GetService("ReplicatedStorage").Events.Vending
			
			if Name == "Crowbar" then
				GiveCrowbar:FireServer(workspace.TheHouse.Rack)
			elseif Name == "Golden Crowbar" then
				Vending:FireServer(3, "Crowbar2", "Weapons", game.Players.LocalPlayer.Name, nil, 1)
			elseif Name == "Diamond Crowbar" then
				Vending:FireServer(3, "Crowbar3", "Weapons", game.Players.LocalPlayer.Name, nil, 4)
			elseif Name == "Bat" then
				Vending:FireServer(3, "Bat", "Weapons", game.Players.LocalPlayer.Name, nil, 11)
			elseif Name == "Wrench" then
				Vending:FireServer(3, "Wrench", "Weapons", game.Players.LocalPlayer.Name, nil, 12)
			elseif Name == "Hammer" then
				Vending:FireServer(3, "Hammer", "Weapons", game.Players.LocalPlayer.Name, nil, 13)
			elseif Name == "Broom" then
				Vending:FireServer(3, "Broom", "Weapons", game.Players.LocalPlayer.Name, nil, 14)
			elseif Name == "Pitchfork" then
				Vending:FireServer(3, "Pitchfork", "Weapons", game.Players.LocalPlayer.Name, nil, 14)
			else
				GiveItem(Name)
			end
		end,
		opencallback = function()

		end,
	})
	
	for name, v in pairs(ItemsTable) do
		Dropdown:Add(name, nil)
	end
	
	local Toggle = Tab:Toggle({
		name = "Open a Backpack",
		callback = function(Value)
			game:GetService("CoreGui").RobloxGui.Backpack.Visible = true
			game:GetService("CoreGui").RobloxGui.Backpack.Hotbar.Visible = false
			game:GetService("CoreGui").RobloxGui.Backpack.Inventory.Visible = Value
		end
	})
	
	local Warning = Tab:Warning({
		name = "Items",
		text = "You can have only one weapon at a time. Some weapons you can get only once in the entire round"
	})
	
	Tab:Section({
		text = "Heal Players"
	})
	
	local Button = Tab:Button({
		name = "Heal Yourself",
		callback = (function()
			for i = 1, 10 do
				HealYourself()
			end
		end)
	})
	
	local Toggle = Tab:Toggle({
		name = "Loop Heal Yourself",
		callback = function(Value)
			_G.HealLoop = Value
			while _G.HealLoop do
				while game:GetService("Players").averylocalcheese.PlayerGui.EnergyBar.EnergyBar.EnergyBar.ImageLabel.NumberHolder.TextLabel.Text == "200/200" do
					task.wait()
				end
				HealYourself()
				task.wait(.1)
			end
		end
	})
	
	local Button = Tab:Button({
		name = "Button Name",
		callback = (function()
			HealAllPlayers()
		end)
	})
	
	local Toggle = Tab:Toggle({
		name = "Loop Heal All Players",
		callback = function(Value)
			_G.HealAllLoop = Value
			while _G.HealAllLoop do
				HealAllPlayers()
				task.wait(3)
			end
		end
	})
	
	Tab:Section({
		text = "Pick Up Cash"
	})
	
	local Button = Tab:Button({
		name = "Pick Up All Cash",
		callback = (function()
			CollectCash()
		end)
	})
	
	local Toggle = Tab:Toggle({
		name = "Auto Pick Up All Cash",
		callback = function(Value)
			_G.CollectAllCash = Value

			while _G.CollectAllCash do
				CollectCash()
				task.wait(1)
			end
		end	
	})
	
	local Tab = Main:CreateTab({
		name = "NPCs",
		icon = "rbxassetid://15101013637"
	})
	
	Tab:Section({
		text = "Hire NPCs"
	})
	
	local Button = Tab:Button({
		name = "Hire all NPCs",
		callback = (function()
			GetDog()
			task.wait(5)
			GetAgent()
			task.wait(1)
			GetUncle()
		end)
	})
	
	local Button = Tab:Button({
		name = "Hire Uncle Pete",
		callback = (function()
			GetUncle()
		end)
	})
	
	local Button = Tab:Button({
		name = "Hire Detective Bradley Beans",
		callback = (function()
			GetAgent()
		end)
	})
	
	local Button = Tab:Button({
		name = "Hire Twado the Dog",
		callback = (function()
			GetDog()
		end)
	})
	
	Tab:Section({
		text = "Throw NPCs to the Void (Press Only 1 Time)"
	})
	
	local Button = Tab:Button({
		name = "Throw Uncle Pete",
		callback = (function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.UnclePete.HumanoidRootPart.CFrame
			tpNpc(game.workspace.UnclePete, Vector3.new(2500000,-2500000,0))
		end)
	})
	
	local Button = Tab:Button({
		name = "Throw Detective Bradley Beans",
		callback = (function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.AgentBeans.HumanoidRootPart.CFrame
			tpNpc(game.workspace.AgentBeans, Vector3.new(2500000,-2500000,0))
		end)
	})
	
	local Button = Tab:Button({
		name = "Throw Twado the Dog",
		callback = (function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.TheHouse.SmallCat.HumanoidRootPart.CFrame
			tpNpc(game.workspace.TheHouse.SmallCat, Vector3.new(2500000,-2500000,0))
		end)
	})
	
	Tab:Section({
		text = "Enemies"
	})
	
	local Button = Tab:Button({
		name = "Bring Enemies",
		callback = (function()
			BringAllEnemies()
		end)
	})
	
	local Button = Tab:Button({
		name = "Break Enemies",
		callback = (function()
			BreakEnemies()
		end)
	})
	
	local Button = Tab:Button({
		name = "Kill Enemies",
		callback = (function()
			for i = 1, 10 do
				KillEnemies()
			end
		end)
	})
	
	local Toggle = Tab:Toggle({
		name = "Loop Kill Enemies",
		callback = function(Value)
			_G.KillAllLoop = Value
			while _G.KillAllLoop do
				KillEnemies()
				task.wait(0.05)
			end
		end
	})
	
	local Button = Tab:Button({
		name = "Remove Scary Mary",
		callback = (function()
			if game:GetService("Workspace"):FindFirstChild("Villainess") then
				game:GetService("Workspace").Villainess:Destroy()
			end
		end)
	})
	
	local Button = Tab:Button({
		name = "Remove Scary Larry",
		callback = (function()
			if game:GetService("Workspace"):FindFirstChild("BigBoss") then
				game:GetService("Workspace").BigBoss:Destroy()
			end
		end)
	})
	
	local Tab = Main:CreateTab({
		name = "Teleports",
		icon = "rbxassetid://15101013637"
	})
	
	Tab:Section({
		text = "Areas"
	})
	
	local Button = Tab:Button({
		name = "Kitchen",
		callback = (function()
			TeleportTo(CFrame.new(-249.753555, 30.4500484, -732.703125, -0.999205947, -1.97705017e-08, 0.0398429185, -2.00601384e-08, 1, -6.86967372e-09, -0.0398429185, -7.66347341e-09, -0.999205947))
		end)
	})
	
	
	local Button = Tab:Button({
		name = "Fight Arena",
		callback = (function()
			TeleportTo(CFrame.new(-255.521988, 62.7139359, -723.436035, -0.0542500541, 4.28905356e-09, -0.998527408, 1.07862625e-08, 1, 3.70936082e-09, 0.998527408, -1.05691456e-08, -0.0542500541))
		end)
	})
	
	local Button = Tab:Button({
		name = "Gym",
		callback = (function()
			TeleportTo(CFrame.new(-256.477448, 63.4500465, -840.825562, 0.999789953, 2.17116263e-08, 0.020495005, -2.15169358e-08, 1, -9.7199333e-09, -0.020495005, 9.27690191e-09, 0.999789953))
		end)
	})
	
	local Button = Tab:Button({
		name = "Middle Room",
		callback = (function()
			TeleportTo(CFrame.new(-209.951859, 30.4590473, -789.723877, -0.0485812724, 6.74905039e-08, 0.998819232, 1.19352916e-09, 1, -6.75122394e-08, -0.998819232, -2.08771045e-09, -0.0485812724))
		end)
	})
	
	local Button = Tab:Button({
		name = "Shop",
		callback = (function()
			TeleportTo(CFrame.new(-246.653229, 30.4500484, -847.319275, 0.999987781, -9.18427645e-08, -0.00494772941, 9.19905787e-08, 1, 2.96483353e-08, 0.00494772941, -3.01031164e-08, 0.999987781))
		end)
	})
	
	local Button = Tab:Button({
		name = "Boss Fight Area",
		callback = (function()
			TeleportTo(CFrame.new(-1565.78772, -368.711945, -1040.66626, 0.0929690823, -1.97564436e-08, 0.995669007, -1.53269308e-08, 1, 2.1273511e-08, -0.995669007, -1.72383299e-08, 0.0929690823))
		end)
	})
	
	local Button = Tab:Button({
		name = "Fighting Pillar",
		callback = (function()
			TeleportTo(CFrame.new(-1501.49597, -325.156891, -1060.63367, -0.691015959, 7.43958628e-09, 0.722839475, -5.03345055e-09, 1, -1.51040194e-08, -0.722839475, -1.40754954e-08, -0.691015959))
		end)
	})
	
	local Button = Tab:Button({
		name = "Experiment Room",
		callback = (function()
			TeleportTo(game:GetService("Workspace").Final.Factory.RedDesk.Drawer:GetChildren()[2].CFrame + Vector3.new(20, 0, 0))
		end)	
	})
	
	local Button = Tab:Button({
		name = "Cafeteria",
		callback = (function()
			TeleportTo(game:GetService("Workspace").Final.Factory:FindFirstChild("Legs", true).CFrame)
		end)
	})
	
	Tab:Section({
		text = "Items"
	})
	
	local Button = Tab:Button({
		name = "Feeding Instructions",
		callback = (function()
			TeleportTo(CFrame.new(-207.885056, 60.4500465, -830.583557, 0.118373089, 3.89876789e-08, -0.992969215, 3.47791551e-09, 1, 3.96783406e-08, 0.992969215, -8.15031065e-09, 0.118373089))
		end)
	})
	
	local Button = Tab:Button({
		name = "Golden Apple",
		callback = (function()
			TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
		end)
	})
	
	local Button = Tab:Button({
		name = "Rainbow Pizza",
		callback = (function()
			TeleportTo(game:GetService("Workspace").RainbowPizzaBox.CFrame + Vector3.new(0,3,0))
		end)
	})
	
	local Button = Tab:Button({
		name = "Loot",
		callback = (function()
			TeleportTo(game:GetService("Workspace").OutsideParts:FindFirstChildWhichIsA("Part", true).CFrame + Vector3.new(10, 0, 0))
		end)
	})
	
	local Button = Tab:Button({
		name = "Golden Crowbar",
		callback = (function()
			TeleportTo(CFrame.new(-147.337204, 29.4477005, -929.365295, 0.756779075, 4.53537341e-09, -0.653670728, 5.82708326e-09, 1, 1.36845468e-08, 0.653670728, -1.4165173e-08, 0.756779075))
		end)
	})
	
	local Button = Tab:Button({
		name = "Purple Mask",
		callback = (function()
			TeleportTo(CFrame.new(102.560722, 29.2477055, -976.389954, -0.951403797, 3.76210636e-08, -0.307946175, 1.89752569e-08, 1, 6.35433466e-08, 0.307946175, 5.46120233e-08, -0.951403797))
		end)
	})
	
	Tab:Section({
		text = "NPCs"
	})
	
	local Button = Tab:Button({
		name = "Uncle Pete",
		callback = (function()
			TeleportTo(CFrame.new(-294.208923, 63.4182587, -737.712036, -0.998669028, -7.34403613e-08, -0.05157727, -7.2258743e-08, 1, -2.47743781e-08, 0.05157727, -2.1014495e-08, -0.998669028))
		end)
	})
	
	local Button = Tab:Button({
		name = "Agent Bradly",
		callback = (function()
			TeleportTo(CFrame.new(-281.792053, 95.4500275, -790.556946, -0.116918251, -7.95074726e-08, -0.993141532, -2.79918044e-09, 1, -7.97270019e-08, 0.993141532, -6.54155974e-09, -0.116918251))
		end)
	})
	
	local Button = Tab:Button({
		name = "Dog",
		callback = (function()
			TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
		end)
	})
	
	local Button = Tab:Button({
		name = "Homeless Kid",
		callback = (function()
			TeleportTo(CFrame.new(-79.4871826, 29.4477024, -932.782715, -0.215949073, 3.18771427e-08, 0.976404607, -7.60385461e-08, 1, -4.94647345e-08, -0.976404607, -8.49262562e-08, -0.215949073))
		end)
	})
	
	local Tab = Main:CreateTab({
		name = "Misc",
		icon = "rbxassetid://15101013637"
	})
	
	Tab:Section({
		text = "Miscellaneous"
	})
	
	local Button = Tab:Button({
		name = "Unlock a Secret Ending",
		callback = (function()
			GetSecretEnding()
		end)	
	})
	
	local Toggle = Tab:Toggle({
		name = "Claim Quests Rewards",
		callback = function(Value)
			_G.AutoPete = Value

			while _G.AutoPete do
				ClickPete()
				task.wait(10)
			end
		end
	})
	
	local Button = Tab:Button({
		name = "Get Apple Badge",
		callback = (function()
			GetGAppleBadge()
		end)
	})
	
	local Button = Tab:Button({
		name = "Get Loot",
		callback = (function()
			GetAllOutsideItems()
		end)
	})
	
	local Toggle = Tab:Toggle({
		name = "Toggle Name",
		callback = function(Value)
			if Value == true then
				Lighting.Brightness = 1
				Lighting.FogEnd = 999999
				Lighting.GlobalShadows = false
				Lighting.ClockTime = 12
			else
				Lighting.Brightness = OriginalBrightness
				Lighting.FogEnd = OriginalFog
				Lighting.GlobalShadows = true
				Lighting.ClockTime = 9
			end
		end
	})
	
	Tab:Section({
		text = "Remove Game Objects"
	})
	
	local Toggle = Tab:Toggle({
		name = "Remove Mud",
		callback = function(Value)
			AntiMud(Value)
		end
	})
	
	local Toggle = Tab:Toggle({
		name = "Remove Wind",
		callback = function(Value)
			_G.NoWind = Value
			while _G.NoWind == true do
				AntiWind()
				task.wait(.5)
			end
		end
	})
end
