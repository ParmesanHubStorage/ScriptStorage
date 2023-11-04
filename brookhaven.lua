loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local Children = {"Baby Boy", "Baby Girl", "Baby Boy [Premium 1]", "Baby Boy [Premium 2]", "Baby Boy [Premium 3]", "Baby Girl [Premium 1]", "Baby Girl [Premium 2]", "Baby Girl [Premium 3]"}
local Houses = {"1 [Motel]", "2 [Motel]", "3 [Motel]", "4 [Motel]", "5 [Motel]", "6 [Apartment]", "7 [Apartment]", "11 [House]", "12 [House]", "13 [House]", "14 [House]", "15 [House]", "13 [House]", "14 [House]", "15 [House]", "16 [House]", "17 [House]", "18 [House]", "19 [House]", "20 [House]", "21 [House]", "22 [House]", "23 [House]", "24 [House]", "28 [Lake Side House]", "29 [Hidden Valley House]", "30 [Lake House]", "31 [Eagle View House]", "32 [Gold Ranch House]", "33 [North Estate]", "34 [South Estate]"}

_G.PlayersHighlightOn = false
_G.PlayersTracersOn = false
_G.CandyHighlightOn = false
_G.CandyTracersOn = false
_G.VehiclesHighlightOn = false

_G.CopyPlayerAvatarName = nil
_G.CopyPlayerIncludeWalkStyle = false
_G.IncludeWalkStyle = false
_G.RainbowName = false
_G.RainbowBio = false
_G.RainbowSkin = false
_G.LoopJobs = false
_G.RainbowHouseBio = false
_G.RainbowHouse = false
_G.AutoUnban = false

_G.SpamCurtains = false
_G.SpamGarage = false
_G.SpamComputer = false
_G.SpamLockHouse = false
_G.SpamBabyOption = false
_G.SpamDishwasher = false
_G.SpamCampfire = false
_G.SpamFridge = false
_G.SpamUnlock = false
_G.SpamHouseLight = false
_G.SpamMailBox = false
_G.SpamOven = false
_G.SpamSafe = false
_G.SpamSink = false
_G.SpamTV = false
_G.SpamPool = false

_G.SpamKnock = false
_G.SpamBell = false
_G.BellKnockTarget = nil

_G.RoomMateTarget = nil
_G.RoomMateHouseTarget = nil

_G.LoopBurnAvatar = false
_G.LoopSmokeAvatar = false

_G.TargetVehicle = nil
_G.RainbowCar = false
_G.RainbowBike = false
_G.SpamFire = false
_G.SpamDuke1 = false
_G.SpamDuke2 = false
_G.SpamTurbo = false
_G.SpamHorn = false
_G.SpamLight = false
_G.SpamHazard = false
_G.SpamHeight = false
_G.SpamWheel = false

_G.SpamShoot = false
_G.SpamShootAll = false

_G.RainbowNascarTruck = false
_G.RainbowNascarTruckPremium = false

_G.RainbowFoodTruck = false
_G.LoopFoodTruckWindow = false
_G.LoopFoodTruckDesign = false

_G.RainbowHorse = false

_G.RainbowSaddle = false
_G.RainbowHorseHair = false
_G.RainbowHorseBody = false

_G.DoorFling = nil

_G.RainbowSignText = false

_G.LoopCartFood = false

_G.LoopHelicopterDesign = false

_G.ChoosedSound = 0
_G.SpamSounds = false
_G.SpamSoundsSpeed = 1
_G.SpamFastSounds = false

_G.PlayerForKill = nil

_G.SpamChildren = false
_G.RainbowChildName = false

_G.Noclip = false
_G.InfJump = false
_G.FlyOn = false
_G.FlySpeed = 1

local function PlayersHighlight()
	for i,v in pairs(game.Players:GetChildren()) do
		pcall(function()
			if v ~= game.Players.LocalPlayer and not v.Character:FindFirstChild("Highlight") then
				local NewHighlight = Instance.new("Highlight")
				NewHighlight.Parent = v.Character
				NewHighlight.FillColor = Color3.fromRGB(255, 255, 255)
				NewHighlight.FillTransparency = 0.15
				NewHighlight.OutlineColor = Color3.fromRGB(0, 0, 0)
				NewHighlight.OutlineTransparency = 0.15
			end
		end)
	end
end

