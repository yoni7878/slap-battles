local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Initialize managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

local Window = Fluent:CreateWindow({
    Title = "Level Hub: Slap Battles" .. Fluent.Version,
    SubTitle = identifyexecutor(),
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "hand" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Farm = Window:AddTab({ Title = "Farm", Icon = "book"}),
    Anti = Window:AddTab({ Title = "Anti", Icon = "shield" }), -- New Anti tab
	Badges = Window:AddTab({ Title = "Badges", Icon = "check"}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Game variables
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
gloveHits = {
    ["Default"] = game.ReplicatedStorage.b,
    ["Extended"] = game.ReplicatedStorage.b,
    -----------// Glove Hit General Or New Glove \\-----------
    ["T H I C K"] = game.ReplicatedStorage.GeneralHit,
    ["Squid"] = game.ReplicatedStorage.GeneralHit,
    ["Gummy"] = game.ReplicatedStorage.GeneralHit,
    ["RNG"] = game.ReplicatedStorage.GeneralHit,
    ["Tycoon"] = game.ReplicatedStorage.GeneralHit,
    ["Charge"] = game.ReplicatedStorage.GeneralHit,
    ["Baller"] = game.ReplicatedStorage.GeneralHit,
    ["Tableflip"] = game.ReplicatedStorage.GeneralHit,
    ["Booster"] = game.ReplicatedStorage.GeneralHit,
    ["Shield"] = game.ReplicatedStorage.GeneralHit,
    ["Track"] = game.ReplicatedStorage.GeneralHit,
    ["Goofy"] = game.ReplicatedStorage.GeneralHit,
    ["Confusion"] = game.ReplicatedStorage.GeneralHit,
    ["Elude"] = game.ReplicatedStorage.GeneralHit,
    ["Glitch"] = game.ReplicatedStorage.GeneralHit,
    ["Snowball"] = game.ReplicatedStorage.GeneralHit,
    ["fish"] = game.ReplicatedStorage.GeneralHit,
    ["Killerfish"] = game.ReplicatedStorage.GeneralHit,
    ["🗿"] = game.ReplicatedStorage.GeneralHit,
    ["Obby"] = game.ReplicatedStorage.GeneralHit,
    ["Voodoo"] = game.ReplicatedStorage.GeneralHit,
    ["Leash"] = game.ReplicatedStorage.GeneralHit,
    ["Flamarang"] = game.ReplicatedStorage.GeneralHit,
    ["Berserk"] = game.ReplicatedStorage.GeneralHit,
    ["Quake"] = game.ReplicatedStorage.GeneralHit,
    ["Rattlebones"] = game.ReplicatedStorage.GeneralHit,
    ["Chain"] = game.ReplicatedStorage.GeneralHit,
    ["Ping Pong"] = game.ReplicatedStorage.GeneralHit,
    ["Whirlwind"] = game.ReplicatedStorage.GeneralHit,
    ["Slicer"] = game.ReplicatedStorage.GeneralHit,
    ["Counter"] = game.ReplicatedStorage.GeneralHit,
    ["Hammer"] = game.ReplicatedStorage.GeneralHit,
    ["Excavator"] = game.ReplicatedStorage.GeneralHit,
    ["Home Run"] = game.ReplicatedStorage.GeneralHit,
    ["Psycho"] = game.ReplicatedStorage.GeneralHit,
    ["Kraken"] = game.ReplicatedStorage.GeneralHit,
    ["Gravity"] = game.ReplicatedStorage.GeneralHit,
    ["Lure"] = game.ReplicatedStorage.GeneralHit,
    ["Jebaited"] = game.ReplicatedStorage.GeneralHit,
    ["Meteor"] = game.ReplicatedStorage.GeneralHit,
    ["Tinkerer"] = game.ReplicatedStorage.GeneralHit,    
    ["Guardian Angel"] = game.ReplicatedStorage.GeneralHit,
    ["Sun"] = game.ReplicatedStorage.GeneralHit,
    ["Necromancer"] = game.ReplicatedStorage.GeneralHit,
    ["Zombie"] = game.ReplicatedStorage.GeneralHit,
    ["Dual"] = game.ReplicatedStorage.GeneralHit,
    ["Alchemist"] = game.ReplicatedStorage.GeneralHit,
    ["Parry"] = game.ReplicatedStorage.GeneralHit,
    ["Druid"] = game.ReplicatedStorage.GeneralHit,
    ["Oven"] = game.ReplicatedStorage.GeneralHit,
    ["Jester"] = game.ReplicatedStorage.GeneralHit,
    ["Ferryman"] = game.ReplicatedStorage.GeneralHit,
    ["Scythe"] = game.ReplicatedStorage.GeneralHit,
    ["Blackhole"] = game.ReplicatedStorage.GeneralHit,
    ["Santa"] = game.ReplicatedStorage.GeneralHit,
    ["Grapple"] = game.ReplicatedStorage.GeneralHit,
    ["Iceskate"] = game.ReplicatedStorage.GeneralHit,
    ["Pan"] = game.ReplicatedStorage.GeneralHit,
    ["Blasphemy"] = game.ReplicatedStorage.GeneralHit,
    ["Blink"] = game.ReplicatedStorage.GeneralHit,
    ["Ultra Instinct"] = game.ReplicatedStorage.GeneralHit,
    ["Admin"] = game.ReplicatedStorage.GeneralHit,
    ["Prop"] = game.ReplicatedStorage.GeneralHit,
    ["Joust"] = game.ReplicatedStorage.GeneralHit,
    ["Slapstick"] = game.ReplicatedStorage.GeneralHit,
    ["Firework"] = game.ReplicatedStorage.GeneralHit,
    ["Run"] = game.ReplicatedStorage.GeneralHit,
    ["Beatdown"] = game.ReplicatedStorage.GeneralHit,
    ["L.O.L.B.O.M.B"] = game.ReplicatedStorage.GeneralHit,
    ["Glovel"] = game.ReplicatedStorage.GeneralHit,
    ["Chicken"] = game.ReplicatedStorage.GeneralHit,
    ["Divebomb"] = game.ReplicatedStorage.GeneralHit,
    ["Lamp"] = game.ReplicatedStorage.GeneralHit,
    ["Pocket"] = game.ReplicatedStorage.GeneralHit,
    ["BONK"] = game.ReplicatedStorage.GeneralHit,
    ["Knockoff"] = game.ReplicatedStorage.GeneralHit,
    ["Divert"] = game.ReplicatedStorage.GeneralHit,
    ["Frostbite"] = game.ReplicatedStorage.GeneralHit,
    ["Sbeve"] = game.ReplicatedStorage.GeneralHit,
    ["Plank"] = game.ReplicatedStorage.GeneralHit,
    ["Golem"] = game.ReplicatedStorage.GeneralHit,
    ["Spoonful"] = game.ReplicatedStorage.GeneralHit,
    ["Grab"] = game.ReplicatedStorage.GeneralHit,
    ["the schlop"] = game.ReplicatedStorage.GeneralHit,
    ["UFO"] = game.ReplicatedStorage.GeneralHit,
    ["el gato"] = game.ReplicatedStorage.GeneralHit,
    ["Siphon"] = game.ReplicatedStorage.GeneralHit,
    ["Hive"] = game.ReplicatedStorage.GeneralHit,
    ["Wrench"] = game.ReplicatedStorage.GeneralHit,
    ["Hunter"] = game.ReplicatedStorage.GeneralHit,
    ["Relude"] = game.ReplicatedStorage.GeneralHit,
    ["Avatar"] = game.ReplicatedStorage.GeneralHit,
    ["Demolition"] = game.ReplicatedStorage.GeneralHit,
    ["Shotgun"] = game.ReplicatedStorage.GeneralHit,
    ["Beachball"] = game.ReplicatedStorage.GeneralHit,
    -----------// Glove Hit Normal Or New Glove \\-----------
    ["ZZZZZZZ"] = game.ReplicatedStorage.ZZZZZZZHit,
    ["Brick"] = game.ReplicatedStorage.BrickHit,
    ["Snow"] = game.ReplicatedStorage.SnowHit,
    ["Pull"] = game.ReplicatedStorage.PullHit,
    ["Flash"] = game.ReplicatedStorage.FlashHit,
    ["Spring"] = game.ReplicatedStorage.springhit,
    ["Swapper"] = game.ReplicatedStorage.HitSwapper,
    ["Bull"] = game.ReplicatedStorage.BullHit,
    ["Dice"] = game.ReplicatedStorage.DiceHit,
    ["Ghost"] = game.ReplicatedStorage.GhostHit,
    ["Thanos"] = game.ReplicatedStorage.GeneralHit,
    ["Stun"] = game.ReplicatedStorage.HtStun,
    ["Za Hando"] = game.ReplicatedStorage.zhramt,
    ["Fort"] = game.ReplicatedStorage.Fort,
    ["Magnet"] = game.ReplicatedStorage.MagnetHIT,
    ["Pusher"] = game.ReplicatedStorage.PusherHit,
    ["Anchor"] = game.ReplicatedStorage.hitAnchor,
    ["Space"] = game.ReplicatedStorage.HtSpace,
    ["Boomerang"] = game.ReplicatedStorage.BoomerangH,
    ["Speedrun"] = game.ReplicatedStorage.Speedrunhit,
    ["Mail"] = game.ReplicatedStorage.MailHit,
    ["Golden"] = game.ReplicatedStorage.GoldenHit,
    ["MR"] = game.ReplicatedStorage.MisterHit,
    ["Reaper"] = game.ReplicatedStorage.ReaperHit,
    ["Replica"] = game.ReplicatedStorage.ReplicaHit,
    ["Defense"] = game.ReplicatedStorage.DefenseHit,
    ["Killstreak"] = game.ReplicatedStorage.KSHit,
    ["Reverse"] = game.ReplicatedStorage.ReverseHit,
    ["Shukuchi"] = game.ReplicatedStorage.ShukuchiHit,
    ["Duelist"] = game.ReplicatedStorage.DuelistHit,
    ["woah"] = game.ReplicatedStorage.woahHit,
    ["Ice"] = game.ReplicatedStorage.IceHit,
    ["Adios"] = game.ReplicatedStorage.hitAdios,
    ["Blocked"] = game.ReplicatedStorage.BlockedHit,
    ["Engineer"] = game.ReplicatedStorage.engiehit,
    ["Rocky"] = game.ReplicatedStorage.RockyHit,
    ["Conveyor"] = game.ReplicatedStorage.ConvHit,
    ["STOP"] = game.ReplicatedStorage.STOP,
    ["Phantom"] = game.ReplicatedStorage.PhantomHit,
    ["Wormhole"] = game.ReplicatedStorage.WormHit,
    ["Acrobat"] = game.ReplicatedStorage.AcHit,
    ["Plague"] = game.ReplicatedStorage.PlagueHit,
    ["[REDACTED]"] = game.ReplicatedStorage.ReHit,
    ["bus"] = game.ReplicatedStorage.hitbus,
    ["Phase"] = game.ReplicatedStorage.PhaseH,
    ["Warp"] = game.ReplicatedStorage.WarpHt,
    ["Bomb"] = game.ReplicatedStorage.BombHit,
    ["Bubble"] = game.ReplicatedStorage.BubbleHit,
    ["Jet"] = game.ReplicatedStorage.JetHit,
    ["Shard"] = game.ReplicatedStorage.ShardHIT,
    ["potato"] = game.ReplicatedStorage.potatohit,
    ["CULT"] = game.ReplicatedStorage.CULTHit,
    ["bob"] = game.ReplicatedStorage.bobhit,
    ["Buddies"] = game.ReplicatedStorage.buddiesHIT,
    ["Spy"] = game.ReplicatedStorage.SpyHit,
    ["Detonator"] = game.ReplicatedStorage.DetonatorHit,
    ["Rage"] = game.ReplicatedStorage.GRRRR,
    ["Trap"] = game.ReplicatedStorage.traphi,
    ["Orbit"] = game.ReplicatedStorage.Orbihit,
    ["Hybrid"] = game.ReplicatedStorage.HybridCLAP,
    ["Slapple"] = game.ReplicatedStorage.SlappleHit,
    ["Disarm"] = game.ReplicatedStorage.DisarmH,
    ["Dominance"] = game.ReplicatedStorage.DominanceHit,
    ["Link"] = game.ReplicatedStorage.LinkHit,
    ["Rojo"] = game.ReplicatedStorage.RojoHit,
    ["rob"] = game.ReplicatedStorage.robhit,
    ["Rhythm"] = game.ReplicatedStorage.rhythmhit,
    ["Nightmare"] = game.ReplicatedStorage.nightmarehit,
    ["Hitman"] = game.ReplicatedStorage.HitmanHit,
    ["Thor"] = game.ReplicatedStorage.ThorHit,
    ["Retro"] = game.ReplicatedStorage.RetroHit,
    ["Cloud"] = game.ReplicatedStorage.CloudHit,
    ["Null"] = game.ReplicatedStorage.NullHit,
    ["spin"] = game.ReplicatedStorage.spinhit,
    -----------// Glove Hit Stun \\-----------
    ["Kinetic"] = game.ReplicatedStorage.HtStun,
    ["Recall"] = game.ReplicatedStorage.HtStun,
    ["Balloony"] = game.ReplicatedStorage.HtStun,
    ["Sparky"] = game.ReplicatedStorage.HtStun,
    ["Boogie"] = game.ReplicatedStorage.HtStun,
    ["Stun"] = game.ReplicatedStorage.HtStun,
    ["Coil"] = game.ReplicatedStorage.HtStun,
    -----------// Glove Hit Diamond \\-----------
    ["Diamond"] = game.ReplicatedStorage.DiamondHit,
    ["Megarock"] = game.ReplicatedStorage.DiamondHit,
    -----------// Glove Hit Celestial \\-----------
    ["Moon"] = game.ReplicatedStorage.CelestialHit,
    ["Jupiter"] = game.ReplicatedStorage.CelestialHit,
    -----------// Glove Hard \\-----------
    ["Mitten"] = game.ReplicatedStorage.MittenHit,
    ["Hallow Jack"] = game.ReplicatedStorage.HallowHIT,
    -----------// Glove Hit Power \\-----------
    ["OVERKILL"] = game.ReplicatedStorage.Overkillhit,
    ["The Flex"] = game.ReplicatedStorage.FlexHit,
    ["Custom"] = game.ReplicatedStorage.CustomHit,
    ["God's Hand"] = game.ReplicatedStorage.Godshand,
    ["Error"] = game.ReplicatedStorage.Errorhit
}

-- Visualizer part
local visualizer = Instance.new("Part")
visualizer.Shape = Enum.PartType.Cylinder
visualizer.Material = Enum.Material.Neon
visualizer.Color = Color3.fromRGB(0, 170, 255)
visualizer.Transparency = 0.7
visualizer.Anchored = true
visualizer.CanCollide = false
visualizer.Size = Vector3.new(0.2, 10, 10)
visualizer.Parent = workspace
visualizer.Transparency = 1

-- Auto Farm Tab
local FarmPlayersToggle = Tabs.Farm:AddToggle("FarmPlayers", {
    Title = "Auto Farm Players",
    Description = "Automatically teleport to and slap players (not in lobby!)",
    Default = false
})

local FarmSlapplesToggle = Tabs.Farm:AddToggle("FarmSlapples", {
    Title = "Auto Farm Slapples",
    Description = "Automatically collect slapples in Arena",
    Default = false
})

local SlappleDelaySlider = Tabs.Farm:AddSlider("SlappleDelay", {
    Title = "Slapple Collection Delay",
    Description = "Delay between slapple collections",
    Default = 0.5,
    Min = 0.1,
    Max = 2,
    Rounding = 1
})

-- Badges Tab
local eludeParagraph = Tabs.Badges:AddParagraph({
    Title = "Elude Badge Code Calculator",
    Content = "Calculating current code..."
})

Tabs.Badges:AddButton({
    Title = "Go to Elude",
    Description = "Finish the Elude Maze",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "You'll be teleported to the Elude Maze.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        -- Check if already in Elude
                        if game.PlaceId == 11828384869 then
                            Fluent:Notify({ Title = "Error", Content = "Already in Elude!", Duration = 3 })
                            return
                        end

                        -- Queue teleport script (using [====[ ]====] syntax for nested blocks)
                        local teleportFunc = queueonteleport or queue_on_teleport or (syn and syn.queue_on_teleport)
                        if teleportFunc then
                            teleportFunc([===[
                                if not game:IsLoaded() then
                                    game.Loaded:Wait()
                                end
                                
                                local player = game.Players.LocalPlayer
                                repeat task.wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                                
                                local hrp = player.Character.HumanoidRootPart
                                
                                -- Teleport sequence
                                local teleports = {
                                    {CFrame.new(-193.290787, 7.39999914, -130.307114, 0.454088956, 0, 0.890956342, 0, 1, 0, -0.890956342, 0, 0.454088956), 1},
                                    {CFrame.new(84.8454437, 7.39999914, -201.827698, 0.694604456, 0, 0.719391882, 0, 1, 0, -0.719391882, 0, 0.694604456), 1},
                                    {CFrame.new(218.528198, 7.39999914, 83.4171371, 0.655885577, 0, 0.754860282, 0, 1, 0, -0.754860282, 0, 0.655885577), 1},
                                    {CFrame.new(104.568184, 10.5492659, 194.721115, 0.990249932, 0, 0.0258003082, 0, 1, 0, -0.139280856, 0, 0.990249932), 2},
                                    {CFrame.new(-502.335632, 14.2279472, -179.596512), 0}
                                }
                                
                                for _, data in ipairs(teleports) do
                                    hrp.CFrame = data[1]
                                    if data[2] > 0 then
                                        task.wait(data[2])
                                    end
                                end
                            ]===])
                        end

                        -- Attempt teleport
                        local success, err = pcall(function()
                            game:GetService("TeleportService"):Teleport(11828384869)
                        end)
                        
                        if not success then
                            Fluent:Notify({ Title = "Teleport Failed", Content = tostring(err), Duration = 5 })
                        end
                        print("Confirmed the dialog.")
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Badges:AddButton({
        Title = "Brazil Badge",
        Description = "Get Brazil",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "You're going to get kicked.",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
						 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Lobby.brazil.portal.CFrame
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Badges:AddButton({
        Title = "Get Duck, The Lone Orange, Court Evidence Badge",
        Description = "Get clickdetector badges",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "They're cool so press confirm.",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
						        fireclickdetector(workspace.Arena["default island"]["Rubber Ducky"].ClickDetector)
        						fireclickdetector(workspace.Lobby.Scene.knofe.ClickDetector)
        						fireclickdetector(workspace.Arena.island5.Orange.ClickDetector)

                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Badges:AddButton({
    Title = "Get Retro",
    Description = "Equip Recall",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "You're going to be teleported.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Recall" then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.FinishDoor_Retro.Part.CFrame
                        else
                            local dialog = Window:Dialog({
                                Title = "You need Recall equipped for this.",
                                Content = "This will close automatically in 3 seconds.",
                                Buttons = {
                                    {
                                        Title = "Cancel",
                                        Callback = function()
                                            print("Cancelled manually.")
                                        end
                                    }
                                }
                            })

                            -- Auto-close after 3 seconds
                            task.delay(3, function()
                                if dialog then
                                    dialog:Destroy()
                                    print("Dialog auto-closed after 3 seconds.")
                                end
                            end)
                        end
                        print("Confirmed the dialog.")
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Badges:AddButton({
    Title = "Get Plank",
    Description = "Equip Fort",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "yeah",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
                            local char = game.Players.LocalPlayer.Character
                            local hrp = char and char:FindFirstChild("HumanoidRootPart")

                            if hrp then
                                -- Do the sequence
                                hrp.CFrame = CFrame.new(8, 97, 4)
                                task.wait(0.2)
                                hrp.Anchored = true
                                task.wait(0.3)
                                game:GetService("ReplicatedStorage").Fortlol:FireServer()
                                task.wait(3.5)
                                hrp.Anchored = false
                                task.wait(0.1)
                                hrp.CFrame = CFrame.new(8, 106, -6)
                            else
                                warn("No HumanoidRootPart found.")
                            end
                        else
                            local dialog = Window:Dialog({
                                Title = "You need Fort equipped for this.",
                                Content = "Auto-closing in 3 seconds.",
                                Buttons = {
                                    {
                                        Title = "Cancel",
                                        Callback = function()
                                            print("Cancelled manually.")
                                        end
                                    }
                                }
                            })

                            -- Auto-close after 3 seconds
                            task.delay(3, function()
                                if dialog then
                                    dialog:Close()
                                    print("Dialog auto-closed after 3 seconds.")
                                end
                            end)
                        end
                        print("Confirmed the dialog.")
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Badges:AddButton({
    Title = "Frostbite Glove",
    Description = "Get Frostbite Glove",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "You're about to teleport to Frostbite.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
                        if teleportFunc then
                            teleportFunc([[
                                if not game:IsLoaded() then
                                    game.Loaded:Wait()
                                end
                                repeat wait() until game.Players.LocalPlayer
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-554, 177, 56)
                                wait(0.7)
                                for _,v in ipairs(workspace:GetDescendants()) do
                                    if v:IsA("ProximityPrompt") then
                                        v.HoldDuration = 0
                                    end
                                end
                                wait(0.5)
                                for _,v in ipairs(workspace:GetDescendants()) do
                                    if v:IsA("ProximityPrompt") then
                                        fireproximityprompt(v)
                                    end
                                end
                            ]])
                        end
                        game:GetService("TeleportService"):Teleport(17290438723)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Teleport cancelled.")
                    end
                }
            }
        })
    end
})

Tabs.Badges:AddButton({
    Title = "Get Admin Badge",
    Description = "Admin",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "You're about to get admin? I wouldn't want that.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        if game:GetService("ReplicatedStorage").Assets.Retro:FindFirstChild("Map") then
                            game.ReplicatedStorage.Assets.Retro.Map.Parent = workspace
                            task.wait(0.4)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16971.7168, 797.600342, 4905.17334, 0.230043754, -4.14069206e-08, 0.973180294, -1.62095546e-08, 1, 4.63797178e-08, -0.973180294, -2.64441837e-08, 0.230043754)
                            task.wait(0.4)
                            fireclickdetector(workspace.Map.RetroObbyMap:GetChildren()[5].StaffApp.Button.ClickDetector)
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16971.7168, 797.600342, 4905.17334, 0.230043754, -4.14069206e-08, 0.973180294, -1.62095546e-08, 1, 4.63797178e-08, -0.973180294, -2.64441837e-08, 0.230043754)
                            task.wait(0.4)
                            fireclickdetector(workspace.Map.RetroObbyMap:GetChildren()[5].StaffApp.Button.ClickDetector)
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Retro badge teleport cancelled.")
                    end
                }
            }
        })
    end
})

Tabs.Badges:AddButton({
    Title = "Lamp Glove",
    Description = "Break lights",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "You should be ready.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        if game.Players.LocalPlayer.leaderstats.Glove.Value == "ZZZZZZZ" then
                            for i = 1,5 do
                                game:GetService("ReplicatedStorage").nightmare:FireServer("LightBroken")
                                task.wait(0.1) -- slight delay so it doesn't crash
                            end
                        else
                            Window:Dialog({
                                Title = "Error",
                                Content = "You must have the ZZZZZZZ glove!",
                                Buttons = {
                                    {
                                        Title = "Okay",
                                        Callback = function()
                                            print("Player didn't have Lamp Glove.")
                                        end
                                    }
                                }
                            })
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the light break.")
                    end
                }
            }
        })
    end
})

