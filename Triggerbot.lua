local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local CopyButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "DiscordHub"
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(1, -225, 0.5, -60)
MainFrame.Size = UDim2.new(0, 210, 0, 110)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = MainFrame

TextLabel.Parent = MainFrame
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 10, 0, 10)
TextLabel.Size = UDim2.new(0, 190, 0, 45)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Join discord.gg/VsmqqSkPXZ to buy"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true 
TextLabel.TextWrapped = true

CopyButton.Name = "CopyButton"
CopyButton.Parent = MainFrame
CopyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CopyButton.Position = UDim2.new(0, 25, 0, 65)
CopyButton.Size = UDim2.new(0, 160, 0, 30)
CopyButton.Font = Enum.Font.GothamSemibold
CopyButton.Text = "Copy Link"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 14

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = CopyButton

local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local discordLink = "https://discord.gg/VsmqqSkPXZ"

CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(discordLink)
        CopyButton.Text = "Copied!"
        CopyButton.BackgroundColor3 = Color3.fromRGB(70, 180, 70)
        task.wait(2)
        CopyButton.Text = "Copy Link"
        CopyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    else
        CopyButton.Text = "Not Supported"
    end
end)