local function playersTracers()
	for i,v in pairs(game.Players:GetChildren()) do
		pcall(function()
			
			for a,b in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
				if b.ClassName == "Beam" and not game.Players:FindFirstChild(b.Name) then
					b:Destroy()
				end
			end

			if not v.Character.HumanoidRootPart:FindFirstChild("PlayerTracer") or not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(v.Name) then
				local one = nil
				local two = nil

				local NewBeam = Instance.new("Beam")
				NewBeam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
				NewBeam.Width0 = 0.05
				NewBeam.Width1 = 0.05
				NewBeam.Transparency = NumberSequence.new(0,0)
				NewBeam.Name = v.Name
				NewBeam.FaceCamera = true
				NewBeam.Color = ColorSequence.new(Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
				
				if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("LocalPlayerTracer") then
					one = Instance.new("Attachment", game.Players.LocalPlayer.Character.HumanoidRootPart)
					one.Name = "LocalPlayerTracer"
				else
					one = game.Players.LocalPlayer.Character.HumanoidRootPart.LocalPlayerTracer
				end
				
				if not v.Character.HumanoidRootPart:FindFirstChild("PlayerTracer") then
					two = Instance.new("Attachment", v.Character.HumanoidRootPart)
					two.Name = "PlayerTracer"
				else
					two = v.Character.HumanoidRootPart.PlayerTracer
				end

				NewBeam.Attachment0 = one
				NewBeam.Attachment1 = two
			end
		end)
	end    
end

local function tpNpc(Npc, NpcPos, Noclip)
	if Noclip == 1 then
		for i,v in pairs(Npc:GetDescendants()) do
			if (v.ClassName == "MeshPart" or v.ClassName == "Part" or v.ClassName == "Seat") and v.CanCollide == true then
				v.CanCollide = false
			end
		end
	end
	if not Npc:WaitForChild("Chassis"):FindFirstChild("MyForceInstance") then
		local ForceInstance = Instance.new("BodyPosition")
		ForceInstance.Parent = Npc:WaitForChild("Chassis").Platform
		ForceInstance.Name = "MyForceInstance"
		ForceInstance.P = 1000000
		ForceInstance.MaxForce = Vector3.new(2500000, 2500000, 2500000)
	end
	Npc:WaitForChild("Chassis").Platform.MyForceInstance.Position = NpcPos
end

local function AddAlignPosition(Part)
	
	local object = Part
	local NewAttach1 = nil
	
	Part.CanCollide = false
	local NewAlignPosition = Instance.new("AlignPosition", object)
	NewAlignPosition.MaxForce = 10000000272564224
	NewAlignPosition.MaxVelocity = 10000000272564224
	NewAlignPosition.Responsiveness = 200

	local NewAttach0 = Instance.new("Attachment", object)
	NewAttach0.Name = "AlignAttach0"
	
	if not game.Players.LocalPlayer.Character.Head:FindFirstChild("AlignAttach1") then
		NewAttach1 = Instance.new("Attachment", game.Players.LocalPlayer.Character.Head)
		NewAttach1.Name = "AlignAttach1"
	else
		NewAttach1 = game.Players.LocalPlayer.Character.Head.AlignAttach1
	end
	
	NewAlignPosition.Attachment0 = NewAttach0
	NewAlignPosition.Attachment1 = NewAttach1
end

local function AddTorque(Part)
	local object = Part
	local NewAttach3 = nil
	Part.CanCollide = false
	
	local NewAttach2 = Instance.new("Attachment", object)
	NewAttach2.Name = "TorqueAttach2"

	if not game.Players.LocalPlayer.Character.Head:FindFirstChild("TorqueAttach3") then
		NewAttach3 = Instance.new("Attachment", game.Players.LocalPlayer.Character.Head)
		NewAttach3.Name = "TorqueAttach3"
	else
		NewAttach3 = game.Players.LocalPlayer.Character.Head.TorqueAttach3
	end

	local Torque = Instance.new("Torque")
	Torque.Parent = object
	Torque.Torque = Vector3.new(100000, 100000, 100000)
	Torque.RelativeTo = "Attachment0"

	Torque.Attachment0 = NewAttach2
	Torque.Attachment1 = NewAttach3
end

local function ChangeAvatar(Avatar)
	local ohTable2 = {
		[1] = Avatar.Torso, --torso
		[2] = Avatar.RightArm, --right arm
		[3] = Avatar.LeftArm, --left arm
		[4] = Avatar.RightLeg, --right leg
		[5] = Avatar.LeftLeg, --left leg
		[6] = Avatar.Head
	}
	game:GetService("ReplicatedStorage").RE["1Avata1rOrigina1l"]:FireServer("CharacterChange", ohTable2, "")
end

local Main = Library:Init({
	name = "Brookhaven RP"
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
	valuename = "Walk Speed",
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
	valuename = "Jump Power",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(Value)
	end
})

local Slider = Tab:Slider({
	name = "Gravity",
	minimum = -1,
	maximum = 1000,
	default = 196,
	valuename = "Gravity",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		workspace.Gravity = tonumber(Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Noclip",
	callback = function(Value)
		_G.Noclip = Value
		if _G.Noclip == true then
			local temp
			temp = game:GetService("RunService").Stepped:connect(function()
				if _G.Noclip == true then
					for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
				else
					for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.Name == "LowerTorso" or v.Name == "UpperTorso" then
							v.CanCollide = true
						end
					end
					temp:Disconnect()
				end
			end)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Infinite Jump",
	callback = function(Value)
		_G.InfJump = Value
		local InfJumpFunc
		if InfJumpFunc then InfJumpFunc:Disconnect() end
		if _G.InfJump == true then
			while not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") do
				task.wait()
			end
			InfJumpFunc = game:GetService("UserInputService").JumpRequest:Connect(function()
				if _G.InfJump == true then
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
				end
			end)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Fly (PC Only, Press [F] Button to Toggle)",
	callback = function(Value)
		_G.FlyOn = Value
		local Max = 0
		local Players = game.Players
		local LP = Players.LocalPlayer
		local Mouse = LP:GetMouse()
		Mouse.KeyDown:connect(
			function(k)
				if k:lower() == "f" then
					Max = Max + 1
					_G.Fly = false
					if _G.FlyOn then
						local T = LP.Character.UpperTorso
						local S = {
							F = 0,
							B = 0,
							L = 0,
							R = 0
						}
						local S2 = {
							F = 0,
							B = 0,
							L = 0,
							R = 0
						}
						local SPEED = 500
						local function FLY()
							_G.Fly = true
							local BodyGyro = Instance.new("BodyGyro", T)
							local BodyVelocity = Instance.new("BodyVelocity", T)
							BodyGyro.P = 9e4
							BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
							BodyGyro.cframe = T.CFrame
							BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
							BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
							spawn(function()
								repeat
									game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Ragdoll")
									task.wait()
								until not _G.Fly
							end)
							spawn(
								function()
									repeat

										wait()
										if LP.Character:FindFirstChildOfClass("Humanoid") then LP.Character.Humanoid.PlatformStand = false end
										if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
											SPEED = _G.FlySpeed * 40
										elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
											SPEED = 0
										end
										if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
											BodyVelocity.velocity =
												((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
													((game.Workspace.CurrentCamera.CoordinateFrame *
														CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
														game.Workspace.CurrentCamera.CoordinateFrame.p)) *
												SPEED
											S2 = {
												F = S.F,
												B = S.B,
												L = S.L,
												R = S.R
											}
										elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
											BodyVelocity.velocity =
												((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
													((game.Workspace.CurrentCamera.CoordinateFrame *
														CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
														game.Workspace.CurrentCamera.CoordinateFrame.p)) *
												SPEED
										else
											BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
										end
										BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame
									until not _G.Fly
									S = {
										F = 0,
										B = 0,
										L = 0,
										R = 0
									}
									S2 = {
										F = 0,
										B = 0,
										L = 0,
										R = 0
									}
									SPEED = 0
									BodyGyro:destroy()
									BodyVelocity:destroy()
									LP.Character.Humanoid.PlatformStand = false
									game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("GettingUp")
								end
							)
						end
						Mouse.KeyDown:connect(
							function(k)
								if k:lower() == "w" then
									S.F = 1
								elseif k:lower() == "s" then
									S.B = -1
								elseif k:lower() == "a" then
									S.L = -1
								elseif k:lower() == "d" then
									S.R = 1
								end
							end
						)
						Mouse.KeyUp:connect(
							function(k)
								if k:lower() == "w" then
									S.F = 0
								elseif k:lower() == "s" then
									S.B = 0
								elseif k:lower() == "a" then
									S.L = 0
								elseif k:lower() == "d" then
									S.R = 0
								end
							end
						)
						FLY()
						if Max == 2 then
							_G.Fly = false
							Max = 0
						end
					end
				end
			end
		)
	end
})

local Slider = Tab:Slider({
	name = "Change Fly Speed",
	minimum = 1,
	maximum = 250,
	default = 1,
	valuename = "Fly Speed",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		_G.FlySpeed = tonumber(Value)
	end
})

Tab:Section({
	text = "Visuals"
})

local Toggle = Tab:Toggle({
	name = "Players ESP",
	callback = function(Value)
		_G.PlayersHighlightOn = Value
		if _G.PlayersHighlightOn == true then
			local testtest1
			testtest1 = game:GetService("RunService").Stepped:connect(function()
				if _G.PlayersHighlightOn == true then
					PlayersHighlight()
				elseif _G.PlayersHighlightOn == false then
					for i,v in pairs(game.Players:GetChildren()) do
						if v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("Highlight") then
							v.Character.Highlight:Destroy()
						end
					end
					testtest1:Disconnect()
				end
			end)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Players Tracers",
	callback = function(Value)
		_G.PlayersTracersOn = Value
		if _G.PlayersTracersOn == true then
			local testtest2
			testtest2 = game:GetService("RunService").Stepped:connect(function()
				if _G.PlayersTracersOn == true then
					playersTracers()
				elseif _G.PlayersTracersOn == false then
					for i,v in pairs (game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
						if v.ClassName == "Beam" then v:Destroy() end
					end
					for i,v in pairs (game.Players:GetPlayers()) do
						if v.Character.HumanoidRootPart:FindFirstChild("PlayerTracer") then
							v.Character.HumanoidRootPart.PlayerTracer:Destroy()
						end
					end
					testtest2:Disconnect()
				end
			end)
		end
	end
})

local Tab = Main:CreateTab({
	name = "Avatar",
	icon = "rbxassetid://15101014644"
})

Tab:Section({
	text = "Avatar"
})

local Button = Tab:Button({
	name = "Faceless (FE)",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]:FireServer("wear", 12350593459)
		task.wait(0.5)
		game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]:FireServer("wear", 12350593459)
	end)
})

local Input = Tab:Input({
	name = "Wear Custom Face / Shirt / Pants / Accessory",
	placeholdertext = "ID",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]:FireServer("wear", tonumber(Value))
	end
})

Tab:Section({
	text = "Copy Avatar"
})

local Input = Tab:Input({
	name = "Enter Player's Name",
	placeholdertext = "Player",
	cleartextonfocus = true,
	callback = function(Value)
		_G.CopyPlayerAvatarName = tostring(Value)
	end
})

local Button = Tab:Button({
	name = "Copy Player Avatar",
	callback = (function()
		local UpdateAvatar = game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]
		local HumanoidDescription = game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.Humanoid.HumanoidDescription
		game:GetService("ReplicatedStorage").RE["1Avata1rOrigina1l"]:FireServer("OCA")
		task.wait(0.5)
		ChangeAvatar(game.Players:WaitForChild(_G.CopyPlayerAvatarName).Character.Humanoid.HumanoidDescription)
		task.wait(0.5)
		ChangeAvatar(game.Players:WaitForChild(_G.CopyPlayerAvatarName).Character.Humanoid.HumanoidDescription)
		task.wait(0.5)
		ChangeAvatar(game.Players:WaitForChild(_G.CopyPlayerAvatarName).Character.Humanoid.HumanoidDescription)
		task.wait(0.5)
		UpdateAvatar:FireServer("skintone", tostring(game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.Head.BrickColor))
		task.wait(0.5)
		UpdateAvatar:FireServer("skintone", tostring(game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.Head.BrickColor))
		task.wait(0.5)
		UpdateAvatar:FireServer("skintone", tostring(game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.Head.BrickColor))
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", 63690008)
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", 144075659)
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", 144076760)
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", 144076358)	
		task.wait(0.5)
		UpdateAvatar:FireServer("wear")
		task.wait(0.5)

		for i,v in pairs(string.split(HumanoidDescription.FaceAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		UpdateAvatar:FireServer("wear", 144075659)
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", tonumber(HumanoidDescription.Pants))
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", tonumber(HumanoidDescription.Shirt))
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", tonumber(HumanoidDescription.GraphicTShirt))
		task.wait(0.5)

		for i,v in pairs(string.split(HumanoidDescription.BackAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.HairAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.HatAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.FrontAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.NeckAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.WaistAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.ShouldersAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		UpdateAvatar:FireServer("wear", tonumber(HumanoidDescription.Face))
		task.wait(0.5)

		if _G.IncludeWalkStyle == true then
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.ClimbAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.FallAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.IdleAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.JumpAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.MoodAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.RunAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.SwimAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.WalkAnimation)
			task.wait(0.5)
		end
	end)
})

local Toggle = Tab:Toggle({
	name = "Include Walk Style",
	callback = function(Value)
		_G.IncludeWalkStyle = Value
	end
})

local Button = Tab:Button({
	name = "Teleport To Player",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.HumanoidRootPart.CFrame
	end)
})

local Button = Tab:Button({
	name = "Reset Player Outfit",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Avata1rOrigina1l"]:FireServer("OCA")
	end)
})

Tab:Section({
	text = "Change RP Name"
})

local Input = Tab:Input({
	name = "Change RP Name",
	placeholdertext = "RP Name",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", tostring(Value))
	end
})

local Input = Tab:Input({
	name = "Copy RP Name of the Player",
	placeholdertext = "Player",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", game.Players:FindFirstChild(Value).PlayersBag.RPName.Value)
		task.wait(0.3)
		game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", game.Players:FindFirstChild(Value).PlayersBag.RPNameColor.Value)
	end
})

local Button = Tab:Button({
	name = "Delete RP Name",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "")
	end)
})

local Toggle = Tab:Toggle({
	name = "Rainbow RP Name",
	callback = function(Value)
		_G.RainbowName = Value
		while _G.RainbowName == true do
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(1, 0, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(1, 0, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0.666667, 0, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0, 0, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0, 1, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0, 1, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(1, 1, 0))
			task.wait(0.5)
		end
	end
})

Tab:Section({
	text = "Change Bio"
})

local Input = Tab:Input({
	name = "Change Bio",
	placeholdertext = "Bio",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayBio", tostring(Value))
	end
})

local Input = Tab:Input({
	name = "Copy Bio of the Player",
	placeholdertext = "Player",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayBio", game.Players:FindFirstChild(Value).PlayersBag.RPBio.Value)
		task.wait(0.3)
		game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", game.Players:FindFirstChild(Value).PlayersBag.RPBioColor.Value)
	end
})

local Button = Tab:Button({
	name = "Delete Bio",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayBio", "")
	end)
})

local Toggle = Tab:Toggle({
	name = "Rainbow Bio",
	callback = function(Value)
		_G.RainbowBio = Value
		while _G.RainbowBio == true do
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(1, 0, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(1, 0, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0.666667, 0, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0, 0, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0, 1, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0, 1, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(1, 1, 0))
			task.wait(0.5)
		end
	end
})

Tab:Section({
	text = "Spawn a Child"
})

local Dropdown = Tab:Dropdown({
	name = "Children",
	callback = function(Name, Value)
		game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", Value)
	end,
	opencallback = function()

	end,
})

Dropdown:Add("Baby Boy", "BabyBoy")
Dropdown:Add("Baby Girl", "BabyGirl")
Dropdown:Add("Baby Boy [Premium 1]", "BabyBoy1")
Dropdown:Add("Baby Boy [Premium 2]", "BabyBoy2")
Dropdown:Add("Baby Boy [Premium 3]", "BabyBoy3")
Dropdown:Add("Baby Girl [Premium 1]", "BabyGirl1")
Dropdown:Add("Baby Girl [Premium 2]", "BabyGirl2")
Dropdown:Add("Baby Girl [Premium 3]", "BabyGirl3")

local Toggle = Tab:Toggle({
	name = "Spam Spawn Child",
	callback = function(Value)
		_G.SpamChildren = Value
		while _G.SpamChildren == true do
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyBoy")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyGirl")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyBoy1")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyBoy2")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyBoy3")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyGirl1")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyGirl2")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyGirl3")
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow Child Name",
	callback = function(Value)
		_G.RainbowChildName = Value
		while _G.RainbowChildName == true do
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.NoResetGUIHandler.MainAvatarMenu.Catalog.Container.ScrollingFrameKid2.Frame:GetChildren()) do
				if v.Name == "FollowColor" then
					game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPFollowColor", v.Color)
					task.wait(0.5)
				end
			end
			task.wait()
		end
	end	
})

