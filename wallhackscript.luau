local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
local function addUICorner(parent, radius)
	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(0, radius)  
	uiCorner.Parent = parent
end
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 200, 0, 50)
openButton.Position = UDim2.new(0.5, -100, 0.1, 0)
openButton.Text = "Open"
openButton.TextSize = 20
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
openButton.BorderSizePixel = 0
openButton.Parent = screenGui
addUICorner(openButton, 10)  
openButton.Font = Enum.Font.SourceSansBold 
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.5, 0)
frame.Position = UDim2.new(0.25, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderSizePixel = 0
frame.Visible = false  
frame.Parent = screenGui
addUICorner(frame, 20)  
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.2, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.Text = "Highlight Players"
textLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
textLabel.TextSize = 24
textLabel.BackgroundTransparency = 1  
textLabel.Parent = frame
textLabel.Font = Enum.Font.SourceSansBold  
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(0.5, -100, 0.5, -25)
toggleButton.Text = "Toggle Highlight"
toggleButton.TextSize = 20
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
toggleButton.BorderSizePixel = 0
toggleButton.Parent = frame
addUICorner(toggleButton, 10) 
toggleButton.Font = Enum.Font.SourceSansBold 
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 200, 0, 50)
closeButton.Position = UDim2.new(0.5, -100, 0.5, 25)
closeButton.Text = "Close"
closeButton.TextSize = 20
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Parent = frame
addUICorner(closeButton, 10)
closeButton.Font = Enum.Font.SourceSansBold
local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, 0, 0.1, 0)  
creditLabel.Position = UDim2.new(0, 0, 1, -30)  
creditLabel.Text = "made by Mah1ky"
creditLabel.TextSize = 18
creditLabel.TextColor3 = Color3.fromRGB(0, 0, 0)  
creditLabel.BackgroundTransparency = 1  
creditLabel.Font = Enum.Font.SourceSansBold  
creditLabel.Parent = frame
local highlightsEnabled = false
local function toggleHighlightPlayers()
	highlightsEnabled = not highlightsEnabled  
	-- First, remove any existing highlights from players
	for _, child in pairs(workspace:GetChildren()) do
		if child:IsA("Model") and child:FindFirstChild("Highlight") then
			child.Highlight:Destroy()
		end
		if child:IsA("Model") and child:FindFirstChild("PlayerNameTag") then
			child.PlayerNameTag:Destroy()
		end
	end
	for _, targetPlayer in pairs(game.Players:GetPlayers()) do
		if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			if highlightsEnabled then
				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Size = UDim2.new(0, 200, 0, 50)
				billboardGui.Adornee = targetPlayer.Character.Head  
				billboardGui.StudsOffset = Vector3.new(0, 2, 0) 
				billboardGui.Name = "PlayerNameTag"
				billboardGui.Parent = targetPlayer.Character
				local nameLabel = Instance.new("TextLabel")
				nameLabel.Size = UDim2.new(1, 0, 1, 0)
				nameLabel.Text = targetPlayer.Name
				nameLabel.TextSize = 18
				nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  
				nameLabel.BackgroundTransparency = 1  
				nameLabel.Font = Enum.Font.SourceSansBold  
				nameLabel.TextStrokeTransparency = 0.5  
				nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  
				nameLabel.Parent = billboardGui
				local highlight = Instance.new("Highlight")
				highlight.Parent = targetPlayer.Character
				highlight.FillColor = Color3.fromRGB(255, 0, 0)
				highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
				highlight.Name = "Highlight"
			end
		end
	end
	if highlightsEnabled then
		textLabel.Text = "Highlight: ON"
	else
		textLabel.Text = "Highlight: OFF"
	end
end
toggleButton.MouseButton1Click:Connect(function()
	toggleHighlightPlayers()
end)
closeButton.MouseButton1Click:Connect(function()
	frame.Visible = false  
	openButton.Visible = true  
end)
openButton.MouseButton1Click:Connect(function()
	frame.Visible = true  
	openButton.Visible = false  
end)
