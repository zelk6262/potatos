-- potatos by zelk and oopy

-- Destroy any existing Rayfield UI
if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui:FindFirstChild("Rayfield"):Destroy()
end

-- PotatOS Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window =
    Rayfield:CreateWindow(
    {
        Name = "PotatOS",
        Icon = "tree-deciduous",
        LoadingTitle = "PotatOS",
        LoadingSubtitle = "Final Version",
        ShowText = "PotatOS",
        Theme = "AmberGlow",
        ToggleUIKeybind = "K",
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil,
            FileName = "PotatOS_Config"
        },
        Discord = {
            Enabled = false,
            Invite = "noinvitelink",
            RememberJoins = true
        },
        KeySystem = true,
        KeySettings = {
            Title = "potatos",
            Subtitle = "key system",
            Note = "key is dev",
            FileName = "potatoskey",
            SaveKey = false,
            GrabKeyFromSite = false,
            Key = {"dev"} -- Accepted keys
        }
    }
)

----------------------------------------------------
-- Tabs
----------------------------------------------------
local Home = Window:CreateTab("Home", "home")
local Fruits = Window:CreateTab("Fruits", "banana")
local Crystals = Window:CreateTab("Crystals", "gem")
local Spawn = Window:CreateTab("Add", "plus")
local More = Window:CreateTab("More", "settings")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

----------------------------------------------------
-- Home Tab
----------------------------------------------------
Home:CreateSection("Welcome to PotatOS")

-- Teleport to Home Button
Home:CreateButton(
    {
        Name = "Teleport to Home",
        Callback = function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local homePart =
                    workspace:FindFirstChild("MainTrees") and workspace.MainTrees:FindFirstChild(LocalPlayer.Name) and
                    workspace.MainTrees[LocalPlayer.Name]:FindFirstChild("LET_THERE_BE_LIGHT")
                if homePart then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = homePart.CFrame + Vector3.new(0, 3, 0)
                    Rayfield:Notify(
                        {
                            Title = "Teleported",
                            Content = "You have been teleported to your home!",
                            Duration = 3,
                            Image = "map-pin"
                        }
                    )
                else
                    Rayfield:Notify(
                        {
                            Title = "Teleport Failed",
                            Content = "Home not found.",
                            Duration = 3,
                            Image = "alert-triangle"
                        }
                    )
                end
            end
        end
    }
)

-- Teleport to Shop Button
Home:CreateButton(
    {
        Name = "Teleport to Shop",
        Callback = function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local shopPart =
                    workspace:FindFirstChild("Main Map Assets") and
                    workspace["Main Map Assets"]:FindFirstChild("Center Details & etc") and
                    workspace["Main Map Assets"]["Center Details & etc"]:FindFirstChild("Center Home") and
                    workspace["Main Map Assets"]["Center Details & etc"]["Center Home"]:FindFirstChild("Union")
                if shopPart then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = shopPart.CFrame + Vector3.new(0, 3, 0)
                    Rayfield:Notify(
                        {
                            Title = "Teleported",
                            Content = "You have been teleported to the shop!",
                            Duration = 3,
                            Image = "map-pin"
                        }
                    )
                else
                    Rayfield:Notify(
                        {
                            Title = "Teleport Failed",
                            Content = "Shop not found.",
                            Duration = 3,
                            Image = "alert-triangle"
                        }
                    )
                end
            end
        end
    }
)

----------------------------------------------------
-- Fruits Tab
----------------------------------------------------
local FruitSection = Fruits:CreateSection("Choose a fruit to clone")
Fruits:CreateDivider()

local fruitOptions = {
    "Potato (0 Silver)",
    "Apple (2 Silver)",
    "Blueberry Bundle (3 Silver)",
    "Kiwi (5 Silver)",
    "Orange (6 Silver)",
    "Banana (6 Silver)",
    "Peach (7 Silver)",
    "Pear (7 Silver)",
    "Green Apple (8 Silver)",
    "Blackberry Bundle (9 Silver)",
    "Lemon (12 Silver)",
    "Mango (17 Silver)",
    "Kumquat (20 Silver)",
    "Large Banana (20 Silver)",
    "Pomelo (30 Silver)",
    "Watermelon (40 Silver)",
    "Durian (80 Silver)",
    "Papaya (100 Silver)",
    "Horned Melon (120 Silver)",
    "Pineapple (425 Silver)"
}

local FruitDropdown =
    Fruits:CreateDropdown(
    {
        Name = "Fruit",
        Options = fruitOptions,
        CurrentOption = {"Apple (2 Silver)"},
        MultipleOptions = false,
        Flag = "FruitDropdown",
        Callback = function()
        end
    }
)