Tab:Section({
	text = "Rainbow Skin"
})

local Toggle = Tab:Toggle({
	name = "Rainbow Skin",
	callback = function(Value)
		_G.RainbowSkin = Value
		while _G.RainbowSkin == true do
			game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]:FireServer("skintone", BrickColor.new(math.random(1,365)).Name)
			task.wait(0.3)
		end
	end
})

Tab:Section({
	text = "Jobs"
})

local Toggle = Tab:Toggle({
	name = "Loop Jobs",
	callback = function(Value)
		_G.LoopJobs = Value
		while _G.LoopJobs == true do
			for i,v in pairs (game:GetService("Workspace").WorkspaceCom["001_GiveJobs"]:GetChildren()) do
				game:GetService("ReplicatedStorage").RE["1Jo1b"]:FireServer("GiveJobUIMenu", v.Name, v.Name, true)
				task.wait(0.1)
			end
			task.wait()
		end
	end
})

local Button = Tab:Button({
	name = "Quit Job",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Jo1b"]:FireServer("QuitJob")
	end)
})

Tab:Section({
	text = "Player Size"
})

local Button = Tab:Button({
	name = "Small Character",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Clothe1s"]:FireServer("CharacterSizeDown", 10)
	end)
})

local Button = Tab:Button({
	name = "Normal Character",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Clothe1s"]:FireServer("CharacterSizeUp", 1)
	end)
})

Tab:Section({
	text = "Burn / Smoke Avatar"
})

local Button = Tab:Button({
	name = "Burn Avatar",
	callback = (function()
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_HappyBurger"].CatchFire, 0)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_BrooksDiner"].CatchFire, 0)
		task.wait(0.1)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_BrooksDiner"].CatchFire, 1)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_HappyBurger"].CatchFire, 1)
	end)
})

local Toggle = Tab:Toggle({
	name = "Loop Burn Avatar",
	callback = function(Value)
		_G.LoopBurnAvatar = Value
		while _G.LoopBurnAvatar == true and task.wait(0.1) do
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_HappyBurger"].CatchFire, 0)
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_BrooksDiner"].CatchFire, 0)
			task.wait(0.1)
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_BrooksDiner"].CatchFire, 1)
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_HappyBurger"].CatchFire, 1)

		end
	end
})

