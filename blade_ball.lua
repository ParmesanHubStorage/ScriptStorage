loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local marketplaceService = game:GetService("MarketplaceService")
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)

_G.AutoFarm = false
_G.LegitAutoFarm = false
_G.AutoExplosion = false
_G.AutoWeapon = false
_G.AutoSpins = false
_G.AntiAFK = false
_G.AntiAFKMode = false
_G.WalkSpeed = nil
_G.JumpPower = nil
_G.Noclip = false
_G.FFA = false
_G.TwoTeams = false
_G.FourTeams = false
_G.BallPos = nil
_G.MaxBallPos = 40
_G.BallTracersOn = false
_G.PlayersTracersOn = false
_G.Parried = false
_G.BallSize = Vector3.new(1,1,1)
_G.Debug = false
_G.BallAimbot = false
_G.PlayerAimbot = false


_G.tracers = nil
_G.tracers2 = nil


local function ballTracers()
	local Balls = workspace.Balls:GetChildren() 
	local beam = game.Players.LocalPlayer.Character.HumanoidRootPart.Beam1
	local one = game.Players.LocalPlayer.Character.HumanoidRootPart.PlayerTracer1
	local two = Instance.new('Attachment', Balls[1])
	two.Name = "BallTracer"
	beam.Attachment0 = one
	beam.Attachment1 = two
end