-- Clone Fruit Button
Fruits:CreateButton(
    {
        Name = "Clone Fruit",
        Callback = function()
            local selected = FruitDropdown.CurrentOption and FruitDropdown.CurrentOption[1]
            if selected then
                local fruitName = string.match(selected, "^(.-) %(") or selected
                for _, v in pairs(workspace.Fruits:GetChildren()) do
                    v.Tooltip.Value = fruitName
                    v.Name = fruitName
                    v:Clone().Parent = workspace.Fruits
                end
                Rayfield:Notify(
                    {
                        Title = "Fruit Cloned!",
                        Content = "Successfully cloned: " .. fruitName,
                        Duration = 3,
                        Image = "check-circle"
                    }
                )
            end
        end
    }
)

Fruits:CreateDivider()

-- Clear Fruits Button
Fruits:CreateButton(
    {
        Name = "Clear Fruits",
        Callback = function()
            for _, v in pairs(workspace.Fruits:GetChildren()) do
                if v.Name ~= "Tree" then
                    v:Destroy()
                end
            end
            Rayfield:Notify(
                {
                    Title = "Fruits Cleared",
                    Content = "All cloned fruits have been removed.",
                    Duration = 3,
                    Image = "trash-2"
                }
            )
        end
    }
)

----------------------------------------------------
-- Crystals Tab
----------------------------------------------------
local CrystalSection = Crystals:CreateSection("Choose a crystal to clone")
Crystals:CreateDivider()

local CrystalDropdown =
    Crystals:CreateDropdown(
    {
        Name = "Crystals",
        Options = {"Blue Crystal", "Purple Crystal", "Red Crystal", "Orange Crystal", "Green Crystal"},
        CurrentOption = {"Blue Crystal"},
        MultipleOptions = false,
        Flag = "CrystalDropdown",
        Callback = function()
        end
    }
)

-- Clone Crystal Button
Crystals:CreateButton(
    {
        Name = "Clone Crystal",
        Callback = function()
            local crystal = CrystalDropdown.CurrentOption and CrystalDropdown.CurrentOption[1]
            if crystal then
                for _, v in pairs(workspace.Fruits:GetChildren()) do
                    v.Tooltip.Value = crystal
                    v.Name = crystal
                    v:Clone().Parent = workspace.Fruits
                end
                Rayfield:Notify(
                    {
                        Title = "Crystal Cloned!",
                        Content = "Successfully cloned: " .. crystal,
                        Duration = 3,
                        Image = "gem"
                    }
                )
            end
        end
    }
)

Crystals:CreateDivider()

-- Clear Crystals Button
Crystals:CreateButton(
    {
        Name = "Clear Crystals",
        Callback = function()
            for _, v in pairs(workspace.Fruits:GetChildren()) do
                if v.Name:find("Crystal") then
                    v:Destroy()
                end
            end
            Rayfield:Notify(
                {
                    Title = "Crystals Cleared",
                    Content = "All cloned crystals have been removed.",
                    Duration = 3,
                    Image = "trash-2"
                }
            )
        end
    }
)

----------------------------------------------------
-- Spawn Tab
----------------------------------------------------
-- Fruits Section
local SpawnWarning = Spawn:CreateParagraph({Title = "Warning", Content = "Spawning is currently disabled"})

local SpawnFruitSection = Spawn:CreateSection("Spawn Fruits")

local SpawnFruitDropdown =
    Spawn:CreateDropdown(
    {
        Name = "Fruit",
        Options = fruitOptions,
        CurrentOption = {"Apple (2 Silver)"},
        MultipleOptions = false,
        Flag = "SpawnFruitDropdown",
        Callback = function()
        end
    }
)

Spawn:CreateButton(
    {
        Name = "Spawn Fruit",
        Callback = function()
            local selected = SpawnFruitDropdown.CurrentOption and SpawnFruitDropdown.CurrentOption[1]
            if selected and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local fruitName = string.match(selected, "^(.-) %(") or selected
                local fruit = Instance.new("Model")
                fruit.Name = fruitName
                fruit.PrimaryPart = Instance.new("Part")
                fruit.PrimaryPart.Parent = fruit
                fruit:SetPrimaryPartCFrame(
                    CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                )
                fruit.Parent = workspace.Fruits
                Rayfield:Notify(
                    {
                        Title = "Fruit Spawned",
                        Content = fruitName .. " has been spawned above you.",
                        Duration = 3,
                        Image = "check-circle"
                    }
                )
            end
        end
    }
)

Spawn:CreateDivider()

-- Crystals Section
local SpawnCrystalSection = Spawn:CreateSection("Spawn Crystals")

local SpawnCrystalDropdown =
    Spawn:CreateDropdown(
    {
        Name = "Crystal",
        Options = {"Blue Crystal", "Purple Crystal", "Red Crystal", "Orange Crystal", "Green Crystal"},
        CurrentOption = {"Blue Crystal"},
        MultipleOptions = false,
        Flag = "SpawnCrystalDropdown",
        Callback = function()
        end
    }
)