local Button = Tab:Button({
	name = "Smoke Avatar",
	callback = (function()
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_Pizza"].CatchFire, 0)
		task.wait(0.1)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_Pizza"].CatchFire, 1)
	end)
})

local Toggle = Tab:Toggle({
	name = "Loop Smoke Avatar",
	callback = function(Value)
		_G.LoopSmokeAvatar = Value
		while _G.LoopSmokeAvatar == true and task.wait(0.1) do
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_Pizza"].CatchFire, 0)
			task.wait(0.1)
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_Pizza"].CatchFire, 1)
		end
	end
})

local Tab = Main:CreateTab({
	name = "Houses",
	icon = "rbxassetid://15101018631"
})

Tab:Section({
	text = "House Name"
})

local Input = Tab:Input({
	name = "House Name",
	placeholdertext = "Name",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPHous1eEven1t"]:FireServer("BusinessName", tostring(Value))
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow House Name",
	callback = function(Value)
		_G.RainbowHouseBio = Value
		while _G.RainbowHouseBio == true do
			for i,v in pairs(game:GetService("Players").averytiredcheese.PlayerGui.MainGUIHandler.HouseControl.HomeBus.HomeText.Picks.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1RPHous1eEven1tColo1r"]:FireServer("PickingBusinessNameColor", v.Color)
					task.wait(1)
				end
			end
			task.wait()
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow House",
	callback = function(Value)
		_G.RainbowHouse = Value
		while _G.RainbowHouse == true do
			for i,v in pairs(game:GetService("Players").averytiredcheese.PlayerGui.MainGUIHandler.HouseControl.HomeBus.HomeText.Picks.Frame:GetChildren()) do
				game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("ColorPickHouse", Color3.new(math.random(), math.random(), math.random()))
				task.wait(1.5)
			end
			task.wait()
		end
	end
})

Tab:Section({
	text = "Spam Things"
})

local Toggle = Tab:Toggle({
	name = "Spam Curtains",
	callback = function(Value)
		_G.SpamCurtains = Value
		while _G.SpamCurtains == true do
			game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("Curtains")
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Garage",
	callback = function(Value)
		_G.SpamGarage = Value
		while _G.SpamGarage == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_HouseDoors"].GarageOpeners.Button.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Computer",
	callback = function(Value)
		_G.SpamComputer = Value
		while _G.SpamComputer == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Computer"].ChannelDown.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Dishwasher",
	callback = function(Value)
		_G.SpamDishwasher = Value
		while _G.SpamDishwasher == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_DishWasher"].Door.Interactive.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Campfire",
	callback = function(Value)
		_G.SpamCampfire = Value
		while _G.SpamCampfire == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Fire"].FireClicker.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Fridge",
	callback = function(Value)
		_G.SpamFridge = Value
		while _G.SpamFridge == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Fridge"].RightDoor.Handle.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Fridge"].LeftDoor.Handle.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Lock / Unlock Door",
	callback = function(Value)
		_G.SpamUnlock = Value
		while _G.SpamUnlock == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_HouseDoors"].LockDoorButton)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam House Lights",
	callback = function(Value)
		_G.SpamHouseLight = Value
		while _G.SpamHouseLight == true do
			for i,v in pairs (game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_HouseLights"]:GetChildren()) do
				fireclickdetector(v.ClickDetector)
				task.wait(1)
			end
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Mail Box",
	callback = function(Value)
		_G.SpamMailBox = Value
		while _G.SpamMailBox == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_MailBox"].ModelMove.Door.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Oven",
	callback = function(Value)
		_G.SpamOven = Value
		while _G.SpamOven == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Oven"].OvenDoor.Interactive.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Safe",
	callback = function(Value)
		_G.SpamSafe = Value
		while _G.SpamSafe == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Safe"].OpenSafeDoorButton.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Sink",
	callback = function(Value)
		_G.SpamSink = Value
		while _G.SpamSink == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink2"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink3"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink4"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink5"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink7"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_SinkTub"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam TV",
	callback = function(Value)
		_G.SpamTV = Value
		while _G.SpamTV == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_TV"].ChannelDown)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Pool",
	callback = function(Value)
		_G.SpamPool = Value
		while _G.SpamPool == true do
			game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("PoolOnOff")
			task.wait(1)
		end
	end
})

Tab:Section({
	text = "Spam Bell / Knock"
})

local Input = Tab:Input({
	name = "Enter Target Name",
	placeholdertext = "Player",
	cleartextonfocus = true,
	callback = function(Value)
		_G.BellKnockTarget = tostring(Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Bell",
	callback = function(Value)
		_G.SpamBell = Value
		while _G.SpamBell == true do
			if game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace")["001_Lots"]:FindFirstChild(_G.BellKnockTarget.."House").HousePickedByPlayer.HouseModel["001_DoorBell"].TouchBell.Position) < 35 then
				fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(_G.BellKnockTarget.."House").HousePickedByPlayer.HouseModel["001_DoorBell"].TouchBell.ClickDetector)
			end
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Knock",
	callback = function(Value)
		_G.SpamKnock = Value
		while _G.SpamKnock == true do
			if game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace")["001_Lots"]:FindFirstChild(_G.BellKnockTarget.."House").HousePickedByPlayer.HouseModel["001_HouseDoors"].HouseDoorFront.Knock.TouchBell.Position) < 35 then
				fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(_G.BellKnockTarget.."House").HousePickedByPlayer.HouseModel["001_HouseDoors"].HouseDoorFront.Knock.TouchBell.ClickDetector)
			end
			task.wait(1)
		end
	end	
})

Tab:Section({
	text = "Roommate Player"
})

local Input = Tab:Input({
	name = "Enter Target Name",
	placeholdertext = "Input",
	cleartextonfocus = true,
	callback = function(Value)
		_G.RoomMateTarget = tostring(Value)
	end
})

local Dropdown = Tab:Dropdown({
	name = "Choose Land",
	callback = function(Name, Value)
		_G.RoomMateHouseTarget = Value
	end,
	opencallback = function()

	end,
})

for i,v in pairs(Houses) do
	local Value = string.match(v, "%d+")
	Dropdown:Add(v, tonumber(Value))
end

local Button = Tab:Button({
	name = "Give Roommate Permissions",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Playe1rTrigge1rEven1t"]:FireServer("GivePermissionLoopToServer", game:GetService("Players"):FindFirstChild(_G.RoomMateTarget), _G.RoomMateHouseTarget)
	end)
})

local Button = Tab:Button({
	name = "Remove Roommate Permissions",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Playe1rTrigge1rEven1t"]:FireServer("RemovePermissionLoopToServer", game:GetService("Players"):FindFirstChild(_G.RoomMateTarget), _G.RoomMateHouseTarget)
	end)
})

Tab:Section({
	text = "Unban From All Houses"
})

local Button = Tab:Button({
	name = "Unban From All Houses",
	callback = (function()
		for i,v in pairs(game:GetService("Workspace")["001_Lots"]:GetChildren()) do
			if v:IsA("Part") and v:FindFirstChild("HousePickedByPlayer") then
				for a,b in pairs(v.HousePickedByPlayer.HouseModel:GetChildren()) do
					if b.Name:find("BannedBlock") then
						b:Destroy()
						break
					end
				end
			end
		end
	end)
})

local Toggle = Tab:Toggle({
	name = "Auto Unban",
	callback = function(Value)
		_G.AutoUnban = Value
		if _G.AutoUnban == true then
			local temp2
			temp2 = game:GetService("RunService").Stepped:connect(function()
				if _G.AutoUnban == true then
					for i,v in pairs(game:GetService("Workspace")["001_Lots"]:GetChildren()) do
						if v:IsA("Part") and v:FindFirstChild("HousePickedByPlayer") then
							for a,b in pairs(v.HousePickedByPlayer.HouseModel:GetChildren()) do
								if b.Name:find("BannedBlock") then
									b:Destroy()
									break
								end
							end
						end
					end
				else
					temp2:Disconnect()
				end
			end)
		end
	end
})

