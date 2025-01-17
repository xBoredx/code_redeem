local RedeemCodes = game:GetService("ReplicatedStorage").Packages.Knit.Services.CodesService.RF.Redeem

local Codes = {
    "THANKYOU",
    "TRAILER20K",
    "THANKSGIVING",
    "20KLIKES",
    "40KLIKES",
    "FORGIVEME",
    "70KLIKES",
    "100KLIKES",
    "150KWOW",
    "200CRAZY",
    "300KLIKES",
    "GAGAMARU",
    "400KLIKES",
    "ITOSHIBROTHERS",
    "500KLIKES",
    "600KCRAZY",
    "700KLIKES",
    "AIKU",
    "1MLIKES",
    "900KLIKES",
    "800KLIKES",
    "HOORAY",
    "SORRYDELAY",
    "WINTERPART2",
    "1KTATLIS",
    "5KTATLIS",
    "CHRISTMAS",
    "MRSPAX",
    "15KTATLIS",
    "20KCHROLLO",
    "5KVID",
    "35KCHROLLO",
    "300KREO",
    "25KTATLIS"
}

local function redeemCodes()
    for _, code in ipairs(Codes) do
        print("Attempting to redeem code:", code)
        local success, response = pcall(function()
            return RedeemCodes:InvokeServer(code)
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