local function calculateEludeCode()
    local playerCount = #Players:GetPlayers()
    local code = (playerCount * 25 + 1100) - 7
    return string.format("%03d-%03d-%04d", 
        math.floor(code/1000000) % 1000,
        math.floor(code/1000) % 1000,
        code % 1000)
end

local function updateEludeCode()
    local code = calculateEludeCode()
    eludeParagraph:SetDesc("Current server players: "..#Players:GetPlayers().."\n\n"..
                          "Calculation: (Players × 25) + 1100 - 7\n"..
                          "Current Elude code: "..code)
end

updateEludeCode()
Players.PlayerAdded:Connect(updateEludeCode)
Players.PlayerRemoving:Connect(updateEludeCode)

-- [Previous code continues until after the autoSlapLoop function]

-- Auto Farm Functions
local originalPosition = nil
local farmingSlapples = false
local farmingPlayers = false

local function getSlapples()
    local slapples = {}
    local island = workspace.Arena:FindFirstChild("island5")
    if island then
        for _, slapple in ipairs(slapples) do
    if not Options.FarmSlapples.Value then break end
        character:PivotTo(slapple.CFrame * CFrame.new(0, 3, 0))
        task.wait(Options.SlapDelay.Value)
end
    end
    return slapples
end

local function farmSlapples()
    if farmingSlapples then return end
    farmingSlapples = true
    
    local character = LocalPlayer.Character
    if not character then 
        farmingSlapples = false
        return 
    end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then 
        farmingSlapples = false
        return 
    end
    
    originalPosition = character:GetPivot().Position
    
    while Options.FarmSlapples.Value and not Fluent.Unloaded do
        local slapples = getSlapples()
        
        for _, slapple in ipairs(slapples) do
            if not Options.FarmSlapples.Value then break end
            
            if slapples.Transparency == 1 then
				Options.FarmSlapples.Value = false
			end
            character:PivotTo(slapple.CFrame * CFrame.new(0, 3, 0))
            task.wait(Options.SlappleDelay.Value)
            
            -- Check if we're still supposed to be farming
            if not Options.FarmSlapples.Value then break end
        end
        
        -- Return to original position
        if Options.FarmSlapples.Value then
            character:PivotTo(CFrame.new(originalPosition))
            task.wait(1)
        end
    end
    
    farmingSlapples = false