Tab:Section({
	text = "Miscellaneous"
})

local Button = Tab:Button({
	name = "Burn Your House",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("PlayerWantsFireOnFirePassNotShowingAnyone")
	end)
})

local Input = Tab:Input({
	name = "Set House Music",
	placeholdertext = "ID",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("PickHouseMusicText", tonumber(Value))
	end
})

local Tab = Main:CreateTab({
	name = "Vehicles",
	icon = "rbxassetid://15101017615"
})

Tab:Section({
	text = "Vehicles List"
})

local Dropdown = nil
Dropdown = Tab:Dropdown({
	name = "Remove Vehicle",
	callback = function(Name, Value)
		_G.TargetVehicle = Name
	end,
	opencallback = function()
		Dropdown:Clear()
		for i,v in pairs(workspace.Vehicles:GetChildren()) do
			Dropdown:Add(v.Name, nil)
		end
	end,
})

local Button = Tab:Button({
	name = "Teleport To Vehicle",
	callback = (function()
		for i,v in pairs(workspace.Vehicles:FindFirstChild(_G.TargetVehicle):GetDescendants()) do
			if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("Seat") then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
			end
		end
	end)
})

local Button = Tab:Button({
	name = "Remove Vehicle",
	callback = (function()
		while game.Players.LocalPlayer.Character.Humanoid.Sit == false and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 do
			for i,v in pairs(workspace.Vehicles:FindFirstChild(_G.TargetVehicle):GetDescendants()) do
				if v:IsA("Seat") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
					task.wait(0.05)
				end
			end
			task.wait(0.05)
		end
		while game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 do
			tpNpc(workspace.Vehicles:FindFirstChild(_G.TargetVehicle), Vector3.new(-2500000, -2500000, 0), 1)
			for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
			task.wait(1)
		end
	end)
})

Tab:Section({
	text = "Free Vehicle Section"
})

local Input = Tab:Input({
	name = "Set Car Speed",
	placeholdertext = "number",
	cleartextonfocus = true,
	callback = function(Value)
		workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."Car").Body.VehicleSeat.TopSpeed.Value = tonumber(Value)
	end
})

local Input = Tab:Input({
	name = "Set Car Turbo Multiplier",
	placeholdertext = "number",
	cleartextonfocus = true,
	callback = function(Value)
		workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."Car").Body.VehicleSeat.Turbo.Value = tonumber(Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Horn",
	callback = function(Value)
		_G.SpamHorn = Value
		while _G.SpamHorn == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("Horn")
			task.wait(0.25)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("HornStop")
			task.wait(0.1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Lights",
	callback = function(Value)
		_G.SpamLight = Value
		while _G.SpamLight == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("Lights")
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Hazards",
	callback = function(Value)
		_G.SpamHazard = Value
		while _G.SpamHazard == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("Hazards")
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Height",
	callback = function(Value)
		_G.SpamHeight = Value
		while _G.SpamHeight == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("VehicleHeight", 1)
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("VehicleHeight", 2)
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("VehicleHeight", 3)
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("VehicleHeight", 4)
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Wheel",
	callback = function(Value)
		_G.SpamWheel = Value
		while _G.SpamWheel == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("WheelNumber")
			task.wait(0.5)
		end
	end
})

Tab:Section({
	text = "Premium Vehicle Section"
})

local Toggle = Tab:Toggle({
	name = "Toggle Name",
	callback = function(Value)
		_G.RainbowCar = Value
		while _G.RainbowCar == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("PickingCarColor", Color3.new(1, 0, 0))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("PickingCarColor", Color3.new(1, 0, 1))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("PickingCarColor", Color3.new(0.666667, 0, 0))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("PickingCarColor", Color3.new(0, 0, 1))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("PickingCarColor", Color3.new(0, 1, 1))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("PickingCarColor", Color3.new(0, 1, 0))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("PickingCarColor", Color3.new(1, 1, 0))
			task.wait(1)
		end
	end
})

local Button = Tab:Button({
	name = "Blow All Wheels",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("BlowFrontLeft")
		game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("BlowFrontRight")
		game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("BlowRearRight")
		game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("BlowRearLeft")
	end)
})

local Dropdown = Tab:Dropdown({
	name = "Blow a Specific Wheel",
	callback = function(Name, Value)
		game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer(Value)
	end,
	opencallback = function()

	end,
})

Dropdown:Add("Front Left", "BlowFrontLeft")
Dropdown:Add("Front Right", "BlowFrontRight")
Dropdown:Add("Rear Left", "BlowRearLeft")
Dropdown:Add("Rear Right", "BlowRearRight")

local Toggle = Tab:Toggle({
	name = "Spam Fire",
	callback = function(Value)
		_G.SpamFire = Value
		while _G.SpamFire == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("Fire")
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Duke [1]",
	callback = function(Value)
		_G.SpamDuke1 = Value
		while _G.SpamDuke1 == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("Duke")
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Duke [2]",
	callback = function(Value)
		_G.SpamDuke2 = Value
		while _G.SpamDuke2 == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("Duke1")
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Turbo",
	callback = function(Value)
		_G.SpamTurbo = Value
		while _G.SpamTurbo == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("TurboStage", 1)
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("TurboStage", 2)
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("TurboStage", 3)
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("TurboStage", 4)
			task.wait(0.5)
		end
	end
})

local Input = Tab:Input({
	name = "Set Car Music",
	placeholdertext = "ID",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("PickingCarMusicText", Value)
	end
})

Tab:Section({
	text = "Bike Section"
})

local Toggle = Tab:Toggle({
	name = "Rainbow Bike",
	callback = function(Value)
		_G.RainbowBike = Value
		while _G.RainbowBike == true do
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("NoMotorColor", Color3.new(1, 0, 0))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("NoMotorColor", Color3.new(1, 0, 1))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("NoMotorColor", Color3.new(0.666667, 0, 0))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("NoMotorColor", Color3.new(0, 0, 1))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("NoMotorColor", Color3.new(0, 1, 1))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("NoMotorColor", Color3.new(0, 1, 0))
			task.wait(1)
			game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]:FireServer("NoMotorColor", Color3.new(1, 1, 0))
			task.wait(1)
		end
	end
})

Tab:Section({
	text = "Tank Section"
})

local Toggle = Tab:Toggle({
	name = "Spam Shoot",
	callback = function(Value)
		_G.SpamShoot = Value
		while _G.SpamShoot == true do
			for i,v in pairs (workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."Car"):GetDescendants()) do
				if v.Name == "Shoot" then
					fireclickdetector(v.ClickDetector)
				end
			end
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Shoot All Tanks",
	callback = function(Value)
		_G.SpamShootAll = Value
		while _G.SpamShootAll == true do
			for i,v in pairs (workspace.Vehicles:GetDescendants()) do
				if v.Name == "Shoot" then
					fireclickdetector(v.ClickDetector)
				end
			end
			task.wait(0.5)
		end
	end
})

Tab:Section({
	text = "Nascar Truck Section"
})