local function ClosestPart(Folder)
	local ClosestMagnitude = 100000
	local ClosestPart = nil
	local Player = game.Players.LocalPlayer.Character.HumanoidRootPart
	for i,v in pairs(Folder:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			if (v.HumanoidRootPart.Position - Player.Position).Magnitude < ClosestMagnitude then
				ClosestMagnitude = (v.HumanoidRootPart.Position - Player.Position).Magnitude
				ClosestPart = v
			end
		end
	end
	return ClosestPart
end

local function playersTracers()
	pcall(function()
		for i,v in pairs(workspace.Alive:GetChildren()) do 
			if v.Name ~= game.Players.LocalPlayer.Name and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("Highlight") and not v.HumanoidRootPart:FindFirstChild("TargetTracer") then 
				local beam = game.Players.LocalPlayer.Character.HumanoidRootPart.Beam2
				local one = game.Players.LocalPlayer.Character.HumanoidRootPart.PlayerTracer2
				local two = Instance.new('Attachment', v.HumanoidRootPart)
				two.Name = "TargetTracer"
				beam.Attachment0 = one
				beam.Attachment1 = two
			end
		end

		for i,v in pairs(workspace.Alive:GetChildren()) do
			if not v:FindFirstChild("Highlight") and v.HumanoidRootPart:FindFirstChild("TargetTracer") then
				v.HumanoidRootPart.TargetTracer:Destroy()
			end
		end

		for i,v in pairs(workspace.Dead:GetChildren()) do
			if not v:FindFirstChild("Highlight") and v.HumanoidRootPart:FindFirstChild("TargetTracer") then
				v.HumanoidRootPart.TargetTracer:Destroy()
			end
		end
	end)
end

local Main = Library:Init({
	name = "Blade Ball"
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
		game.Players.LocalPlayer.Character.Humanoid.HipHeight = tonumber(Value)
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

local Tab = Main:CreateTab({
	name = "Autofarm",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Autofarm Wins"
})

local Toggle = Tab:Toggle({
	name = "Autofarm Wins",
	callback = function(Value)
		_G.AutoFarm = Value
		spawn (function()
			while _G.AutoFarm == true and task.wait(0.05) do
				if workspace.Alive:FindFirstChild(game.Players.LocalPlayer.Name) then
					for _,ball in next, workspace.Balls:GetChildren() do
						if ball then
							local testBalls = workspace.Balls:GetChildren()
							if (testBalls ~= nil and #testBalls == 2 and testBalls[2]:FindFirstChild("ff") and string.sub(tostring(testBalls[2].ff.Color), 3, 3) == "1") and (game.Players.LocalPlayer:DistanceFromCharacter(testBalls[1].Position) < 12) then
								game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
							end
						end
					end
				end
			end
		end)
		local temppp
		spawn(function()
			while _G.AutoFarm == true do
				if workspace.Alive:FindFirstChild(game.Players.LocalPlayer.Name) then
					for _,ball in next, workspace.Balls:GetChildren() do
						if ball then
							temppp = ball
							if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
								local balls = workspace.Balls:GetDescendants()
								while not workspace.Balls:FindFirstChildOfClass("Part") do task.wait() end
								local testBalls = workspace.Balls:GetChildren()
								while #testBalls == 2 and testBalls[1].Velocity.X == 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Highlight") do
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame + Vector3.new(100, -100, 0)
									task.wait()
								end
								if (game.Players.LocalPlayer.PlayerGui.Hotbar.Block.border1.UIGradient.Offset.Y > 0.49) or (testBalls ~= nil and #testBalls == 2 and testBalls[2]:FindFirstChild("ff") and string.sub(tostring(testBalls[2].ff.Color), 3, 3) == "1") then
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame + Vector3.new((-(testBalls[1].Velocity.X)) / 25, -11.5, (-(testBalls[1].Velocity.Z)) / 25)
									--	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, (-(testBalls[1].Velocity.X)) / 25, -11.5, (-(testBalls[1].Velocity.Z)) / 25)
								else
									while game.Players.LocalPlayer.PlayerGui.Hotbar.Block.border1.UIGradient.Offset.Y ~= 0.5 do
										game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame + Vector3.new(100, -100, 0)
										task.wait()
									end
								end
							end
						end
					end
				end
				task.wait()
			end
		end)
	end
})

local Toggle = Tab:Toggle({
	name = "Auto Parry (Legit)",
	callback = function(Value)
		_G.LegitAutoFarm = Value
		local testBalls = nil
		local CalculatedDistance = nil
		local BallPos = nil
		
		local temp = nil
		temp = game:GetService("RunService").Stepped:connect(function()
			if _G.LegitAutoFarm == true then
				for _,ball in next, workspace.Balls:GetChildren() do
					if ball and _G.Parried == false then
						BallPos = game.Players.LocalPlayer:DistanceFromCharacter(ball.Position)
					else
						BallPos = 100
					end
				end
			else
				temp:Disconnect()
			end
		end)
		
		local temp2 = nil
		temp2 = game:GetService("RunService").Stepped:connect(function()
			if _G.LegitAutoFarm == true then
				testBalls = workspace.Balls:GetChildren()
				while #testBalls ~= 2 do task.wait() end
				CalculatedDistance = (_G.MaxBallPos + (testBalls[1].Velocity.magnitude)) / 3
			else
				temp2:Disconnect()
			end
		end)
		
		local temp3 = nil
		temp3 = game:GetService("RunService").Stepped:connect(function()
			if _G.LegitAutoFarm == true then
				while CalculatedDistance == nil do task.wait() end
				_G.BallSize = Vector3.new(CalculatedDistance, CalculatedDistance, CalculatedDistance)
			else
				temp3:Disconnect()
			end
		end)
		
		local temp4 = nil
		temp4 = game:GetService("RunService").Stepped:connect(function()
			if _G.LegitAutoFarm == true then
				while CalculatedDistance == nil do task.wait() end

				if (CalculatedDistance > BallPos and (#testBalls == 2 and testBalls[2]:FindFirstChild("ff") and string.sub(tostring(testBalls[2].ff.Color), 3, 3) == "1")) then
					game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
					_G.Parried = true
				end
				while ((#testBalls == 2 and testBalls[2]:FindFirstChild("ff") and string.sub(tostring(testBalls[2].ff.Color), 3, 3) == "1")) do
					task.wait()
				end
				if #testBalls == 2 and testBalls[1].Velocity.magnitude > 160 and game.Players.LocalPlayer:DistanceFromCharacter(testBalls[1].Position) > 40 then task.wait(0.3) end
				_G.Parried = false
			else
				temp4:Disconnect()
			end
		end)

		spawn(function()
			while _G.LegitAutoFarm == true and task.wait() do
				if testBalls ~= nil and #testBalls == 2 and testBalls[1].Velocity.magnitude < 1 and ((testBalls[2]:FindFirstChild("ff") and string.sub(tostring(testBalls[2].ff.Color), 3, 3) == "1")) then
					_G.Parried = false

					while testBalls[1].Velocity.magnitude < 5 do task.wait() end

					while CalculatedDistance == nil do task.wait() end

					if (CalculatedDistance > BallPos and (#testBalls == 2 and testBalls[2]:FindFirstChild("ff") and string.sub(tostring(testBalls[2].ff.Color), 3, 3) == "1")) then
						game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
						_G.Parried = true
					end

					while ((#testBalls == 2 and testBalls[2]:FindFirstChild("ff") and string.sub(tostring(testBalls[2].ff.Color), 3, 3) == "1")) do
						task.wait()
					end
					if #testBalls == 2 and testBalls[1].Velocity.magnitude > 160 and game.Players.LocalPlayer:DistanceFromCharacter(testBalls[1].Position) > 40 then task.wait(0.3) end
					_G.Parried = false
				end
			end
		end)
	end
})

local Slider = Tab:Slider({
	name = "Auto Parry Distance",
	minimum = 40,
	maximum = 53,
	default = 40,
	valuename = "Studs",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		_G.MaxBallPos = Value
	end
})

local Toggle = Tab:Toggle({
	name = "Anti AFK Mode",
	callback = function(Value)
		_G.AntiAFKMode = Value
		spawn (function()
			while _G.AntiAFKMode == true and task.wait(0.5) do
				game:GetService("ReplicatedStorage").Remotes.ChangedAfkMode:FireServer(false)
			end
		end)
	end
})

Tab:Section({
	text = "Aimbot"
})

local Toggle = Tab:Toggle({
	name = "Aimbot to the Ball",
	callback = function(Value)
		_G.BallAimbot = Value
		spawn (function()
			while _G.BallAimbot == true and task.wait() do
				pcall(function()
					for _,ball in next, workspace.Balls:GetChildren() do
						if ball then
							game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(ball.Position.X, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y, ball.Position.Z))
						end
					end
				end)
			end
		end)
	end
})

local Toggle = Tab:Toggle({
	name = "Aimbot to the Closest Player",
	callback = function(Value)
		_G.PlayerAimbot = Value
		spawn (function()
			while _G.PlayerAimbot == true and task.wait() do
				pcall(function()
					game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
					while game.workspace.Alive:GetChildren() == nil do task.wait() end
					if game.workspace.Alive:GetChildren() ~= nil then
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(ClosestPart(workspace.Alive).HumanoidRootPart.Position.X, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y, ClosestPart(workspace.Alive).HumanoidRootPart.Position.Z))
					end
				end)
			end
		end)
	end
})

Tab:Section({
	text = "Visuals"
})

local Toggle = Tab:Toggle({
	name = "Ball Tracer",
	callback = function(Value)
		_G.BallTracersOn = Value
		if _G.BallTracersOn == true then
			local testtest = nil
			testtest = game:GetService("RunService").Stepped:connect(function()
				if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Beam1") then
					beam = Instance.new('Beam', game.Players.LocalPlayer.Character.HumanoidRootPart)
					beam.Width0 = 0.05
					beam.Width1 = 0.05
					beam.Transparency = NumberSequence.new(0,0)
					beam.Name = 'Beam1'
					beam.FaceCamera = true
					beam.Color = ColorSequence.new(Color3.fromRGB(255,0,0), Color3.fromRGB(255,0,0))
				end
				if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PlayerTracer1") then
					local one = Instance.new('Attachment', game.Players.LocalPlayer.Character.HumanoidRootPart)
					one.Name = "PlayerTracer1"
				end
				if _G.BallTracersOn then
					ballTracers()
				else
					for i,v in pairs(workspace.Balls:GetChildren()) do
						if v:FindFirstChild("BallTracer") then
							v.BallTracer:Destroy()
						end
					end
					testtest:Disconnect()
				end
			end)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Ball Target Tracer",
	callback = function(Value)
		_G.PlayersTracersOn = Value
		if _G.PlayersTracersOn == true then
			local testtest2 = nil
			testtest2 = game:GetService("RunService").Stepped:connect(function()
				if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Beam2") then
					beam = Instance.new('Beam', game.Players.LocalPlayer.Character.HumanoidRootPart)
					beam.Width0 = 0.05
					beam.Width1 = 0.05
					beam.Transparency = NumberSequence.new(0,0)
					beam.Name = 'Beam2'
					beam.FaceCamera = true
					beam.Color = ColorSequence.new(Color3.fromRGB(0,0,255), Color3.fromRGB(0,0,255))
				end
				if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PlayerTracer2") then
					local one = Instance.new('Attachment', game.Players.LocalPlayer.Character.HumanoidRootPart)
					one.Name = "PlayerTracer2"
				end
				if _G.PlayersTracersOn == true then
					playersTracers()
				elseif _G.PlayersTracersOn == false then
					for count = 1, 10, 1 do
						for i,v in pairs(workspace.Alive:GetChildren()) do
							if v.HumanoidRootPart:FindFirstChild("TargetTracer") then
								v.HumanoidRootPart.TargetTracer:Destroy()
							end
						end

						for i,v in pairs(workspace.Dead:GetChildren()) do
							if v.HumanoidRootPart:FindFirstChild("TargetTracer") then
								v.HumanoidRootPart.TargetTracer:Destroy()
							end
						end
					end
					testtest2:Disconnect()
				end
			end)
		end
	end
})

Tab:Section({
	text = "Auto Vote"
})

local Toggle = Tab:Toggle({
	name = "Auto Vote Classic Mode",
	callback = function(Value)
		_G.FFA = Value
		spawn (function()
			while _G.FFA == true and task.wait(0.1) do
				game:GetService("ReplicatedStorage").Remotes.UpdateVotes:FireServer("ffa")
			end
		end)
	end
})

local Toggle = Tab:Toggle({
	name = "Auto Vote 2 Teams Mode",
	callback = function(Value)
		_G.TwoTeams = Value
		spawn (function()
			while _G.TwoTeams == true and task.wait(0.1) do
				game:GetService("ReplicatedStorage").Remotes.UpdateVotes:FireServer("2t")
			end
		end)
	end
})

local Toggle = Tab:Toggle({
	name = "Auto Vote 4 Teams Mode",
	callback = function(Value)
		_G.FourTeams = Value
		spawn (function()
			while _G.FourTeams == true and task.wait(0.1) do
				game:GetService("ReplicatedStorage").Remotes.UpdateVotes:FireServer("4t")
			end
		end)
	end
})

Tab:Section({
	text = "Auto Buy Things"
})

local Toggle = Tab:Toggle({
	name = "Auto Buy Explosion Crates",
	callback = function(Value)
		_G.AutoExplosion = Value
		spawn (function()
			while _G.AutoExplosion == true and task.wait(0.1) do
				game:GetService("ReplicatedStorage").Remotes.Store.RequestOpenExplosionBox:InvokeServer()
			end
		end)
	end
})

local Toggle = Tab:Toggle({
	name = "Auto Buy Weapon Crates",
	callback = function(Value)
		_G.AutoWeapon = Value
		spawn (function()
			while _G.AutoWeapon == true and task.wait(0.1) do
				game:GetService("ReplicatedStorage").Remotes.Store.RequestOpenSwordBox:InvokeServer()
			end
		end)
	end
})

local Toggle = Tab:Toggle({
	name = "Auto Buy Spins",
	callback = function(Value)
		_G.AutoSpins = Value
		spawn (function()
			while _G.AutoSpins == true and task.wait(0.1) do
				game:GetService("ReplicatedStorage").Remotes.BuySpinCoins:FireServer()
			end
		end)
	end
})

local Tab = Main:CreateTab({
	name = "Teleport",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Teleport to Lobby / Current Map"
})

local Button = Tab:Button({
	name = "Lobby",
	callback = (function()
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == game.Players.LocalPlayer.Name and v:FindFirstChild("HumanoidRootPart") then
				v.HumanoidRootPart.CFrame = CFrame.new(-283.054, 123.3, 155.944)
			end
		end
	end)
})

local Button = Tab:Button({
	name = "Current Map",
	callback = (function()
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == game.Players.LocalPlayer.Name and v:FindFirstChild("HumanoidRootPart") then
				v.HumanoidRootPart.CFrame = CFrame.new(-274.802, 120.687, -69.2022)
			end
		end
	end)
})

Tab:Section({
	text = "Teleport to Game Places"
})

local Button = Tab:Button({
	name = "Normal Players",
	callback = (function()
		game:GetService("TeleportService"):Teleport(13772394625)
	end)
})

local Button = Tab:Button({
	name = "Pro Server",
	callback = (function()
		game:GetService("TeleportService"):Teleport(14732610803)
	end)
})

local Button = Tab:Button({
	name = "AFK World",
	callback = (function()
		game:GetService("TeleportService"):Teleport(14368557094)
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
	name = "Get Gamepass Emote Effect",
	callback = (function()
		game:GetService("ReplicatedStorage").Remotes.CustomEmote:FireServer(true, "Empyrean")
	end)
})

local Button = Tab:Button({
	name = "Redeem All Codes",
	callback = (function()
		game:GetService("ReplicatedStorage").Remotes.SubmitCodeRequest:InvokeServer("HOTDOG10K")
		game:GetService("ReplicatedStorage").Remotes.SubmitCodeRequest:InvokeServer("1MLIKES")
		game:GetService("ReplicatedStorage").Remotes.SubmitCodeRequest:InvokeServer("UPDATETHREE")
	end)
})
