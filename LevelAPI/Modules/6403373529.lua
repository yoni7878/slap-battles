if Fluent then
    -- Fake loading print
    for i = 1, 1 do
        warn("loading" .. string.rep(".", i))
        wait(0.5)
    end

    -- Turn off active flags
    if autoSlapActive then autoSlapActive = false end
    if farmingPlayers then farmingPlayers = false end
    if farmingSlapples then farmingSlapples = false end

    -- Remove visual elements
    if visualizer and visualizer.Parent then
        visualizer:Destroy()
    end

    if antiVoidBlock and antiVoidBlock.Parent then
        antiVoidBlock:Destroy()
    end

    -- Reset character movement stats
    local LocalPlayer = game.Players.LocalPlayer
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
        humanoid.HipHeight = 0
    end

    -- 🧩 Restore 'Reset' if it was moved to workspace.Toggled
    local storageFolder = workspace:FindFirstChild("Toggled")
    if storageFolder then
        local storedReset = storageFolder:FindFirstChild("Reset")
        if storedReset then
            storedReset.Parent = LocalPlayer
        end
    end

    -- Destroy the UI
    Fluent:Destroy()
else
    for i = 1, 1 do
        warn("loading" .. string.rep(".", i))
        wait(0.5)
    end
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local toggled = Instance.new("Folder", workspace)
toggled.Name = "Toggled"

-- Initialize managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

local Window = Fluent:CreateWindow({
    Title = "Level Hub: Slap Battles " .. Fluent.Version,
    SubTitle = identifyexecutor(),
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "book" }),
    Player = Window:AddTab({ Title = "Player", Icon = "contact" }),
    Anti = Window:AddTab({ Title = "Anti", Icon = "shield-alert" }),
	World = Window:AddTab({ Title = "World", Icon = "paintbrush" }), 
    Badges = Window:AddTab({ Title = "Badges", Icon = "check"}),
	Teleport = Window:AddTab({ Title = "Teleport", Icon = "map-pin" }),
	Misc = Window:AddTab({ Title = "Misc", Icon = "box" }),
	Abilities = Window:AddTab({ Title = "Abilities", Icon = "axe"}),
	Spam = Window:AddTab({ Title = "Spam", Icon = "wifi-off" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "cog"}),
    Config = Window:AddTab({ Title = "Config", Icon = "file-text" })
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

Fluent:Notify({
    Title = "Welcome to Level Hub!",
    Content = "key dont save and dont run twice ",
    Duration = 3
})

Tabs.Main:AddSection("God Mode")