local Input = Tab:Input({
	name = "Nascar Truck Name",
	placeholdertext = "name",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("ReturningNascarTruckName", Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow Nascar Truck Text",
	callback = function(Value)
		_G.RainbowNascarTruck = Value
		while _G.RainbowNascarTruck == true do
			for i,v in pairs(game:GetService("Players").averylocalcheese.PlayerGui.MainGUIHandler.Menu.NascarTruckName.A.B.C.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("PickingNascarTruckNameColor", v.Color)
				end
				task.wait(0.5)
			end
			task.wait()
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow Nascar Truck Text [Premium]",
	callback = function(Value)
		_G.RainbowNascarTruckPremium = Value
		while _G.RainbowNascarTruckPremium == true do
			for i,v in pairs(game:GetService("Players").averylocalcheese.PlayerGui.MainGUIHandler.Menu.NascarPremiumName.A.B.C.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("PickingNascarPremiumNameColor", v.Color)
				end
				task.wait(0.5)
			end
			task.wait()
		end
	end
})

Tab:Section({
	text = "Food Truck Section"
})

local Input = Tab:Input({
	name = "Food Truck Name",
	placeholdertext = "name",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("ReturningFoodTruckName", Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow Food Truck Text",
	callback = function(Value)
		_G.RainbowFoodTruck = Value
		while _G.RainbowFoodTruck == true do
			for i,v in pairs(game:GetService("Players").averylocalcheese.PlayerGui.MainGUIHandler.Menu.FoodTruckName.A.B.C.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("PickingFoodTruckNameColor", v.Color)
				end
				task.wait(0.5)
			end
			task.wait()
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Window",
	callback = function(Value)
		_G.LoopFoodTruckWindow = Value
		while _G.LoopFoodTruckWindow == true do
			for i,v in pairs(workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."Car"):GetDescendants()) do
				if v.Name == "MovePart" then
					fireclickdetector(v.ClickDetector)
				end
			end
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Design",
	callback = function(Value)
		_G.LoopFoodTruckDesign = Value
		while _G.LoopFoodTruckDesign == true do
			for i,v in pairs(workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."Car"):GetDescendants()) do
				if v.Name == "FlipThrough" then
					fireclickdetector(v.ClickDetector)
				end
			end
			task.wait(0.5)
		end
	end
})

Tab:Section({
	text = "Horse Section"
})

local Input = Tab:Input({
	name = "Change Horse Name",
	placeholdertext = "name",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1Hors1eRemot1e"]:FireServer("HorseName", Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow Horse Name",
	callback = function(Value)
		_G.RainbowHorse = Value
		while _G.RainbowHorse == true do
			for i,v in pairs(game:GetService("Players").averylocalcheese.PlayerGui.MainGUIHandler.HorseControl.HorseText.HorseText.Picks.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("PickingNascarTruckNameColor", v.Color)
				end
				task.wait(0.5)
			end
			task.wait()
		end
	end
})

local Button = Tab:Button({
	name = "Black Horse",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Hors1eRemot1e"]:FireServer("BlackHorseFree")
	end)
})

local Button = Tab:Button({
	name = "Brown Horse",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Hors1eRemot1e"]:FireServer("BrownHorseFree")
	end)
})

Tab:Section({
	text = "Horse Section (Horse Pass)"
})

local Toggle = Tab:Toggle({
	name = "Rainbow Saddle",
	callback = function(Value)
		_G.RainbowSaddle = Value
		while _G.RainbowSaddle == true do
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.HorseControl.SaddleColorPicks.ColorPicks.Picks.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("PickingNascarTruckNameColor", v.Color)
				end
				task.wait(0.5)
			end
			task.wait()
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow Horse Hair",
	callback = function(Value)
		_G.RainbowHorseHair = Value
		while _G.RainbowHorseHair == true do
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.HorseControl.SaddleColorPicks.ColorPicks.Picks.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("PickingNascarTruckNameColor", v.Color)
				end
				task.wait(0.5)
			end
			task.wait()
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow Horse Body",
	callback = function(Value)
		_G.RainbowHorseBody = Value
		while _G.RainbowHorseBody == true do
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.HorseControl.TexturePicks.ColorPicks.Picks.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("PickingNascarTruckNameColor", v.Color)
				end
				task.wait(0.5)
			end
			task.wait()
		end
	end
})

Tab:Section({
	text = "Helicopter Section"
})

local Dropdown = Tab:Dropdown({
	name = "Change Helicopter Design",
	callback = function(Name, Value)
		game:GetService("ReplicatedStorage").RE["1Max1y"]:FireServer("", Value)
	end,
	opencallback = function()

	end,
})

Dropdown:Add("Police", "PoliceMeshID")
Dropdown:Add("Rescue", "RescueMeshID")
Dropdown:Add("TubeTV", "TuveTVMeshID")
Dropdown:Add("Military", "MilitaryMeshID")
Dropdown:Add("Agency", "AgencyMeshID")
Dropdown:Add("Sheriff", "SheriffMeshID")
Dropdown:Add("State Trooper", "StateTrooperMeshID")

local Button = Tab:Button({
	name = "Remove Helicopter",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Max1y"]:FireServer("", "TakeOff")
	end)
})


local Tab = Main:CreateTab({
	name = "Tools",
	icon = "rbxassetid://15101015572"
})

Tab:Section({
	text = "Backpack"
})

local Button = Tab:Button({
	name = "Get All Menu Tools",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
		for i,v in pairs(game:GetService("StarterGui").NoResetGUIHandler.MainToolMenu.Catalog.Container.ScrollingFrame:GetChildren()) do
			if v.ClassName ~= "UIGridLayout" then
				game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", v.Name)
			end
			task.wait()
		end
	end)
})

local Button = Tab:Button({
	name = "Equip All Tools",
	callback = (function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
	end)
})

local Button = Tab:Button({
	name = "Remove All Tools",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
	end)
})

Tab:Section({
	text = "Get Secret Items"
})

local Button = Tab:Button({
	name = "Couch",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
	end)
})

local Button = Tab:Button({
	name = "Fire Hose",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "FireHose")
	end)
})

local Button = Tab:Button({
	name = "Crystal",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Crystal")
	end)
})

local Button = Tab:Button({
	name = "Crystals",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Crystals")
	end)
})

local Button = Tab:Button({
	name = "Agency Book",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "AgencyBook")
	end)
})

local Button = Tab:Button({
	name = "Arch",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Arch")
	end)
})

local Button = Tab:Button({
	name = "Corn",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Corn")
	end)
})

local Button = Tab:Button({
	name = "Tree",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Tree")
	end)
})

local Button = Tab:Button({
	name = "Hay",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Hay")
	end)	
})


local Button = Tab:Button({
	name = "Pumpkin",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Pumpkin")
	end)
})

local Button = Tab:Button({
	name = "Sign",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Sign")
	end)
})

local Button = Tab:Button({
	name = "Black Sign",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "SignBlack")
	end)
})

local Button = Tab:Button({
	name = "Pink Sign",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "SignPink")
	end)
})


local Button = Tab:Button({
	name = "Red Sign",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "SignRed")
	end)
})

local Button = Tab:Button({
	name = "Fire Paperbag",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "PaperbagFire")
	end)
})

Tab:Section({
	text = "Miscellaneous"
})

local Button = Tab:Button({
	name = "Get All Cards",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "CreditCardGirl")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "CreditCardBoy")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "BankKeyCard")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "PowerKeyCard")
	end)
})

local Button = Tab:Button({
	name = "Get All Guns",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "GlockBrown")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Glock")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Assault")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Shotgun")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Sniper")
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Taser")
	end)
})

local Toggle = Tab:Toggle({
	name = "Rainbow Sign Text",
	callback = function(Value)
		_G.RainbowSignText = Value
		while _G.RainbowSignText == true do
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.GunGUI.SignGui.A.B.C.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1Cemeter1y"]:FireServer("PickingNascarPremiumNameColor", v.Color)
				end
				task.wait(0.5)
			end
			task.wait()
		end
	end
})

local Button = Tab:Button({
	name = "Get Shopping Cart",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "ShoppingCart")
	end)
})


local Tab = Main:CreateTab({
	name = "Teleport",
	icon = "rbxassetid://15105266838"
})

Tab:Section({
	text = "Teleport to Player"
})

