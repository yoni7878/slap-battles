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
    Title = "Level Hub: Slap Royale" ,
    SubTitle = "by level",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Info = Window:AddTab({ Title = "Info", Icon = "info" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "swords" }),
    FloorLoot = Window:AddTab({ Title = "Floor Loot", Icon = "bomb" }),
	Antis = Window:AddTab({ Title = "Antis", Icon = "shield-alert" }), 
    ESPs = Window:AddTab({ Title = "ESPs", Icon = "eye"}),
	Extra = Window:AddTab({ Title = "Extra", Icon = "plus" }),
	Gloves = Window:AddTab({ Title = "Gloves", Icon = "hand" }),
	Interface = Window:AddTab({ Title = "Interface", Icon = "axe"}),
	Settings = Window:AddTab({ Title = "Settings", Icon = "cog"}),
    Config = Window:AddTab({ Title = "Config", Icon = "file-text" })
}

local Options = Fluent.Options

-- Game variables
-- Client-accessible services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local StarterGui = game:GetService("StarterGui")
local StarterPack = game:GetService("StarterPack")
local StarterPlayer = game:GetService("StarterPlayer")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local Chat = game:GetService("Chat")
local TextService = game:GetService("TextService")
local VRService = game:GetService("VRService")
local CollectionService = game:GetService("CollectionService")
local LocalizationService = game:GetService("LocalizationService")
local PathfindingService = game:GetService("PathfindingService")
local LogService = game:GetService("LogService")

local safemode = Tabs.Info:AddToggle("safemode", {Title = "Safe Mode", Description = "Adjusts settings to not get kicked as often.", Default = true })

safemode:OnChanged(function()
        
    end)

local versionexec = Tabs.Info:AddParagraph({
        Title = "Version: 1.00",
        Content = "Executor Used: " .. identifyexecutor() .. "\nIf there's errors idk fix it yourself."
    })

