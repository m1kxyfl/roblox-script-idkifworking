local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(0.5, -100, 0, 50)
toggleButton.Text = "Toggle Song Picker"
toggleButton.Parent = screenGui
local songFrame = Instance.new("Frame")
songFrame.Size = UDim2.new(0, 300, 0, 250)
songFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
songFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
songFrame.Visible = false
songFrame.Parent = screenGui
local songLabel = Instance.new("TextLabel")
songLabel.Size = UDim2.new(0, 280, 0, 50)
songLabel.Position = UDim2.new(0, 10, 0, 10)
songLabel.Text = "Song Picker"
songLabel.TextSize = 24
songLabel.Parent = songFrame
local songTextBox = Instance.new("TextBox")
songTextBox.Size = UDim2.new(0, 280, 0, 50)
songTextBox.Position = UDim2.new(0, 10, 0, 70)
songTextBox.PlaceholderText = "Enter Song ID"
songTextBox.Text = "142376088"  
songTextBox.Parent = songFrame
local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0, 280, 0, 50)
playButton.Position = UDim2.new(0, 10, 0, 130)
playButton.Text = "Play Song"
playButton.Parent = songFrame
local validationLabel = Instance.new("TextLabel")
validationLabel.Size = UDim2.new(0, 280, 0, 50)
validationLabel.Position = UDim2.new(0, 10, 0, 190)
validationLabel.Text = "Song is invalid"
validationLabel.TextSize = 18
validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  
validationLabel.Visible = false
validationLabel.Parent = songFrame
toggleButton.MouseButton1Click:Connect(function()
    songFrame.Visible = not songFrame.Visible
end)
playButton.MouseButton1Click:Connect(function()
    local songID = songTextBox.Text
    if songID ~= "" then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. songID
        local success, errorMessage = pcall(function()
            sound.Parent = game.Workspace
            sound:Play()
        end)
        if success then
            validationLabel.Text = "Song is valid!"
            validationLabel.TextColor3 = Color3.fromRGB(0, 255, 0) 
            validationLabel.Visible = true
        else
            validationLabel.Text = "Song is invalid"
            validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            validationLabel.Visible = true
        end
    else
        validationLabel.Text = "Please enter a song ID!"
        validationLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
        validationLabel.Visible = true
    end
end)