local Dropdown = nil
Dropdown = Tab:Dropdown({
	name = "Teleport to Player",
	callback = function(Name, Value)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild(Name).HumanoidRootPart.CFrame
	end,
	opencallback = function()
		Dropdown:Clear()
		for i,v in pairs(game.Players:GetChildren()) do
			Dropdown:Add(v.Name, nil)
		end
	end,
})

Tab:Section({
	text = "Places"
})

local Button = Tab:Button({
	name = "Cemetery",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-486.3172302246094, 3.62484073638916, 53.34157943725586)
	end)   
})

local Button = Tab:Button({
	name = "Car Wash",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(279.3940734863281, 3.62484073638916, -296.33111572265625)
	end)   
})

local Button = Tab:Button({
	name = "Camping",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-349.626220703125, 3.224841356277466, 540.8662109375)
	end)   
})

local Button = Tab:Button({
	name = "Happy Burger",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(187.38507080078125, 20.399837493896484, -203.4929962158203)
	end)   
})

local Button = Tab:Button({
	name = "TV Station",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(212.9704132080078, 20.399404525756836, -167.0987548828125)
	end)   
})

local Button = Tab:Button({
	name = "Rosie's Gym",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(192.148681640625, 20.499013900756836, -147.99249267578125)
	end)   
})

local Button = Tab:Button({
	name = "Dance Studio",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(165.79281616210938, 20.487205505371094, -200.68260192871094)
	end)   
})

local Button = Tab:Button({
	name = "Starbrooks Coffee",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-95.72335815429688, 3.7248406410217285, 245.7701416015625)
	end)   
})

local Button = Tab:Button({
	name = "Starbrooks Coffee [2]",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-96.5374755859375, 3.684840679168701, 244.6674041748047)
	end)   
})

local Button = Tab:Button({
	name = "Library and Books",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-129.79335021972656, 3.7248406410217285, 253.23648071289062)
	end)   
})

local Button = Tab:Button({
	name = "Dentist",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-60.096107482910156, 21.224842071533203, 272.0447692871094)
	end)   
})

local Button = Tab:Button({
	name = "Brookhaven Shelter",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-78.48543548583984, 21.12483787536621, 271.8721923828125)
	end)   
})

local Button = Tab:Button({
	name = "RockStar",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-41.1353759765625, 3.7248406410217285, 252.2581787109375)
	end)   
})

local Button = Tab:Button({
	name = "Brookhaven Bank",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-41.1353759765625, 3.7248406410217285, 252.2581787109375)
	end)   
})

local Button = Tab:Button({
	name = "Brookhaven Post Office",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-167.1441192626953, 3.7248406410217285, 260.38519287109375)
	end)   
})

local Button = Tab:Button({
	name = "The Brick Restaurant",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-179.65536499023438, 20.2248477935791, 272.7030029296875)
	end)   
})

local Button = Tab:Button({
	name = "Los Panchos Resturant",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-179.65536499023438, 20.2248477935791, 272.7030029296875)
	end)   
})

local Button = Tab:Button({
	name = "Brookhaven School",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-311.805908203125, 3.8248422145843506, 212.73416137695312)
	end)   
})

local Button = Tab:Button({
	name = "St.Lukes Hospital",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-303.8172607421875, 3.711090087890625, 26.172260284423828)
	end)   
})

local Button = Tab:Button({
	name = "Fire Station",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-465.7425231933594, 3.2498409748077393, -83.22677612304688)
	end)   
})

local Button = Tab:Button({
	name = "Town Hall",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-354.1650695800781, 7.630406856536865, -102.70242309570312)
	end)   
})

local Button = Tab:Button({
	name = "Police",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119.82024383544922, 3.62484073638916, -11.593236923217773)
	end)   
})

local Button = Tab:Button({
	name = "Arcade",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-167.50559997558594, 3.6248419284820557, -101.6902084350586)
	end)   
})

local Button = Tab:Button({
	name = "Ice Cream",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-127.41191864013672, 3.6248421669006348, -105.03018951416016)
	end)   
})

local Button = Tab:Button({
	name = "Club Brooks",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-96.55874633789062, 21.20216178894043, -138.99465942382812)
	end)   
})

local Button = Tab:Button({
	name = "Hair And Nails",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-74.98171997070312, 3.6248421669006348, -102.49715423583984)
	end)   
})

local Button = Tab:Button({
	name = "Brookhaven Apartments",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-41.79927444458008, 3.624842643737793, -101.74720001220703)
	end)   
})

local Button = Tab:Button({
	name = "Grocery",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16.58240509033203, 3.6248421669006348, -106.73407745361328)
	end)   
})

local Button = Tab:Button({
	name = "Tan Studios",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-168.53213500976562, 19.624839782714844, -122.80098724365234)
	end)   
})

local Button = Tab:Button({
	name = "Modeling Agency",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-114.10633850097656, 21.224843978881836, -140.1024932861328)
	end)   
})

local Button = Tab:Button({
	name = "Club",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(162.36705017089844, 3.824845552444458, -168.65599060058594)
	end)   
})

local Button = Tab:Button({
	name = "Rotten Robbie",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113.07081604003906, 3.62484073638916, -297.2552795410156)
	end)   
})

local Button = Tab:Button({
	name = "Auto Shop",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(22.48087501525879, 3.624840259552002, -339.7799072265625)
	end)   
})

local Button = Tab:Button({
	name = "Funerals",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-82.9734115600586, 37.224830627441406, -207.90890502929688)
	end)   
})

local Button = Tab:Button({
	name = "Brookhaven Stables",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-771.9862060546875, 3.2248406410217285, -64.02125549316406)
	end)   
})

local Button = Tab:Button({
	name = "Gold Ranch",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-840.4502563476562, 3.2248408794403076, -343.7743225097656)
	end)   
})

local Button = Tab:Button({
	name = "Abandoned House",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(998.4240112304688, 3.2248408794403076, 54.60097885131836)
	end)   
})

local Button = Tab:Button({
	name = "Brookhaven Airport",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(273.5235595703125, 3.6248373985290527, 31.453336715698242)
	end)   
})

local Button = Tab:Button({
	name = "Yacht",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-121.69788360595703, 23.027076721191406, 865.6168212890625)
	end)   
})

Tab:Section({
	text = "Teleport to Secrets"
})

local Button = Tab:Button({
	name = "Agency Red Book",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-142.33779907226562, 12.924863815307617, 260.3987121582031)
	end)   
})

local Button = Tab:Button({
	name = "Bunker",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(177.38230895996094, 3.650165557861328, -466.6908264160156)
	end)   
})

local Button = Tab:Button({
	name = "Abandoned Hospital Floor",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-297.2627868652344, 16.811140060424805, 59.182010650634766)
	end)   
})

local Button = Tab:Button({
	name = "Hospital Secret Room",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-349.6976623535156, 3.711090087890625, 97.45501708984375)
	end)   
})

local Button = Tab:Button({
	name = "Criminal Base",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106.30924987792969, -27.275146484375, 236.49752807617188)
	end)   
})

local Button = Tab:Button({
	name = "Underground Pool",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-54.77513885498047, -17.829505920410156, 107.04366302490234)
	end)   
})


local Tab = Main:CreateTab({
	name = "Misc",
	icon = "rbxassetid://15101016621"
})

Tab:Section({
	text = "Get Gamepasses"
})

local ismobile = game:GetService('UserInputService').TouchEnabled
local isdesktop = game:GetService('UserInputService').KeyboardEnabled

if isdesktop and not ismobile then
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/brookhaven_premium_faces_accs.lua')))()
end

local Button = Tab:Button({
	name = "Unlock Fire Pass",
	callback = (function()
		if not game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.Shop.OpenButton.MainOpen:FindFirstChild("Fire") then
			local Fire = game:GetService("StarterGui").MainGUIHandler.Shop.MainButtons.MainOpen.Fire:Clone()
			Fire.BackgroundTransparency = 0.6
			Fire.Parent = game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.Shop.OpenButton.MainOpen

			local openbutton = game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.Shop.OpenButton.MainOpen.Fire
			local Gui = game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.Menu.FireAskFirePassMansion

			openbutton.MouseButton1Click:Connect(function()
				Gui.Visible = not Gui.Visible
			end)
		end
	end)
})

