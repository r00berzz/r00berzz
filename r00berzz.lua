local RayfieldURL = 'https://raw.githubusercontent.com/r00berzz/r00berzz/raw/r00berzz.lua'
local success, RayfieldScript = pcall(function() return game:HttpGet(RayfieldURL) end)

if success and RayfieldScript then
    print("Successfully got the Rayfield script")
    local success, Rayfield = pcall(function() return loadstring(RayfieldScript)() end)
    
    if success and Rayfield then
        print("Successfully loaded Rayfield")
        local success, Window = pcall(function() return Rayfield:CreateWindow({
            Name = "Je n'ai pas de nom pour le hub",
            LoadingTitle = "r00berzz hub",
            LoadingSubtitle = "by r00berzz",
            ConfigurationSaving = {
                Enabled = false,
                FolderName = nil,
                FileName = "hub"
            },
            Discord = {
                Enabled = true,
                Invite = "B7yK5JJpwU",
                RememberJoins = true
            },
            KeySystem = false,
            KeySettings = {
                Title = "Untitled",
                Subtitle = "Key System",
                Note = "No method of obtaining the key is provided",
                FileName = "Key",
                SaveKey = true,
                GrabKeyFromSite = false,
                Key = {"Hello"}
            }
        }) end)
        
        if success and Window then
            print("Successfully created window")
            
            local MainTab = Window:CreateTab("🏠 Home", nil)
            local MainSection = MainTab:CreateSection("Main")

            Rayfield:Notify({
                Title = "Tu as éxécuté le script mon ami !",
                Content = "Pas d'inspi",
                Duration = 5,
                Image = nil,
                Actions = {
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
                    local UIS = game:GetService("UserInputService")
                    local Player = game.Players.LocalPlayer
                    local Mouse = Player:GetMouse()

                    local function GetCharacter()
                        return game.Players.LocalPlayer.Character
                    end

                    local function Teleport(pos)
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
                waitForHumanoid(character)
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

            local Slider = MainTab:CreateSlider({
                Name = "JumpPower",
                Range = {0, 300},
                Increment = 1,
                Suffix = "jump",
                CurrentValue = 10,
                Flag = "Slider1",
                Callback = function(Value)
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
                end,
            })
        else
            print("Failed to create window")
        end
    else
        print("Failed to load Rayfield")
    end
else
    print("Failed to get Rayfield script")
end
