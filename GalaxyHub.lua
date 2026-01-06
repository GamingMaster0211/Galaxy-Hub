--[[

    Galaxy Hub is made by GamingMaster0211 on Roblox. GamingMaster0211 on GitHub.
    Galaxy Hub uses the ui library Rayfield in order to create the hub itself.
    Anyone can use this code for their own hub, but licensing it so the creator cannot use this code is strictly prohibited.

]]--

--[[

    Supported Games:

    - Main Hub: All games that use player walkspeed and player jumpheight. Won't work in games that have anticheats for those.

    Upcoming Support For Games:

    - Babft

]]--

if game.PlaceId == 537413528 then
    loadstring(game:HttpGet(""))()
end

local UiLibrary = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local GHVersion = "1.01.14"
local Player = game:GetService("Players").LocalPlayer

local function PlayerCheck()
    while true do
        wait(0.01)

        if not Player then
            return
        else
            print(Player.Name .. " was found. Attaching the PlayerCheck() function to them.")

            while Player do
                wait(0.01)

                if Player:Kick() then
                    return
                end
            end 
        end
    end

    -- More is to be added here soon.
end

local MainWindow = UiLibrary:CreateWindow({
    Name = "Galaxy Hub | X EDITION | Version: " .. GHVersion,
    LoadingTitle = "Galaxy Hub",
    LoadingSubtitle = "Loading...",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "Config"
    },
    KeySystem = false
})

UiLibrary:Notify({
   Title = "Galaxy Hub Loaded",
   Content = "Galaxy Hub Successfully loaded!",
   Duration = 6,
   Image = "check-circle"
})

local MainTab = MainWindow:CreateTab("Main", "home")
local SettingsTab = MainWindow:CreateTab("Settings", "settings")
local InfoTab = MainWindow:CreatTab("Info", "info")

local WalkSpeed = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {1, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Walkspeed",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local JumpHeight = MainTab:CreateSlider({
   Name = "Jumpheight",
   Range = {1, 100},
   Increment = 1,
   Suffix = "Height",
   CurrentValue = 7.2,
   Flag = "Jumpheight",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
   end,
})

local PlayerChecks = SettingsTab:CreateToggle({
   Name = "Enable Player Checks",
   CurrentValue = false,
   Flag = "Playerchecking",
   Callback = function(Value)
      UiLibrary:Notify({
          Title = "Player Checks",
          Content = "Player Checks are now enabled. To disable this feature, please rejoin, or reload Galaxy Hub.",
          Duration = 6,
          Image = "check-circle"
      })

      PlayerCheck()
   end,
})
