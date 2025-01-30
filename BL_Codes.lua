local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Knit")
local Services = Knit:WaitForChild("Services")
local CodesService = Services:WaitForChild("CodesService")

local RF = CodesService:WaitForChild("RF")
local Redeem = RF:WaitForChild("Redeem")

if not Redeem or not Redeem:IsA("RemoteFunction") then
    warn("[ERROR] Redeem RemoteFunction is missing or invalid.")
    return
end

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
        print("[INFO] Attempting to redeem code:", code)

        local success, response = pcall(function()
            return Redeem:InvokeServer(code)
        end)

        if success then
            if response then
                print("[SUCCESS] Code:", code, "| Server Response:", response)
            else
                print("[FAILED] Code:", code, "| No response (already redeemed or invalid)")
            end
        else
            warn("[ERROR] Failed to redeem code:", code, "| Error:", tostring(response))
        end
        task.wait(2)
    end
    print("[INFO] Finished redeeming codes.")
end

redeemCodes()
