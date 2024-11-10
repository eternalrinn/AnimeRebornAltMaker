print("Claiming Dailies")
local args = {
    [1] = "DailyRewards/ClaimCurrentDay"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UiCommunication"):FireServer(unpack(args))
wait(2)
local args = {
    [1] = "ClaimQuest",
    [2] = "FreeDaily"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Quests"):InvokeServer(unpack(args))

print("Redeeming Codes")
local codes = {
    "SubtoRlxsage",
    "SubtoZillas",
    "RELEASE",
    "MOZKING",
    "1MVisits",
    "200kMembers",
    "50KLikes",
    "2MVisits"
}

for _, code in ipairs(codes) do
    wait(3)
    local args = {
        [1] = "Codes/RedeemCode",
        [2] = code
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UiCommunication"):FireServer(unpack(args))
end    

print("Autosells")
for _, sell in ipairs(getgenv().AutoSells) do
    local args = {
        [1] = "ToggleAutoSell",
        [2] = sell
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Summoning"):WaitForChild("SummonFunction"):InvokeServer(unpack(args))
end


local function ClaimUnitIndex()
    local args = {
        [1] = "UnitIndex/ClaimAllPrizes"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UiCommunication"):FireServer(unpack(args))
end
    

print("Summoning")
wait(4)
while true do
    local gems = game.Players.LocalPlayer.PlayerGui.Main.Hotbar.Currencies.Gems.TextLabel.Text
    local cleanedGems = gems:gsub("[^%d]", "")
    local converted = tonumber(cleanedGems)
    if converted > 500 then
        local args = {
            [1] = "Summon10"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Summoning"):WaitForChild("SummonEvent"):FireServer(unpack(args))

        ClaimUnitIndex()
        
    elseif converted > 50 then
        local args = {
            [1] = "Summon1"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Summoning"):WaitForChild("SummonEvent"):FireServer(unpack(args))

        ClaimUnitIndex()
        
    elseif converted < 50 then
        break
    end
    task.wait()
end
