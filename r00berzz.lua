local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/r00berzz/r00berzz/raw/r00berzz.lua'))()

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