Spawn:CreateButton(
    {
        Name = "Spawn Crystal",
        Callback = function()
            local selected = SpawnCrystalDropdown.CurrentOption and SpawnCrystalDropdown.CurrentOption[1]
            if selected and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local crystal = Instance.new("Model")
                crystal.Name = selected
                crystal.PrimaryPart = Instance.new("Part")
                crystal.PrimaryPart.Parent = crystal
                crystal:SetPrimaryPartCFrame(
                    CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                )
                crystal.Parent = workspace.Fruits
                Rayfield:Notify(
                    {
                        Title = "Crystal Spawned",
                        Content = selected .. " has been spawned above you.",
                        Duration = 3,
                        Image = "gem"
                    }
                )
            end
        end
    }
)

-- Dev Fruits Section
Spawn:CreateDivider()
local DevFruitsSection = Spawn:CreateSection("Dev Fruits")

local devFruits = {"Dragonfruit", "Small Banana", "Candy Cane"}

for _, fruit in pairs(devFruits) do
    Spawn:CreateButton(
        {
            Name = "Spawn " .. fruit,
            Callback = function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local model = Instance.new("Model")
                    model.Name = fruit
                    model.PrimaryPart = Instance.new("Part")
                    model.PrimaryPart.Parent = model
                    model:SetPrimaryPartCFrame(
                        CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                    )
                    model.Parent = workspace.Fruits
                    Rayfield:Notify(
                        {
                            Title = "Dev Fruit Spawned",
                            Content = fruit .. " has been spawned above you.",
                            Duration = 3,
                            Image = "check-circle"
                        }
                    )
                end
            end
        }
    )
end

----------------------------------------------------
-- More Tab (LocalPlayer / Teleport / Close UI)
----------------------------------------------------
More:CreateSection("LocalPlayer")

More:CreateSlider(
    {
        Name = "WalkSpeed",
        Range = {8, 100},
        Increment = 1,
        Suffix = "Speed",
        CurrentValue = 16,
        Flag = "WalkSpeedSlider",
        Callback = function(Value)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
            end
        end
    }
)

More:CreateSlider(
    {
        Name = "Jump Height",
        Range = {25, 200},
        Increment = 5,
        Suffix = "Power",
        CurrentValue = 50,
        Flag = "JumpSlider",
        Callback = function(Value)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Value
            end
        end
    }
)

More:CreateDivider()

-- Teleporter Section
More:CreateSection("Teleport to Player")

local function getPlayerNames()
    local names = {}
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    return names
end

local TeleportDropdown =
    More:CreateDropdown(
    {
        Name = "Player",
        Options = getPlayerNames(),
        CurrentOption = {},
        MultipleOptions = false,
        Flag = "TeleportDropdown"
    }
)

-- Button to teleport to selected player
More:CreateButton(
    {
        Name = "Teleport Now",
        Callback = function()
            local selected = TeleportDropdown.CurrentOption and TeleportDropdown.CurrentOption[1]
            local target = selected and Players:FindFirstChild(selected)
            if
                target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and
                    LocalPlayer.Character
             then
                local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                end
                Rayfield:Notify(
                    {
                        Title = "Teleport Successful",
                        Content = "Teleported to " .. selected,
                        Duration = 3,
                        Image = "map-pin"
                    }
                )
            else
                Rayfield:Notify(
                    {
                        Title = "Teleport Failed",
                        Content = "Player not found or invalid target.",
                        Duration = 3,
                        Image = "alert-triangle"
                    }
                )
            end
        end
    }
)

-- Refresh button
More:CreateButton(
    {
        Name = "Refresh Player List",
        Callback = function()
            TeleportDropdown:Set(getPlayerNames())
            Rayfield:Notify(
                {
                    Title = "Player List Refreshed",
                    Content = "Teleport dropdown updated.",
                    Duration = 2,
                    Image = "refresh-ccw"
                }
            )
        end
    }
)

Players.PlayerAdded:Connect(
    function()
        TeleportDropdown:Set(getPlayerNames())
    end
)
Players.PlayerRemoving:Connect(
    function()
        TeleportDropdown:Set(getPlayerNames())
    end
)

More:CreateDivider()

-- Close UI Section
More:CreateSection("Close UI")

More:CreateButton(
    {
        Name = "Close UI",
        Callback = function()
            if Rayfield and Rayfield.Destroy then
                Rayfield:Destroy()
            elseif game.CoreGui:FindFirstChild("Rayfield") then
                game.CoreGui:FindFirstChild("Rayfield"):Destroy()
            end
            warn("Rayfield UI closed.")
        end
    }
)
