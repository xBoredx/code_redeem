local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CodeServices = ReplicatedStorage.Packages.Knit.Services:WaitForChild("CodesService")
local Redeem = CodeServices.RF:WaitForChild("Redeem")

local Codes = {
    "THANKYOU",
    "TRAILER20K",
    "20KLIKESPT2",
    "YUKIMIYA",
    "30KLIKES",
    "60KFOLLOWERS",
    "MONST3R",
    "DRAGON",
    "THX30KLIKES",
}

local function redeemCodes()
    for _, code in ipairs(Codes) do
        print("Attempting to redeem code:", code)
        local success, response = pcall(function()
            return Redeem:InvokeServer(code)
        end)
        if success then
            if response then
                print("Successfully redeemed code:", code, "Response:", response)
            else
                print("Code:", code, "Response: No response or invalid.")
            end
        else
            warn("Failed to redeem code:", code, "Error:", tostring(response))
        end
        wait(5)
    end
    print("Finished redeeming codes.")
end

redeemCodes()