end

local function farmPlayers()
    if farmingPlayers then return end
    farmingPlayers = true
    
    local character = LocalPlayer.Character
    if not character then 
        farmingPlayers = false
        return 
    end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then 
        farmingPlayers = false
        return 
    end
    
    originalPosition = character:GetPivot().Position
    
    while Options.FarmPlayers.Value and not Fluent.Unloaded do
        for _, player in ipairs(Players:GetPlayers()) do
            if not Options.FarmPlayers.Value then break end
            if player == LocalPlayer then continue end
            
            local targetChar = player.Character
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                -- Teleport to player
                character:PivotTo(targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                task.wait(0.5)
                
                -- Check if we're still supposed to be farming
                if not Options.FarmPlayers.Value then break end
            end
        end
        
        -- Return to original position
        if Options.FarmPlayers.Value then
            character:PivotTo(CFrame.new(originalPosition))
            task.wait(1)
        end
    end
    
    farmingPlayers = false
end

-- Farm Toggle Connections
FarmPlayersToggle:OnChanged(function()
    if Options.FarmPlayers.Value then
        coroutine.wrap(farmPlayers)()
    end
end)

FarmSlapplesToggle:OnChanged(function()
    if Options.FarmSlapples.Value then
        coroutine.wrap(farmSlapples)()
    end
end)

-- Main Tab
Tabs.Main:AddParagraph({
    Title = "Slap Battles Script",
    Content = "Auto slap and player utilities"
})

-- Tool Requirement Toggle
local ToolCheckToggle = Tabs.Main:AddToggle("RequireTool", {
    Title = "Require Tool Equipped",
    Description = "Must have a tool equipped to auto-slap",
    Default = false
})

-- Auto Slap Toggle
local AutoSlapToggle = Tabs.Main:AddToggle("AutoSlap", {
    Title = "Auto Slap",
    Description = "Automatically slaps nearby players",
    Default = false
})

local SlapRangeSlider = Tabs.Main:AddSlider("SlapRange", {
    Title = "Slap Range",
    Description = "How far you can slap (Max: 30)",
    Default = 10,
    Min = 5,
    Max = 30,
    Rounding = 0
})

local SlapSpeedSlider = Tabs.Main:AddSlider("SlapSpeed", {
    Title = "Slap Speed",
    Description = "How fast it detects players (0.1-1 sec)",
    Default = 0.6,
    Min = 0.1,
    Max = 1,
    Rounding = 1
})

local MaxPlayersSlider = Tabs.Main:AddSlider("MaxPlayers", {
    Title = "Max Players to Slap",
    Description = "Maximum players to detect at once",
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 0
})

local VisualizerToggle = Tabs.Main:AddToggle("ShowVisualizer", {
    Title = "Show Range Visualizer",
    Description = "Displays slap range circle",
    Default = false
})

-- Player Tab
local SpeedSlider = Tabs.Player:AddSlider("WalkSpeed", { -- Changed from toggle to slider
    Title = "Walk Speed",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 0
})

local JumpPowerSlider = Tabs.Player:AddSlider("JumpPower", {
    Title = "Jump Power",
    Default = 50,
    Min = 50,
    Max = 200,
    Rounding = 0
})

local HipHeightSlider = Tabs.Player:AddSlider("HipHeight", {
    Title = "Hip Height",
    Default = 0,
    Min = 0,
    Max = 50,
    Rounding = 0
})

-- Anti Tab (NEW)
local AntiVoidToggle = Tabs.Anti:AddToggle("AntiVoid", {
    Title = "Anti Void",
    Description = "Prevents falling into the void",
    Default = false
})

local AntiMegarockToggle = Tabs.Anti:AddToggle("AntiMegarock", {
    Title = "Anti Megarock",
    Description = "Prevents Megarock glove effects",
    Default = false
})

local AntiReverseToggle = Tabs.Anti:AddToggle("AntiReverse", {
    Title = "Anti Reverse",
    Description = "Don't slap players with Reverse glove",
    Default = true
})

local AntiReverseNotifyToggle = Tabs.Anti:AddToggle("AntiReverseNotify", {
    Title = "Reverse Notifications",
    Description = "Show notifications when avoiding Reverse",
    Default = true
})

-- Settings Tab
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
InterfaceManager:SetFolder("fluent_levelhub")
SaveManager:SetFolder("fluent_slap_battles/"..game.PlaceId)

-- Tool and Slap Logic
local antiVoidBlock = nil
local SlapAuraCharacter = "Head"
local autoSlapActive = false

local function hasToolEquipped()
    local character = LocalPlayer.Character
    return character and character:FindFirstChildOfClass("Tool") ~= nil
end

local function shouldSlap()
    return not Options.RequireTool.Value or hasToolEquipped()
end

local function isReversePlayer(player)
    if not Options.AntiReverse.Value then return false end
    local leaderstats = player:FindFirstChild("leaderstats")
    return leaderstats and leaderstats:FindFirstChild("Glove") and leaderstats.Glove.Value == "Reverse"
end

local function checkForMegarocks()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local rock = player.Character:FindFirstChild("rock")
            if rock then
                for _, v in ipairs(rock:GetDescendants()) do
                    if v:IsA("TouchTransmitter") then
                        v:Destroy()
                    end
                end
            end
        end
    end
end

local function updateVisualizer()
    if not visualizer then return end
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local root = character.HumanoidRootPart
        visualizer.CFrame = root.CFrame * CFrame.new(0, -2.5, 0) * CFrame.Angles(0, 0, math.rad(90))
        visualizer.Size = Vector3.new(0.2, Options.SlapRange.Value * 2, Options.SlapRange.Value * 2)
    end
end

-- Anti-Void Logic
local function antiVoidLoop()
    if antiVoidBlock then
        antiVoidBlock:Destroy()
        antiVoidBlock = nil
    end
    
    if not Options.AntiVoid.Value then return end
    
    antiVoidBlock = Instance.new("Part")
    antiVoidBlock.Name = "AntiVoid"
    antiVoidBlock.Size = Vector3.new(1000, 1, 1000)
    antiVoidBlock.Transparency = 0.5
    antiVoidBlock.CanCollide = true
    antiVoidBlock.Anchored = true
    antiVoidBlock.Position = Vector3.new(0, -9, 0)
    antiVoidBlock.Parent = workspace
    
    while Options.AntiVoid.Value and task.wait(0.5) do
        -- Keep the part alive while active
    end
    
    if antiVoidBlock then
        antiVoidBlock:Destroy()
        antiVoidBlock = nil
    end
end

local function autoSlapLoop()
    while autoSlapActive and not Fluent.Unloaded do
        local waitTime = Options.SlapSpeed.Value
        local range = Options.SlapRange.Value
        local maxPlayers = Options.MaxPlayers.Value
        
        if shouldSlap() then
            local targets = {}
            for _, plr in pairs(Players:GetPlayers()) do
                if #targets >= maxPlayers then break end
                
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                    -- Skip Reverse players if AntiReverse is enabled
                    if isReversePlayer(plr) then
                        if Options.AntiReverseNotify.Value then
                            Fluent:Notify({
                                Title = "Anti Reverse",
                                Content = "Avoided slapping "..plr.Name,
                                Duration = 2
                            })
                        end
                        continue
                    end
                    
                    local targetHead = plr.Character.Head
                    local myChar = LocalPlayer.Character
                    
                    if myChar and myChar:FindFirstChild(SlapAuraCharacter) then
                        local myAuraPart = myChar[SlapAuraCharacter]
                        local dist = (myAuraPart.Position - targetHead.Position).Magnitude
                        
                        if dist <= range then
                            table.insert(targets, plr)
                        end
                    end
                end
            end
            
            for _, plr in pairs(targets) do
                local currentGlove = LocalPlayer:FindFirstChild("leaderstats") and LocalPlayer.leaderstats:FindFirstChild("Glove")
                if currentGlove and gloveHits[currentGlove.Value] then
                    gloveHits[currentGlove.Value]:FireServer(plr.Character:WaitForChild(SlapAuraCharacter), true)
                end
            end
        end
        
        task.wait(waitTime)
    end
end

-- Connections
AutoSlapToggle:OnChanged(function()
    autoSlapActive = Options.AutoSlap.Value
    if autoSlapActive then
        if Options.RequireTool.Value and not hasToolEquipped() then
            Fluent:Notify({
                Title = "Auto Slap",
                Content = "Enable 'Require Tool' or equip a tool",
                Duration = 3
            })
            Options.AutoSlap:SetValue(false)
            return
        end
        Fluent:Notify({
            Title = "Auto Slap",
            Content = Options.RequireTool.Value and "Enabled (tool required)" or "Enabled (no tool needed)",
            Duration = 3
        })
        coroutine.wrap(autoSlapLoop)()
    else
        Fluent:Notify({
            Title = "Auto Slap",
            Content = "Disabled auto slapping",
            Duration = 3
        })
    end
end)

AntiVoidToggle:OnChanged(function()
    if Options.AntiVoid.Value then
        Fluent:Notify({
            Title = "Anti Void",
            Content = "Enabled void protection",
            Duration = 3
        })
        coroutine.wrap(antiVoidLoop)()
    else
        Fluent:Notify({
            Title = "Anti Void",
            Content = "Disabled void protection",
            Duration = 3
        })
        if antiVoidBlock then
            antiVoidBlock:Destroy()
            antiVoidBlock = nil
        end
    end
end)

AntiReverseToggle:OnChanged(function()
    Fluent:Notify({
        Title = "Anti Reverse",
        Content = Options.AntiReverse.Value and "Will avoid Reverse gloves" or "Will slap all gloves",
        Duration = 3
    })
end)

ToolCheckToggle:OnChanged(function()
    Fluent:Notify({
        Title = "Tool Check",
        Content = Options.RequireTool.Value and "Now requires tools" or "Tool check disabled",
        Duration = 2
    })
end)

VisualizerToggle:OnChanged(function()
    visualizer.Transparency = Options.ShowVisualizer.Value and 0.7 or 1
end)

SlapRangeSlider:OnChanged(function(value)
    if visualizer then
        visualizer.Size = Vector3.new(0.2, value * 2, value * 2)
    end
end)

SpeedSlider:OnChanged(function(value)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

JumpPowerSlider:OnChanged(function(value)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = value
    end
end)

HipHeightSlider:OnChanged(function(value)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.HipHeight = value
    end
end)

-- Tool monitoring
local function onToolChange()
    if autoSlapActive then
        if Options.RequireTool.Value then
            if hasToolEquipped() then
                Fluent:Notify({
                    Title = "Auto Slap",
                    Content = "Tool equipped - slapping active",
                    Duration = 2
                })
            else
                Fluent:Notify({
                    Title = "Auto Slap",
                    Content = "No tool equipped - pausing",
                    Duration = 2
                })
            end
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then onToolChange() end
    end)
    character.ChildRemoved:Connect(function(child)
        if child:IsA("Tool") then onToolChange() end
    end)
end)

-- Visualizer update loop
RunService.Heartbeat:Connect(function()
    if Options.ShowVisualizer.Value and visualizer.Transparency ~= 1 and LocalPlayer.Character then
        updateVisualizer()
    end
end)

-- Initialize
Window:SelectTab(1)
visualizer.Transparency = Options.ShowVisualizer.Value and 0.7 or 1

-- Set default walk speed
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then do
	 LocalPlayer.Character.Humanoid.WalkSpeed = Options.WalkSpeed.Value
	end
end


Fluent:Notify({
    Title = "Slap Battles Script",
    Content = "Script loaded successfully!",
    Duration = 5
})

print("Hi.")

SaveManager:LoadAutoloadConfig()
