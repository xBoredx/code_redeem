local codetable = {"SNOWMAN_SHUTDOWN", "SANTA_SHUTDOWN", "WINTER_SHUTDOWN", "WINTER_UPD", "AWESOME_SHUTDOWN"}

for _, code in ipairs(codetable) do
    task.wait(2)
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
