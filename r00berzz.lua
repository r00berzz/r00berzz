local Rayfield = loadstring(game:HttpGet('https://[Log in to view URL]'))()

local Window = Rayfield:CreateWindow({
   Name = "Je n'ai pas de nom pour le hub",
   LoadingTitle = "r00berzz hub",
   LoadingSubtitle = "by r00berzz",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "hub"
   },
   Discord = {
      Enabled = true,
      Invite = "B7yK5JJpwU", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠 Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Tu as éxécuté le script mon ami !",
   Content = "Pas d'inspi",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "azé",
         Callback = function()
         print("The user tapped azé")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Crtl+Click tp",
   Callback = function()
   -- The function that takes place when the button is pressed
            local UIS = game:GetService("UserInputService")
 
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
 
 
function GetCharacter()
   return game.Players.LocalPlayer.Character
end
 
function Teleport(pos)
   local Char = GetCharacter()
   if Char then
       Char:MoveTo(pos)
   end
end
 
 
UIS.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
       Teleport(Mouse.Hit.p)
   end
end)
   end,
})

local infJumpEnabled = false

local Button = MainTab:CreateButton({
    Name = "Infinite Jump",
    Callback = function()
        infJumpEnabled = not infJumpEnabled
        if infJumpEnabled then
            game:GetService("UserInputService").jumpRequest:Connect(function()
                if infJumpEnabled then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
        else
            game:GetService("UserInputService"):UnbindFromKey(Enum.KeyCode.Space)
        end
    end
})


print("Script started")

local function waitForHumanoid(character)
    while not character:FindFirstChild("Humanoid") do
        wait(0.1)
    end
    return character.Humanoid
end

local function setWalkSpeed(Value)
    print("Callback called with value: " .. Value)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = waitForHumanoid(player.Character)
        if humanoid then
            print("Setting WalkSpeed to: " .. Value)
            humanoid.WalkSpeed = Value
        else
            print("Humanoid not found")
        end
    else
        print("Player or Character not found")
    end
end

local player = game.Players.LocalPlayer
player.CharacterAdded:Connect(function(character)
    waitForHumanoid(character) -- S'assurer que le Humanoid est prêt quand le personnage est ajouté
end)

print("Script started")

local function waitForHumanoid(character)
    while not character:FindFirstChild("Humanoid") do
        wait(0.1)
    end
    return character.Humanoid
end

local function setWalkSpeed(Value)
    print("Callback called with value: " .. Value)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = waitForHumanoid(player.Character)
        if humanoid then
            print("Setting WalkSpeed to: " .. Value)
            humanoid.WalkSpeed = Value
        else
            print("Humanoid not found")
        end
    else
        print("Player or Character not found")
    end
end

local player = game.Players.LocalPlayer
player.CharacterAdded:Connect(function(character)
    waitForHumanoid(character) -- S'assurer que le Humanoid est prêt quand le personnage est ajouté
end)

local Slider = MainTab:CreateSlider({
    Name = "walkspeed",
    Range = {0, 300},
    Increment = 1,
    Suffix = " speed",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = setWalkSpeed,
})

print("Slider created")


print("Slider created")

local Slider = MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 300},
   Increment = 1,
   Suffix = "jump",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

