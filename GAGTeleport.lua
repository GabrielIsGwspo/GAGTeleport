local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Replace with your actual place ID
local PLACE_ID = 126884695634066

local jobIds = {
    "f5e2c2e1-8b77-4b98-b9e5-1db3dd6e8260","6a892679-69c7-4bd2-9041-11eaa81c3b52","49d9c101-bb96-448c-b769-6b878c196f50","89747be4-5978-4e99-a893-e8e0d5843e7",
    "816feef1-b570-4494-b431-420b8415dd59","d92f4ac7-3483-41fa-ba95-593da24e24a1","9e5321a0-c2a2-4e47-98b0-04bc2600fba6","954b40c9-08b1-43f9-8ca1-6c1f4cabbe04",
    "4d584a32-ff7e-4bca-b8e0-2bc9687b1c6a","cd7b39ed-b309-4a04-99bf-9fb3796105d6","ade55a93-e13b-47ef-a58c-9d420bbd11e7","d48da15b-2912-41fa-9729-4690e07c35c2",
    "4626e727-1e6c-4e9a-8d05-cef951d051fd","9ee2ccca-621a-4d50-b61c-50a7f217f62c","895776dd-657f-43bf-aac6-d4f0f8bcbd13","17db302a-7fc0-47d8-be8e-48f1701c33e1",
    "9e5321a0-c2a2-4e47-98b0-04bc2600fba6","15a3b62e-445b-4336-81fc-9e767a96c794","83bc1b4b-1d47-4dcb-bf15-051d47686c6a","4d584a32-ff7e-4bca-b8e0-2bc9687b1c6a",
    "12d1c562-4747-4d2f-8c4c-c7bdc2b210fe","eacc246c-ea6c-4d96-b805-6897d78e45e6","96d5a6c6-ee73-4e43-bc70-bb2c99d5146a","5600336e-5f96-42a8-a913-12f9a2d43614",
    "dc911049-f733-4e9a-9464-94841ac21dc0","222e338d-481f-407b-ba4d-325b91e0310b","070cc93b-1ef8-4646-bcfe-829b7231a230","930a263b-f850-492b-8496-227c08fd148d",
    "43282a7a-9274-4962-b018-0b44e9287a2d","d1c694a9-e243-46f3-855e-30dd2ff64bb1","d1e50dd5-a90b-4782-ab88-9f414929e7c6","2b22a78b-f98f-4361-99f3-90b869a07e79",
    "6de7babc-5d56-44ae-955a-a3152334fea4","92d169ec-6676-40f9-ab83-586cbe08d1c7","e8e628f8-1306-4e6d-a464-966e17580d17","530771f1-a737-439f-ac38-83674ef472b3",
    "047d81e1-82f3-4e73-aad8-8244bf4c3b50","09d826c5-0280-48db-b7f9-dcc87827546","dfeb0ef4-19cb-43c2-8691-fab20289e656","c6fc83e3-fcfb-4070-941f-6c96fbaff445",
    "f56fbdb6-f23b-47a2-96f5-06ba2e95b750","23d6132e-16ed-4348-9865-77d1afcde8d2","f16c8582-580c-46e5-87a7-9c0a1578d304","62c831c2-6ff8-463e-b26e-2ae577b7e8cc",
    "64a05aad-04b4-4b62-b731-91e55fac360f","f16c8582-580c-46e5-87a7-9c0a1578d304","62c831c2-6ff8-463e-b26e-2ae577b7e8cc","e8234da7-5c53-4008-aa36-5163b28ed9d",
    "f128295e-d0a2-4a41-ab25-6f8ff22e4ce7","55691982-d532-48f6-a183-f8e667fcc64e","2a4c2857-f95a-429d-8971-5906ad341465","c42d2902-252c-4d3e-a78a-a117cf7d85c2",
    "744def34-9106-47ca-a7e7-4cbf260a9ad6","57e7f46b-e9d3-4dc3-be65-fb40c8153e22","023a0682-5dc4-4964-b30d-a7222333164","e84f9994-409e-4c0e-8e78-8db6ed2b4b81",
    "ec16b73f-331c-409b-a94e-a89ab8af8dfd","93931bbe-bf12-49bf-9521-3e8edc6e041e"
}

-- GUI setup
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TeleportGui"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 180)
frame.Position = UDim2.new(0.5, -160, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "Grow a Garden Teleporter"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.9, 0, 0, 45)
button.Position = UDim2.new(0.05, 0, 0.5, -22)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.Gotham
button.TextSize = 18
button.Text = "Teleport to Random Server"
button.BorderSizePixel = 0

local stroke = Instance.new("UIStroke", button)
stroke.Thickness = 1
stroke.Color = Color3.fromRGB(255, 255, 255)

button.MouseButton1Click:Connect(function()
    local id = jobIds[math.random(1, #jobIds)]
    local success, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(PLACE_ID, id, player)
    end)
    if not success then
        warn("Teleport failed: " .. tostring(err))
    end
end)