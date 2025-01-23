local codetable = {"WORLD_TRADING_UPDATE", "SNOWMAN_SHUTDOWN", "I_LOVE_SHUTDOWNS", "WINTER_UPD"}

for _, code in ipairs(codetable) do
    task.wait(3.75)
    print("Redeeming code:", code)
    
    local success, result = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.Server.Data.RedeemCode:InvokeServer(code)
    end)
    
    if success then
        print("Successfully redeemed code:", code, "Result:", result)
    else
        warn("Failed to redeem code:", code, "Error:", result)
    end
    task.wait()
end