local tweenspeed = Tabs.Info:AddSlider("twensped", {
        Title = "Tween Speed",
        Description = "Changes your speed for auto collect & others, not recommended above 250.",
        Default = 210,
        Min = 50,
        Max = 425,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    tweenspeed:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

local autowinspeed = Tabs.Info:AddSlider("autospeed", {
        Title = "Autowin Tween Speed",
        Description = "Changes your speed for autowin, not recommended above 250.",
        Default = 135,
        Min = 50,
        Max = 300,
        Rounding = 1,
        Callback = function(Value)
            
        end
    })

    autowinspeed:OnChanged(function(Value)
        
    end)

Tabs.Combat:AddSection("Slap Aura")

    local slapaura = Tabs.Combat:AddToggle("SlapAura", {Title = "Slap Aura", Description = "Slaps people at a range", Default = false })

    slapaura:OnChanged(function()
        
    end)



    local slapauratoggle = Tabs.Combat:AddToggle("quicktoggle", {Title = "Slap Aura Quick Toggle", Description = "Enables Slap Aura with a keybind.", Default = false })

    slapauratoggle:OnChanged(function()
        
    end)

    local nofriendstoggle = Tabs.Combat:AddToggle("nofriends", {Title = "Don't detect friends", Description = "Don't detect your friends in slap aura.", Default = false })

    nofriendstoggle:OnChanged(function()
        
    end)

    local Keybind = Tabs.Combat:AddKeybind("slapkeybind", {
        Title = "Slap Aura Keybind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    local fakeslaptoggle = Tabs.Combat:AddToggle("fakeslap", {Title = "Fake Slap", Description = "Does a fake slap by animating your character when player touches you.", Default = false })

    fakeslaptoggle:OnChanged(function()
        
    end)

Tabs.Combat:AddSection("Autowin")

local autowindelay = Tabs.Combat:AddSlider("autodelay", {
        Title = "Wait after hit delay",
        Description = "Waits before going to another person, bypasses 'get help' kick at a point.",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            
        end
    })

    autowindelay:OnChanged(function(Value)
        
    end)

    local autowintoggle = Tabs.Combat:AddToggle("autowinyay", {Title = "Autowin", Description = "Uses tween service to fly (basically) to players and slaps them.", Default = false })

    autowintoggle:OnChanged(function()
        
    end)

    local autowinavoid = Tabs.Combat:AddToggle("autowinnofriends", {Title = "Avoid friends with autowin", Description = "Doesn't tween or slap them during autowin.", Default = false })

    autowinavoid:OnChanged(function()
        
    end)

	Tabs.FloorLoot:AddSection("Tool Collection")

    local autocollecttoggle = Tabs.FloorLoot:AddToggle("autocollect", {Title = "Autocollect Nearby", Description = "Gets to items 5 studs away and closer to you.", Default = false })

    autocollecttoggle:OnChanged(function()
        
    end)

    local fastcollecttoggle = Tabs.FloorLoot:AddToggle("fastcollect", {Title = "Fast Autocollect", Description = "Faster autocollect, prob gonna get votekicked, will be auto activated.", Default = false })

    fastcollecttoggle:OnChanged(function()
        
    end)

    local earlycollecttoggle = Tabs.FloorLoot:AddToggle("earlycollect", {Title = "Early Autocollect", Description = "Supposed to be used in lobby, auto collects before game starts (OP)", Default = false })

    earlycollecttoggle:OnChanged(function()
        
    end)

    local normalcollecttoggle = Tabs.FloorLoot:AddToggle("normalcollect", {Title = "Autocollect Items", Description = "Automatically collects items for you.", Default = false })

    normalcollecttoggle:OnChanged(function()
        
    end)

Tabs.FloorLoot:AddSection("Auto Tool Use")

    local usepermstoggle = Tabs.FloorLoot:AddToggle("useperms", {Title = "Auto use Permanent items", Description = "Automatically use perm items.", Default = false })

    usepermstoggle:OnChanged(function()
        
    end)

    local bombbustoggle = Tabs.FloorLoot:AddToggle("bombbus", {Title = "Auto Bomb Bus", Description = "Automatically bombs the bus\nRecommended to use with early auto collect!", Default = false })

    bombbustoggle:OnChanged(function()
        
    end)

    local useicetoggle = Tabs.FloorLoot:AddToggle("useice", {Title = "Auto Use Ice", Description = "Automatically uses ice cubes", Default = false })

    useicetoggle:OnChanged(function()
        
    end)

    local usetruepowertoggle = Tabs.FloorLoot:AddToggle("usetruepower", {Title = "Auto use true power", Description = "Automatically uses all your true powers.", Default = false })

    usetruepowertoggle:OnChanged(function()
        
    end)

    local autohealthtoggle = Tabs.FloorLoot:AddToggle("autohealthtools", {Title = "Auto Health", Description = "Automatically uses healing tools when low health.", Default = false })

    autohealthtoggle:OnChanged(function()
        
    end)

	local lowhealth = Tabs.FloorLoot:AddSlider("lowpointhealth", {
        Title = "Health Low Point",
        Description = "When should auto heal be activated is based off of this",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            
        end
    })

Tabs.FloorLoot:AddSection("Tool Preferity Editor")

local itemlist = Tabs.FloorLoot:AddParagraph({
        Title = "If your item isn't here, it isn't in the game.",
        Content = "No items? Wait or its all taken."
    })

	local lootItems = {
    { key = "firstaidkit", title = "First Aid Kit" },
    { key = "apple", title = "Apple" },
    { key = "bandage", title = "Bandage" },
    { key = "cubofice", title = "Cube of Ice" },
    { key = "boba", title = "Boba" },
    { key = "bomb", title = "Bomb" },
    { key = "potionheal", title = "Healing Potion" },
    { key = "spherefury", title = "Sphere of Fury" },
    { key = "strengthpotion", title = "Potion of Strength" },
    { key = "speedpotion", title = "Speed Potion" },
    { key = "frogpotion", title = "Frog Potion" },
    { key = "truepower", title = "True Power" },
    { key = "forcefield", title = "Forcefield Crystal" },
}

local dropdowns = {}

for _, item in pairs(lootItems) do
    dropdowns[item.key] = Tabs.FloorLoot:AddDropdown(item.key, {
        Title = item.title .. " [ ]",
        Description = "Blacklist = Don't pick up\nLater = Picked up less or once\nDefault = Gets picked up after preferred items\nPrefer = Will go first for these items",
        Values = { "Blacklist", "Later", "Default", "Prefer" },
        Multi = false,
        Default = 3,
    })
end


Tabs.Antis:AddSection("Anti Hazard")

    local antiacid = Tabs.Antis:AddToggle("antiacid", {Title = "Anti Acid", Description = "Creates a part at acid to be invincible to it", Default = false })

    antiacid:OnChanged(function()
        
    end)

	local antiacidpart = Tabs.Antis:AddToggle("antiacidkil", {Title = "Anti Acid Kill", Description = "Instead of creating parts, disable the kill part for acid.", Default = false })

    antiacidpart:OnChanged(function()
        
    end)

    local antilavakill = Tabs.Antis:AddToggle("antilavakill", {Title = "Anti Lava Kill", Description = "Instead of spawning a part disable the kill part in volcano.", Default = false })

    antilavakill:OnChanged(function()
        
    end)

    local antilava = Tabs.Antis:AddToggle("antilavak", {Title = "Anti Lava", Description = "Spawns a protection part at volcano.", Default = false })

    antilava:OnChanged(function()
        
    end)

Tabs.Antis:AddSection("Anti Ragdoll")

    local antiragdoll = Tabs.Antis:AddToggle("antiragdoll", {Title = "Anti Ragdoll ", Description = "Removes knockback when slapped.", Default = false })

	antiragdoll:OnChanged(function()
        
    end)

Tabs.Antis:AddSection("Other Antis")

    local antisit = Tabs.Antis:AddToggle("antisit", {Title = "Anti Sit", Description = "When you sit, you unsit I think?", Default = true })

    antisit:OnChanged(function()
        
    end)

    local antizone = Tabs.Antis:AddToggle("antizone", {Title = "Anti Zone Effects", Description = "Doesn't stop damage\nDisables only zone effects to make eyesight better.", Default = true })

    antizone:OnChanged(function()
        
    end)

Tabs.ESPs:AddSection("Tool ESP")

    local toolesp = Tabs.ESPs:AddToggle("toolesp", {Title = "Tool ESP", Description = "Shows you where items are with a line.", Default = true })

    toolesp:OnChanged(function()
        
    end)

Tabs.ESPs:AddSection("Player ESP")

    local espenabled = Tabs.ESPs:AddToggle("enableesp", {Title = "ESP Enabled", Description = "Toggles entire ESP system.", Default = true })

    espenabled:OnChanged(function()
        
    end)

    local highlight = Tabs.ESPs:AddToggle("highlight", {Title = "Highlight", Description = "Highlights players using Roblox's highlight system.", Default = true })

    highlight:OnChanged(function()
        
    end)

    local drawline = Tabs.ESPs:AddToggle("drawline", {Title = "Draw Line", Description = "Draws lines to players, it's 2D.", Default = true })

    drawline:OnChanged(function()
        
    end)

Tabs.Extra:AddSection("Auto Votekick")

	local votekickdelayslide = Tabs.Extra:AddSlider("votekickd", {
        Title = "Votekick Delay Slider",
        Description = "Adjusts the delay of auto votekicks to reduce suspision.",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            
        end
    })

    local votekickrandom = Tabs.Extra:AddToggle("voterandom", {Title = "Votekick Random", Description = "Auto votekicks random people that isn't your friend.", Default = true })

    votekickrandom:OnChanged(function()
        
    end)

    local waitforbus = Tabs.Extra:AddToggle("waitforbus", {Title = "Wait till bus", Description = "Waits till you have entered the bus.", Default = true })

    waitforbus:OnChanged(function()
        
    end)

Tabs.Extra:AddSection("Humanoid")

	local walkspeed = Tabs.Extra:AddSlider("walkspeed", {
        Title = "WalkSpeed",
        Description = "Adjusts walkspeed of player.",
        Default = 20,
        Min = 20,
        Max = 240,
        Rounding = 1,
        Callback = function(Value)
            
        end
    })

	local jumppower = Tabs.Extra:AddSlider("jumpower", {
        Title = "JumpPower",
        Description = "Adjusts jumppower of player.",
        Default = 50,
        Min = 50,
        Max = 240,
        Rounding = 1,
        Callback = function(Value)
            
        end
    })