local Button = Tab:Button({
	name = "Unlock Premium Children",
	callback = (function()
		local Kids = game:GetService("Players").LocalPlayer.PlayerGui.NoResetGUIHandler.MainAvatarMenu.Catalog.Container.ScrollingFrameKid
		for i,v in pairs(Kids:GetChildren()) do
			if v:IsA("ImageButton") and v.Name ~= "BabyBoy" and v.Name ~= "BabyGirl" then
				v.MouseButton1Click:Connect(function()
					game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", v.Name)
				end)
			end
		end
	end)
})

if isdesktop and not ismobile then
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/brookhaven_speed_pass.lua')))()
end

Tab:Section({
	text = "Miscellaneous"
})

local Toggle = Tab:Toggle({
	name = "Door Fling [FE]",
	callback = function(Value)
		_G.DoorFling = Value
		if _G.DoorFling == true then
			for i,v in pairs(workspace:GetDescendants()) do
				if (v:IsA("Part") and (v.Name == "Hinge" or v.Name == "Door")) or (v:IsA("MeshPart") and v.Name == "FakeDoor") then
					if v:FindFirstChild("Attachment") then v.Attachment:Destroy() end
					AddAlignPosition(v)
					AddTorque(v)
					if v.Parent:FindFirstChild("Part") then
						AddAlignPosition(v.Parent:FindFirstChild("Part"))
						AddTorque(v.Parent:FindFirstChild("Part"))
					end
				end
			end
		elseif _G.DoorFling == false then
			for i,v in pairs(workspace:GetDescendants()) do
				if v.Name == "AlignAttach0" or v.Name == "AlignAttach1" or v.Name == "TorqueAttach2" or v.Name == "TorqueAttach3" then
					v:Destroy()
				end
			end
		end
	end
})

Tab:Section({
	text = "Sound Spam [FE] (Hold a Glock)"
})

local Button = Tab:Button({
	name = "Take a Glock",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Glock")
	end)
})

local Dropdown = Tab:Dropdown({
	name = "Choose the Sound",
	callback = function(Name, Value)
		_G.ChoosedSound = Value
	end,
	opencallback = function()

	end,
})

Dropdown:Add("Scream [1]", 7371285928)
Dropdown:Add("Scream [2]", 5063277729)
Dropdown:Add("Scream [3]", 6582769103)
Dropdown:Add("Scream [4]", 2579151679)
Dropdown:Add("Train", 3900067524)
Dropdown:Add("Windows XP Startup", 2208348566)
Dropdown:Add("Windows XP Exclamation", 7436522768)
Dropdown:Add("Windows XP Shutdown", 1166082641)
Dropdown:Add("Iphone Alarm", 4203251375)
Dropdown:Add("Samsung Notification", 8056635966)
Dropdown:Add("Lunatic Laugh", 8453844341)
Dropdown:Add("Scary Laugh", 7854285068)
Dropdown:Add("Fast Fart [1]", 6811876591)
Dropdown:Add("Fast Fart [2]", 9059590824)
Dropdown:Add("Long Fart", 7914322871)

local Toggle = Tab:Toggle({
	name = "Spam Sounds",
	callback = function(Value)
		_G.SpamSounds = Value
		while _G.SpamSounds == true do
			task.wait(_G.SpamSoundsSpeed)
			pcall (function()
				for count = 1, 50, 1 do
					game:GetService("ReplicatedStorage").RE["1Gu1nSound1s"]:FireServer(workspace:FindFirstChild(game.Players.LocalPlayer.Name).Glock.Handle, _G.ChoosedSound, 1)
					game:GetService("Players").LocalPlayer.PlayerScripts.BulletVisualizerScript.GunSounds:Fire(nil, workspace:FindFirstChild(game.Players.LocalPlayer.Name).Glock.Handle, _G.ChoosedSound, 1)
				end
			end)
		end	
	end
})

local Slider = Tab:Slider({
	name = "Spam Sounds Speed",
	minimum = 0,
	maximum = 5,
	default = 1,
	valuename = "Seconds",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		_G.SpamSoundsSpeed = tonumber(Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Sounds [Fast, Loud]",
	callback = function(Value)
		_G.SpamFastSounds = Value
		local testtest9 = nil
		testtest9 = game:GetService("RunService").Heartbeat:connect(function()
			if _G.SpamFastSounds == true then
				pcall (function()
					for count = 1, 30, 1 do
						game:GetService("ReplicatedStorage").RE["1Gu1nSound1s"]:FireServer(workspace:FindFirstChild(game.Players.LocalPlayer.Name).Glock.Handle, _G.ChoosedSound, 1)
						game:GetService("Players").LocalPlayer.PlayerScripts.BulletVisualizerScript.GunSounds:Fire(nil, workspace:FindFirstChild(game.Players.LocalPlayer.Name).Glock.Handle, _G.ChoosedSound, 1)
					end
				end)
			elseif _G.SpamFastSounds == false then
				testtest9:Disconnect()
			end
		end)
	end
})

Tab:Section({
	text = "Turn On Airport Alarms"
})

local Button = Tab:Button({
	name = "Airport",
	callback = (function()
		local FirstPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		if not game.Players.LocalPlayer.Character:FindFirstChild("Glock") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Glock") then
			game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Glock")
		elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Glock") then
			game.Players.LocalPlayer.Backpack.Glock.Parent = game.Players.LocalPlayer.Character
		end
		game.Players.LocalPlayer.Character:WaitForChild("Glock")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorkspaceCom["001_Airport"]["001_MetalDetector"].CFrame
		task.wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = FirstPos
	end)
})

Tab:Section({
	text = "Hand Trail"
})

local Button = Tab:Button({
	name = "Enable Hand Trail",
	callback = (function()
		local FirstPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		task.wait(0.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorkspaceCom["001_Hospital"].PoolClick.CFrame
		task.wait(0.5)
		fireclickdetector(workspace.WorkspaceCom["001_Hospital"].PoolClick.ClickDetector)
		task.wait(0.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = FirstPos
	end)
})

local Button = Tab:Button({
	name = "Disable Hand Trail",
	callback = (function()
		local FirstPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		task.wait(0.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorkspaceCom["001_Hospital"]["Error Code# 11"].CFrame + Vector3.new(0,2,0)
		task.wait(0.5)
		fireclickdetector(workspace.WorkspaceCom["001_Hospital"]["Error Code# 11"].ClickDetector)
		task.wait(0.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = FirstPos
	end)
})

Tab:Section({
	text = "Kill Player"
})

local Button = Tab:Button({
	name = "Kill Player",
	callback = (function()
		if not game.Players.LocalPlayer.Character:FindFirstChild("Couch") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Couch") then
			game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
		elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Couch") then
			game.Players.LocalPlayer.Backpack.Couch.Parent = game.Players.LocalPlayer.Character
		end
		while game.Players:FindFirstChild(_G.PlayerForKill).Character.Humanoid.Sit == false do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.PlayerForKill).Character.HumanoidRootPart.CFrame + Vector3.new(0, -5, 2)
			task.wait()
		end
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,-490,0)
		wait(0.5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
		task.wait(2)
		if game.Players.LocalPlayer.Character:FindFirstChild("Couch") then
			game.Players.LocalPlayer.Character.Couch.Parent = game.Players.LocalPlayer.Backpack
		end
	end)
})

local Dropdown = nil
Dropdown = Tab:Dropdown({
	name = "Choose a Player",
	callback = function(Name, Value)
		_G.PlayerForKill = Name
	end,
	opencallback = function()
		Dropdown:Clear()
		for i,v in pairs(game.Players:GetChildren()) do
			Dropdown:Add(v.Name, nil)
		end
	end
})

