if game.PlaceId == 155615604 then -- Prizon Life
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Prison Life | LimeHub", "Sentinel")
    -- MAIN
    local Main = Window:NewTab("Credits")
    local MainSection = Main:NewSection("Lime Hub Credits")

    MainSection:NewLabel("Made by KL_Offical#4153")

    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Gun")
    local MiscSection = Main:NewSection("Misc")

    MiscSection:NewButton("Btools", "Gives you Btools", function()
        local tool1 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
        local tool3 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
        tool1.BinType = "Clone"
        tool3.BinType = "Hammer"
    end)

    MiscSection:NewButton("Arrest Crims", "Arrest all Crims in map", function()
        local Player = game.Players.LocalPlayer
        local cpos = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
        if v.Name ~= Player.Name then
        local i = 10
            repeat
            wait()
            i = i-1
            game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
            Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            until i == 0
        end
        end
        Player.Character.HumanoidRootPart.CFrame = cpos
    end)

    MiscSection:NewButton("Remove Walls", "Remove all walls", function()
        wait(0.1)
        game.Workspace.Prison_Halls.roof:Remove()
        wait(0.1)
        game.Workspace.Prison_Halls.outlines:Remove()
        wait(0.1)
        game.Workspace.Prison_Halls.lights:Remove()
        wait(0.1)
        Workspace.Prison_Halls.accent:Remove()
        wait(0.1)
        game.Workspace.Prison_Halls.glass:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.b_front:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.doors:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.c_tables:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.a_front:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.b_outerwall:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.c_wall:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.b_wall:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.c_hallwall:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.a_outerwall:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.b_ramp:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.a_ramp:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.a_walls:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.Cells_B:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.Cells_A:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.c_corner:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.Wedge:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.a_ceiling:Remove()
        wait(0.1)
        game.Workspace.Prison_Cellblock.b_ceiling:Remove()
        wait(0.1)
        game.Workspace.City_buildings:Remove()
        wait(0.1)
        game.Workspace.Prison_OuterWall:Remove()
        wait(0.1)
        game.Workspace.Prison_Fences:Remove()
    end)

    MiscSection:NewButton("Super Punch", "Can punch, then kill peoples", function()
        mainRemotes = game.ReplicatedStorage meleeRemote = mainRemotes['meleeEvent'] mouse = game.Players.LocalPlayer:GetMouse() punching = false cooldown = false function punch() cooldown = true local part = Instance.new("Part", game.Players.LocalPlayer.Character) part.Transparency = 1 part.Size = Vector3.new(5, 2, 3) part.CanCollide = false local w1 = Instance.new("Weld", part) w1.Part0 = game.Players.LocalPlayer.Character.Torso w1.Part1 = part w1.C1 = CFrame.new(0,0,2) part.Touched:connect(function(hit) if game.Players:FindFirstChild(hit.Parent.Name) then local plr = game.Players:FindFirstChild(hit.Parent.Name) if plr.Name ~= game.Players.LocalPlayer.Name then part:Destroy() for i = 1,100 do meleeRemote:FireServer(plr) end end end end) wait(1) cooldown = false part:Destroy() end mouse.KeyDown:connect(function(key) if cooldown == false then if key:lower() == "f" then punch() end end end)
    end)

    MainSection:NewDropdown("Give Gun", "Gives the localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)

    MainSection:NewDropdown("Gun Mod", "Makes the gun op", {"M9", "Remington 870", "AK-47"}, function(v)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.000001
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.000001
            module["AutoFire"] = true
        end
    end)

    -- PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")
    local TeamSection = Player:NewSection("Team")

    PlayerSection:NewSlider("Walk Speed", "Changes the Walk Speed", 500, 0, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

    PlayerSection:NewSlider("Jump power", "Changes the Jump Power", 500, 0, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)

    PlayerSection:NewButton("Fast Respawn", "You can respawn very fast", function()
        local A_1 = "\66\114\111\121\111\117\98\97\100\100"
        local Event = game:GetService("Workspace").Remote.loadchar
        Event:InvokeServer(A_1)
    end)

    PlayerSection:NewButton("Invisible Character", "Makes you invisible", function()
        local player = game.Players.LocalPlayer
        position     = player.Character.HumanoidRootPart.Position
        wait(0.1)
        player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
        wait(0.1)
        humanoidrootpart = player.Character.HumanoidRootPart:clone()
        wait(0.1)
        player.Character.HumanoidRootPart:Destroy()
        humanoidrootpart.Parent = player.Character
        player.Character:MoveTo(position)
        wait()
        game.Players.LocalPlayer.Character.Torso.Transparency = 1
        game.Players.LocalPlayer.Character.Head.Transparency  = 1
        game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
        game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1
        game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
        game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
        game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
        game.Players.LocalPlayer.Character.Head.face:Remove()
    end)

    TeamSection:NewButton("Guard", "You can be Guard", function()
        workspace.Remote.TeamEvent:FireServer("Bright blue")
    end)

    TeamSection:NewButton("Inmate", "You can be Inmate", function()
        workspace.Remote.TeamEvent:FireServer("Bright orange")
    end)
    
    TeamSection:NewButton("Netural", "You can be Netural", function()
        Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end)

    TeamSection:NewButton("Criminal", "You can be Criminal", function()
        wait(0.3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976.125183, 109.123924, 2059.99536)

        wait(0.3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.77,100,2379.07)
    end)

    local Tp = Window:NewTab("Teleport")
    local TpSection = Tp:NewSection("Teleports")

    TpSection:NewButton("Prizon", "Teleport to Prizon", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.77,100,2379.07)
    end)
    
    TpSection:NewButton("Crim Base", "Teleport to Crim Base", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943.46,94.13,2063.63)
    end)

    TpSection:NewButton("Yard", "Teleport to Yard", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.87,98,2458.93)
    end)

elseif game.PlaceId == 3956818381 then --Ninja Legends
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Ninja Legends | LimeHub", "Sentinel")

    -- MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")

    MainSection:NewToggle("Auto Swing", "Make your player autoswing", function(v)
        getgenv().autoswing = v
        while true do
            if not getgenv().autoswing then return end
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:FindFirstChild("ninjitsuGain") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    break
                end
            end
            local A_1 = "swingKatana"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1)
            wait(0.1)
        end
    end)

    MainSection:NewToggle("Auto Sell", "Makes your player autosell", function(v)
        getgenv().autosell = v
        while true do
            if getgenv().autoswing == false then return end
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(0.1)
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
            wait(0.1)
        end
    end)

    MainSection:NewButton("Unlock all islands", "Unlocks all islands", function()
        local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(0.1)
        end
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
    end)
    
    MainSection:NewToggle("Auto buy all swords", "Auto buys all swords", function(v)
        getgenv().buyswords = v
        while true do
            if not getgenv().buyswords then return end
            local A_1 = "buyAllSwords"
            local A_2 = "Inner Peace Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
    end)

    MainSection:NewToggle("Auto buy all belts", "Auto buys all belts", function(v)
        getgenv().buybelts = v
        while true do
            if not getgenv().buybelts then return end
            local A_1 = "buyAllBelts"
            local A_2 = "Inner Peace Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
    end)
end