Tabs.Main:AddButton({
    Title = "God Mode",
    Description = "Teleport to default arena.",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "You'll be teleported.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15.3642788, -3.69053721, -7.41954088)
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

-- Add this to your Anti tab (or wherever you want it)
Tabs.Main:AddSection("Slap Aura")

local ToolCheckToggle = Tabs.Main:AddToggle("RequireTool", {
    Title = "Require Tool",
    Description = "Must have a tool equipped for slap aura.",
    Default = false
})

-- Auto Slap Toggle
local AutoSlapToggle = Tabs.Main:AddToggle("AutoSlap", {
    Title = "Slap Aura",
    Description = "Automatically slaps nearby players",
    Default = false
})

local FarmPlayersToggle = Tabs.Main:AddToggle("FarmPlayers", {
    Title = "Farm Slaps",
    Description = "Automatically teleport to and slap players (not in lobby!)",
    Default = false
})

local NoFriendsToggle = Tabs.Main:AddToggle("nofriends", {
    Title = "Don't hit friends",
    Description = "Slap aura doesn't detect friends.",
    Default = false
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


	Tabs.Abilities:AddSection("Retro")
    
    local retroDropdown = Tabs.Abilities:AddDropdown("RetroAbility", {
        Title = "Choose Ability",
        Values = {"Ban Hammer", "Bomb", "Rocket Launcher"},
        Default = "Ban Hammer"
    })
    
    Tabs.Abilities:AddToggle("SpamRetroToggle", {
        Title = "Enable Spam",
        Default = false,
        Callback = function(state)
            getgenv().spamRetro = state
            local selectedAbility = Options.RetroAbility.Value
            
            while getgenv().spamRetro and task.wait(0.2) do
                local args = {[1] = selectedAbility}
                game:GetService("ReplicatedStorage"):WaitForChild("RetroAbility"):FireServer(unpack(args))
            end
        end
    })

    -- Admin Ability Spam
	Tabs.Abilities:AddSection("Admin")
    
    local adminDropdown = Tabs.Abilities:AddDropdown("AdminAbility", {
        Title = "Choose Ability",
        Values = {"Anvil", "Fling", "Invisibility"},
        Default = "Anvil"
    })
    
    Tabs.Abilities:AddToggle("SpamAdminToggle", {
        Title = "Enable Spam",
        Default = false,
        Callback = function(state)
            getgenv().spamAdmin = state
            local selectedAbility = Options.AdminAbility.Value
            
            while getgenv().spamAdmin and task.wait(0.2) do
                local abilityName = selectedAbility == "Invisibility" and "Invisibility" or selectedAbility
                local args = {[1] = abilityName}
                game:GetService("ReplicatedStorage"):WaitForChild("AdminAbility"):FireServer(unpack(args))
            end
        end
    })

Tabs.Spam:AddSection("Effects")

local RunService = game:GetService("RunService")
local connection

Tabs.Spam:AddButton({
    Title = "Effect Lag",
    Description = "Spams effects for server lag",
    Callback = function()
        game:GetService("RunService").RenderStepped:Connect(function()
            game.ReplicatedStorage:WaitForChild("slapstick"):FireServer("runeffect")
        end)
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
                            
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16971.7168, 797.600342, 4905.17334, 0.230043754, -4.14069206e-08, 0.973180294, -1.62095546e-08, 1, 4.63797178e-08, -0.973180294, -2.64441837e-08, 0.230043754)
                            task.wait(0.4)
                            
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
Tabs.Main:AddSection("Slapples")

local farmingSlapples = false
local farmingPlayers = false

-- Setup for Tabs, Dropdowns, and Toggles
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Assuming 'Options' is defined somewhere else in your code as a global table
local selectedSlappleMethod = "Fire touchinterest" -- Set default slapple method
local selectedPlayerFarmMethod = "Teleport" -- Set default player farm method

-- Tool Requirement Toggle

local slappleDropdown = Tabs.Main:AddDropdown("slapmethod", {
    Title = "Choose Slapple Method",
    Description = "Change how slapples are farmed.",
    Values = {"Teleport", "Fire touchinterest", "Teleport (Invisibility)"},
    Default = "Fire touchinterest"
})

local playerFarmDropdown = Tabs.Main:AddDropdown("playerfarmmethod", {
    Title = "Choose Player Farm Method",
    Description = "Change how players are farmed.",
    Values = {"Teleport", "Teleport (Invisibility)", "Walk to closest player"},
    Default = "Teleport"
})


local FarmSlapplesToggle = Tabs.Main:AddToggle("FarmSlapples", {
    Title = "Auto Collect Slapples",
    Description = "Automatically collect slapples in Arena",
    Default = false
})

local FarmSlapplesAutoArena = Tabs.Main:AddToggle("AutoArenaSlapples", {
    Title = "Auto Collect Slapples w/ auto arena",
    Description = "Automatically collect slapples in Arena",
    Default = false
})

local SlappleDelaySlider = Tabs.Main:AddSlider("SlappleDelay", {
    Title = "Slapple Collection Delay",
    Description = "Delay between slapple collections",
    Default = 0.5,
    Min = 0.1,
    Max = 2,
    Rounding = 1
})

-- Function to check if the player can go invisible (ghost glove or 666 slaps)
local function canGoInvisible()
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    local slaps = leaderstats and leaderstats:FindFirstChild("Slaps")
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    local glove = tool and tool.Name

    return (slaps and slaps.Value >= 666) or glove == "Ghost"
end

-- Slapple Collection Function
-- Enhanced slapple collection with better detection
local function getSlapples()
    if farmingSlapples then return end
    farmingSlapples = true

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then farmingSlapples = false return end

    while Options.FarmSlapples.Value and farmingSlapples do
        for _, slapple in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
            if not farmingSlapples then break end
            if slapple.Name == "Glove" then
                local method = Options.slapmethod.Value

                if method == "Fire touchinterest" then
                    firetouchinterest(hrp, slapple, 0)
                    firetouchinterest(hrp, slapple, 1)
                else
                    if method == "Teleport (Invisibility)" and canGoInvisible() then
                        ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
                    end
                    hrp.CFrame = slapple.CFrame + Vector3.new(0, 2, 0)
                end
                task.wait(Options.SlappleDelay.Value)
            end
        end
        task.wait(0.1)
    end

    farmingSlapples = false
end


-- Auto Arena Slapple Farming (teleports and collects slapples)
-- More reliable arena handling
local function autoArenaSlappleFarm()
    while Options.AutoArenaSlapples.Value do
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end

        -- Ensure in arena
        if not char:FindFirstChild("isInArena") or not char.isInArena.Value then
            hrp.CFrame = workspace.Lobby.Teleport1.CFrame
            repeat task.wait() until char:FindFirstChild("isInArena") and char.isInArena.Value
            task.wait(1)
        end

        -- Collect slapples
        for _, slapple in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
            if slapple.Name == "Glove" then
                hrp.CFrame = slapple.CFrame + Vector3.new(0, 2, 0)
                task.wait(Options.SlappleDelay.Value)
            end
        end
        
        task.wait(0.5)
    end
end

-- Function to teleport to the closest player (based on selected method)
-- Updated player farming with proper method handling
local function farmPlayers()
    if farmingPlayers then return end
    farmingPlayers = true

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then farmingPlayers = false return end

    while Options.FarmPlayers.Value and farmingPlayers do
        local targets = {}
        local myPos = hrp.Position

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local targetChar = player.Character
                local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                if targetHRP then
                    table.insert(targets, {
                        player = player,
                        position = targetHRP.Position,
                        distance = (targetHRP.Position - myPos).Magnitude
                    })
                end
            end
        end

        table.sort(targets, function(a, b) return a.distance < b.distance end)

        for i = 1, math.min(#targets, Options.MaxPlayers.Value) do
            if not farmingPlayers then break end

            local target = targets[i]
            local method = Options.playerfarmmethod.Value

            if method == "Teleport" then
                hrp.CFrame = CFrame.new(target.position + Vector3.new(0, 3, 0))
            elseif method == "Teleport (Invisibility)" and canGoInvisible() then
                ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
                hrp.CFrame = CFrame.new(target.position + Vector3.new(0, 3, 0))
            elseif method == "Walk to closest player" then
                -- Add walk logic here if desired
            end

            local currentGlove = LocalPlayer.leaderstats.Glove.Value
            if gloveHits[currentGlove] then
                gloveHits[currentGlove]:FireServer(target.player.Character.Head)
            end

            task.wait(Options.SlapSpeed.Value)
        end

        task.wait(0.1)
    end

    farmingPlayers = false
end


-- Dropdown Logic to update selected methods
slappleDropdown:OnChanged(function(value)
    selectedSlappleMethod = value
    -- Restart slapple farming
    if farmingSlapples then
        farmingSlapples = false
        task.wait(0.2)
        if Options.FarmSlapples.Value then
            task.spawn(getSlapples)
        end
    end
end)

playerFarmDropdown:OnChanged(function(value)
    selectedPlayerFarmMethod = value
    -- Restart player farming
    if farmingPlayers then
        farmingPlayers = false
        task.wait(0.2)
        if Options.FarmPlayers.Value then
            task.spawn(farmPlayers)
        end
    end
end)

FarmSlapplesToggle:OnChanged(function()
    if Options.FarmSlapples.Value then
        task.spawn(getSlapples)
    else
        farmingSlapples = false
    end
end)

FarmPlayersToggle:OnChanged(function()
    if Options.FarmPlayers.Value then
        task.spawn(farmPlayers)
    else
        farmingPlayers = false
    end
end)


local SlapRangeSlider = Tabs.Settings:AddSlider("SlapRange", {
    Title = "Slap Aura Reach",
    Description = "Not more than 17 recommended, unless EXTENDED Glove or lots of lag.",
    Default = 10,
    Min = 5,
    Max = 30,
    Rounding = 0
})

local SlapSpeedSlider = Tabs.Settings:AddSlider("SlapSpeed", {
    Title = "Slap Speed",
    Description = "How fast it detects players (0.1-1 sec)",
    Default = 0.6,
    Min = 0.1,
    Max = 1,
    Rounding = 1
})

local MaxPlayersSlider = Tabs.Settings:AddSlider("MaxPlayers", {
    Title = "Slap Aura Player Detection",
    Description = "Maximum players to detect at once",
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 0
})

local VisualizerToggle = Tabs.Settings:AddToggle("ShowVisualizer", {
    Title = "Visual Slap Aura",
    Description = "Shows the range of the Slap Aura.",
    Default = false
})

local KeepWalkSpeed = Tabs.Player:AddToggle("KeepWalkSpeed", {
    Title = "Keep WalkSpeed",
    Description = "",
    Default = false
})

local SpeedSlider = Tabs.Player:AddSlider("WalkSpeed", { -- Changed from toggle to slider
    Title = "Walk Speed",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 0
})

local KeepJumpPower = Tabs.Player:AddToggle("KeepJumpPower", {
    Title = "Keep JumpPower",
    Description = "",
    Default = false
})

local JumpPowerSlider = Tabs.Player:AddSlider("JumpPower", {
    Title = "Jump Power",
    Default = 50,
    Min = 50,
    Max = 200,
    Rounding = 0
})

local KeepHipHeight = Tabs.Player:AddToggle("KeepHipHeight", {
    Title = "Keep Hip Height",
    Description = "",
    Default = false
})

local HipHeightSlider = Tabs.Player:AddSlider("HipHeight", {
    Title = "Hip Height",
    Default = 0,
    Min = 0,
    Max = 50,
    Rounding = 0
})

-- Anti Tab (NEW)

Tabs.Anti:AddSection("Anti Void")

local AntiVoidToggle = Tabs.Anti:AddToggle("AntiVoid", {
    Title = "Anti Void",
    Description = "Prevents falling into the void",
    Default = false
})

Tabs.Anti:AddSection("General")

local AntiMegarockToggle = Tabs.Anti:AddToggle("AntiMegarock", {
    Title = "Anti Megarock",
    Description = "Prevents Megarock glove effects",
    Default = false
})

Tabs.Anti:AddToggle("AntiRagdoll", {
    Title = "Anti Ragdoll",
    Description = "Prevents ragdoll effects on your character",
    Default = false,
    Callback = function(state)
        getgenv().antiRagdoll = state
        
        if state then
            -- Initialize when enabled
            local function setupAntiRagdoll(character)
                if not character then return end
                
                local humanoid = character:WaitForChild("Humanoid")
                local ragdollValue = character:WaitForChild("Ragdolled")
                local torso = character:WaitForChild("Torso") or character:WaitForChild("UpperTorso")
                
                ragdollValue:GetPropertyChangedSignal("Value"):Connect(function()
                    if ragdollValue.Value and getgenv().antiRagdoll then
                        -- When ragdolled
                        if torso then
                            torso.Anchored = true
                        end
                        
                        -- Wait until no longer ragdolled
                        repeat task.wait() until not ragdollValue.Value or not getgenv().antiRagdoll
                        
                        if torso then
                            torso.Anchored = false
                        end
                    end
                end)
            end
            
            -- Setup for current character
            if game.Players.LocalPlayer.Character then
                setupAntiRagdoll(game.Players.LocalPlayer.Character)
            end
            
            -- Setup for future characters
            game.Players.LocalPlayer.CharacterAdded:Connect(setupAntiRagdoll)
            
            -- Notify user
            Fluent:Notify({
                Title = "Anti Ragdoll",
                Content = "Enabled ragdoll protection",
                Duration = 3
            })
        else
            -- Notify user when disabled
            Fluent:Notify({
                Title = "Anti Ragdoll",
                Content = "Disabled ragdoll protection",
                Duration = 3
            })
        end
    end
})


local AntiBrazilToggle = Tabs.Anti:AddToggle("AntiBrazil", {
    Title = "Anti Brazil (doesnt reset)",
    Description = "Prevents teleporting and seeing brazil.",
    Default = false
})

local function antibrazil()
    while Options.AntiBrazil.Value do
        task.wait(1)
        if workspace:FindFirstChild("Lobby") and workspace.Lobby:FindFirstChild("brazil") then
            local portal = workspace.Lobby.brazil
            if portal then
				portal:Destroy()
            end
        end
    end
end

AntiBrazilToggle:OnChanged(function()
    if Options.AntiBrazil.Value then
        coroutine.wrap(antibrazil)()
    end
end)

local AntiReverseToggle = Tabs.Anti:AddToggle("AntiReverse", {
    Title = "Anti Reverse",
    Description = "Don't slap players with Reverse glove",
    Default = true
})

local AntiSpectator = Tabs.Anti:AddToggle("AntiSpectator", {
    Title = "Anti Spectator",
    Description = "Don't slap players with Spectator glove",
    Default = true
})

Tabs.Teleport:AddDropdown("TeleportLocations", {
        Title = "Teleport Locations",
        Values = {
            "SafePort", 
            "Slapples Island", 
            "Moai Island", 
            "Plate", 
            "Default Arena", 
            "Normal Arena", 
            "Spawn",
            "Cannon Island", 
            "Bounty Hunter Room"
        },
        Default = "Spawn",
        Callback = function(selected)
            local character = game.Players.LocalPlayer.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then 
                Fluent:Notify({
                    Title = "Error",
                    Content = "Character not found!",
                    Duration = 3
                })
                return 
            end
            
            local hrp = character.HumanoidRootPart
            local success, err = pcall(function()
                -- Define all teleport locations with safe checks
                if selected == "SafePort" then
                    hrp.CFrame = CFrame.new(2461.50464, 243.291565, -4546.78467)
                
                elseif selected == "Slapples Island" then
                    if workspace.Arena:FindFirstChild("island5") and workspace.Arena.island5:FindFirstChild("Union") then
                        hrp.CFrame = workspace.Arena.island5.Union.CFrame
                    else
                        error("Slapples Island not found in workspace!")
                    end
                
                elseif selected == "Moai Island" then
                    if workspace.Arena:FindFirstChild("island4") and workspace.Arena.island4:FindFirstChild("Big Tree") then
                        hrp.CFrame = workspace.Arena.island4["Big Tree"].Bark.CFrame * CFrame.new(3, -4, 0)
                    else
                        error("Moai Island not found in workspace!")
                    end
                
                elseif selected == "Plate" then
                    if workspace.Arena:FindFirstChild("Plate") then
                        hrp.CFrame = workspace.Arena.Plate.CFrame
                    else
                        error("Plate not found in workspace!")
                    end
                
                -- Removed Battle Arena since it's not a valid member
                
                elseif selected == "Cannon Island" then
                    hrp.CFrame = CFrame.new(257.620972, 35.9974861, 198.8535)
                
                elseif selected == "Bounty Hunter Room" then
                    hrp.CFrame = CFrame.new(17894.6855, -130.158478, -3539.8374)
                
                elseif selected == "Default Arena" then
                    hrp.CFrame = CFrame.new(120, 364, -3)
                
                elseif selected == "Normal Arena" then
                    hrp.CFrame = CFrame.new(-15.3642788, -3.69053721, -7.41954088)
                
                elseif selected == "Spawn" then
                    hrp.CFrame = CFrame.new(-798.47345, 329.357147, 0.84058404)
                end
            end)
            
            if not success then
                Fluent:Notify({
                    Title = "Teleport Failed",
                    Content = err,
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Teleported",
                    Content = "Successfully teleported to: "..selected,
                    Duration = 3
                })
            end
        end
    })

    -- Player teleport section (same as before)
    Tabs.Teleport:AddSection("Player Teleport")

    local playerList = {}
    local playerDropdown = Tabs.Teleport:AddDropdown("TeleportPlayer", {
        Title = "Select Player",
        Values = playerList,
        Default = nil,
        AllowNull = true
    })

    local function updatePlayerList()
        table.clear(playerList)
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                table.insert(playerList, player.Name)
            end
        end
        playerDropdown:SetValues(playerList)
    end

    updatePlayerList()
    game:GetService("Players").PlayerAdded:Connect(updatePlayerList)
    game:GetService("Players").PlayerRemoving:Connect(updatePlayerList)

    Tabs.Teleport:AddButton({
        Title = "Teleport to Player",
        Callback = function()
            local targetName = Options.TeleportPlayer.Value
            if not targetName then return end
            
            local target = game:GetService("Players"):FindFirstChild(targetName)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                    target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                Fluent:Notify({
                    Title = "Success",
                    Content = "Teleported to "..targetName,
                    Duration = 3
                })
            else
                Fluent:Notify({
                    Title = "Error",
                    Content = "Target player not found!",
                    Duration = 3
                })
            end
        end
    })

    -- Position saving (same as before)
    local savedPosition = nil
    Tabs.Teleport:AddButton({
        Title = "Save Current Position",
        Callback = function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                savedPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                Fluent:Notify({
                    Title = "Position Saved",
                    Content = "You can now teleport back here",
                    Duration = 3
                })
            end
        end
    })

    Tabs.Teleport:AddButton({
        Title = "Return to Saved Position",
        Callback = function()
            if savedPosition then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedPosition
                Fluent:Notify({
                    Title = "Teleported",
                    Content = "Returned to saved position",
                    Duration = 3
                })
            else
                Fluent:Notify({
                    Title = "Error",
                    Content = "No position saved yet!",
                    Duration = 3
                })
            end
        end
    })

Tabs.Misc:AddSection("Visual Effects")

local rainbowMode = false
local rainbowSpeed = 0.1

Tabs.Misc:AddToggle("RainbowMode", {
    Title = "Rainbow Character",
    Description = "Makes your character cycle colors",
    Default = false,
    Callback = function(state)
        rainbowMode = state
        if rainbowMode then
            coroutine.wrap(function()
                while rainbowMode and task.wait(rainbowSpeed) do
                    if game.Players.LocalPlayer.Character then
                        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            end
                        end
                    end
                end
            end)()
        end
    end
})

Tabs.Misc:AddSlider("RainbowSpeed", {
    Title = "Rainbow Speed",
    Description = "How fast colors change",
    Default = 0.1,
    Min = 0.01,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        rainbowSpeed = value
    end
})

Tabs.Misc:AddToggle("DisableReset", {
    Title = "Disable Reset",
    Description = "Prevents you from resetting your character",
    Default = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        local resetBindable = player:FindFirstChild("Reset")

        if state then
            -- Make a folder in workspace to store it (if not already)
            local storageFolder = workspace:FindFirstChild("Toggled")
            if not storageFolder then
                storageFolder = Instance.new("Folder", workspace)
                storageFolder.Name = "Toggled"
            end

            if resetBindable then
                resetBindable.Parent = storageFolder
            end
        else
            -- Restore Reset to player if we moved it
            local storageFolder = workspace:FindFirstChild("Toggled")
            if storageFolder then
                local storedReset = storageFolder:FindFirstChild("Reset")
                if storedReset then
                    storedReset.Parent = player
                end
            end
        end
    end
})


-- Section for Movement Hacks
Tabs.Misc:AddSection("Movement Hacks")

-- 1. No Clip Mode (Fly through walls)
local noclipActive = false
local noclipConnection = nil

Tabs.Misc:AddToggle("NoClipToggle", {
    Title = "No Clip Mode",
    Description = "Fly through walls and objects",
    Default = false,
    Callback = function(state)
        noclipActive = state
        if noclipActive then
            Fluent:Notify({
                Title = "No Clip",
                Content = "Enabled - You can now phase through walls",
                Duration = 3
            })
            
            -- Create noclip loop
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if noclipActive and LocalPlayer.Character then
                    for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
            end
            Fluent:Notify({
                Title = "No Clip",
                Content = "Disabled - Normal collision restored",
                Duration = 3
            })
        end
    end
})

-- Section for Sound Effects
Tabs.Misc:AddSection("Sound Effects")

-- Custom Hit Sounds
local customHitSounds = {
    ["Default"] = "rbxassetid://131735820",
    ["BONK"] = "rbxassetid://8763215432",
    ["Roblox Death"] = "rbxassetid://130976108",
    ["Meme"] = "rbxassetid://7146926474",
    ["Explosion"] = "rbxassetid://138186576",
    ["Wilhelm Scream"] = "rbxassetid://131147967",
    ["Slap"] = "rbxassetid://131735820",
    ["Hit"] = "rbxassetid://142376130"
}

local currentHitSound = "Default"
local originalSlapSounds = {}
local soundConnections = {}

-- Function to modify sounds for a specific character
local function modifyCharacterSounds(character)
    if not character then return end
    
    -- List of R6 body parts to check
    local bodyParts = {"Head", "Torso", "Right Arm", "Left Arm", "Right Leg", "Left Leg", "HumanoidRootPart"}
    
    for _, partName in ipairs(bodyParts) do
        local part = character:FindFirstChild(partName)
        if part then
            for _, sound in ipairs(part:GetDescendants()) do
                if sound:IsA("Sound") then
                    -- Create unique identifier
                    local soundId = character.Name..":"..partName..":"..sound.Name
                    
                    -- Save original sound if not already saved
                    if not originalSlapSounds[soundId] then
                        originalSlapSounds[soundId] = sound.SoundId
                    end
                    
                    -- Apply current sound
                    if currentHitSound == "Default" then
                        sound.SoundId = originalSlapSounds[soundId]
                    else
                        sound.SoundId = customHitSounds[currentHitSound]
                    end
                    
                    -- Monitor for sound changes
                    if not soundConnections[sound] then
                        soundConnections[sound] = sound:GetPropertyChangedSignal("SoundId"):Connect(function()
                            if currentHitSound ~= "Default" then
                                sound.SoundId = customHitSounds[currentHitSound]
                            end
                        end)
                    end
                end
            end
        end
    end
end

-- Function to modify sounds for all players
local function modifyAllPlayerSounds()
    -- Modify existing players
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player.Character then
            modifyCharacterSounds(player.Character)
        end
        player.CharacterAdded:Connect(function(character)
            character:WaitForChild("HumanoidRootPart")
            task.wait(0.5)
            modifyCharacterSounds(character)
        end)
    end
    
    -- Handle new players
    game:GetService("Players").PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            character:WaitForChild("HumanoidRootPart")
            task.wait(0.5)
            modifyCharacterSounds(character)
        end)
    end)
end

-- Dropdown to select sound
Tabs.Misc:AddDropdown("HitSoundSelect", {
    Title = "Global Slap Sound Effect",
    Description = "Change slap sounds for everyone (client-side only)",
    Values = {"Default", "BONK", "Roblox Death", "Meme", "Explosion", "Wilhelm Scream", "Slap", "Hit"},
    Default = "Default",
    Callback = function(value)
        currentHitSound = value
        modifyAllPlayerSounds()
        Fluent:Notify({
            Title = "Global Sound Changed",
            Content = "All slap sounds now: "..value,
            Duration = 2
        })
    end
})

-- Cleanup function
local function cleanupSoundConnections()
    for sound, connection in pairs(soundConnections) do
        connection:Disconnect()
    end
    soundConnections = {}
end

-- Initialize for existing players
modifyAllPlayerSounds()

-- Cleanup when script is destroyed
game:GetService("Players").LocalPlayer.CharacterRemoving:Connect(cleanupSoundConnections)

-- Section for Glove Abilities
Tabs.Misc:AddSection("Glove Modifiers")

-- 3. No Cooldown (Based on your script)
local noCooldownActive = false
local noCooldownConnection = nil

Tabs.Misc:AddToggle("NoCooldownToggle", {
    Title = "No Cooldown (Experimental)",
    Description = "Remove ability cooldowns for gloves",
    Default = false,
    Callback = function(state)
        noCooldownActive = state
        if noCooldownActive then
            Fluent:Notify({
                Title = "No Cooldown",
                Content = "Enabled - Abilities can be spammed",
                Duration = 3
            })
            
            -- Start no cooldown loop
            noCooldownConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if noCooldownActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    if tool then
                        local localscript = tool:FindFirstChildOfClass("LocalScript")
                        if localscript then
                            local localscriptclone = localscript:Clone()
                            localscript:Destroy()
                            localscriptclone.Parent = tool
                        end
                    end
                end
            end)
        else
            if noCooldownConnection then
                noCooldownConnection:Disconnect()
            end
            Fluent:Notify({
                Title = "No Cooldown",
                Content = "Disabled - Normal cooldowns restored",
                Duration = 3
            })
        end
    end
})

local noabilitycooldown = false

Tabs.Misc:AddToggle("nocooldownability", {
    Title = "No Cooldown - Abilities",
    Description = "Remove Abilities cooldown",
    Default = false,
    Callback = function(state)
        noabilitycooldown = state

        if noabilitycooldown then
            Fluent:Notify({
                Title = "No Cooldown - Abilities",
                Content = "Enabled - You can now have no cooldown for abilities",
                Duration = 3
            })

            task.spawn(function()
                while noabilitycooldown or Options.nocooldownability.Value do
                    local player = game.Players.LocalPlayer

                    -- Check and set the attributes
                    if not player:GetAttribute("ECooldownElementEnabled") then
                        player:SetAttribute("ECooldownElementEnabled", true)
                    end

                    if not player:GetAttribute("RCooldownElementEnabled") then
                        player:SetAttribute("RCooldownElementEnabled", true)
                    end

                    task.wait(0.1)
                end
            end)
        else
            Fluent:Notify({
                Title = "No Cooldown - Abilities",
                Content = "Disabled - Cooldowns are now back to normal",
                Duration = 3
            })
        end
    end
})


Tabs.Settings:AddSection("Reload") -- Optional: Adds a section header

Tabs.Settings:AddButton({
    Title = "Reload Script",
    Description = "Restart the script (resets all changes)",
    Callback = function()
        Window:Dialog({
            Title = "Are you sure?",
            Content = "This will reset EVERYTHING and reload the script.",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        -- Disable all active features first
                        if autoSlapActive then
                            autoSlapActive = false
                        end
                        
                        if farmingPlayers then
                            farmingPlayers = false
                        end
                        
                        if farmingSlapples then
                            farmingSlapples = false
                        end
                        
                        -- Remove visualizer
                        if visualizer and visualizer.Parent then
                            visualizer:Destroy()
                        end
                        
                        -- Remove anti-void block
                        if antiVoidBlock and antiVoidBlock.Parent then
                            antiVoidBlock:Destroy()
                        end
                        
                        -- Reset player properties
                        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.WalkSpeed = 16
                            humanoid.JumpPower = 50
                            humanoid.HipHeight = 0
                        end
                        
                        -- Clear Fluent UI
                        Fluent:Destroy()
                        
                        -- Full script reload
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/yoni7878/slap-battles/refs/heads/main/breh%20(1).lua"))()
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the reload.")
                    end
                }
            }
        })
    end
})

Tabs.World:AddSection("Ghost")

Tabs.World:AddButton("ghostinvis", {
    Title = "Invisibility (Ghost Glove)",
    Description = "You need Ghost Glove or 666+ slaps to work.",
    Callback = function()
	local player = game.Players.LocalPlayer
        local char = player.Character
        local stats = player:FindFirstChild("leaderstats")
		Window:Dialog({
                Title = "Are you sure?",
                Content = "You could stay invisible forever",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                             if stats and stats:FindFirstChild("Slaps") and stats:FindFirstChild("Glove") and char and char:FindFirstChild("HumanoidRootPart") then
                local hasGhostGlove = stats.Glove.Value == "Ghost"
                local has666Slaps = stats.Slaps.Value >= 666

                if hasGhostGlove or has666Slaps then
                    stats.Glove.Value = "Ghost"
                    char.HumanoidRootPart.CFrame = workspace:WaitForChild("Lobby"):WaitForChild("Teleport1Frame").CFrame
                    task.wait(1)
		            game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilityactivated"):FireServer()

                else
                    warn("You need the Ghost Glove or at least 666 slaps.")
                end
            else
                warn("Missing required components. Make sure character and stats are loaded.")
            end
        end
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
		})

Tabs.World:AddButton({
        Title = "Turn off Invisibility",
        Description = "L Invisibility",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "You could stay invisible forever",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilitydeactivated"):FireServer()
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

	Tabs.World:AddButton({
        Title = "Remove Ghost sky",
        Description = "it's pretty annoying.",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "You could like creepy skies.",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game:GetService("ReplicatedStorage"):WaitForChild("Creepysky"):Destroy()
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

-- Settings Tab
InterfaceManager:BuildInterfaceSection(Tabs.Config)
SaveManager:BuildConfigSection(Tabs.Config)
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

local function isSpectatorPlayer(player)
    if not Options.AntiSpectator.Value then return false end
    local leaderstats = player:FindFirstChild("leaderstats")
    return leaderstats and leaderstats:FindFirstChild("Glove") and leaderstats.Glove.Value == "Spectator"
end

local function isFriend(player)
    if not Options.nofriends.Value then return false end
    local success, isFriend = pcall(function()
        return LocalPlayer:IsFriendsWith(player.UserId)
    end)
    return success and isFriend
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
                        continue
                    end

					if isSpectatorPlayer(plr) then
                        continue
                    end

					if isFriend(plr) then
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

-- Always-running loops that respect the toggle states
task.spawn(function()
	while true do
		task.wait()
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			if Options.KeepJumpPower.Value then
				LocalPlayer.Character.Humanoid.JumpPower = Options.JumpPower.Value
			end
			if Options.KeepHipHeight.Value then
				LocalPlayer.Character.Humanoid.HipHeight = Options.HipHeight.Value
			end
			if Options.KeepWalkSpeed.Value then
				LocalPlayer.Character.Humanoid.WalkSpeed = Options.WalkSpeed.Value
			end
		end
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

print("done")


SaveManager:LoadAutoloadConfig()
