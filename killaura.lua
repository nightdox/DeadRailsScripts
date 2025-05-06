-- KillAura Avançado feito por beabadoobee 💀
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local HRP = char:WaitForChild("HumanoidRootPart")

local range = 20
local damage = 50
local enabled = false

-- Criar GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 140, 0, 40)
btn.Position = UDim2.new(0, 20, 0, 100)
btn.Text = "KillAura: OFF"
btn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
btn.TextColor3 = Color3.new(1, 1, 1)

-- Função de ataque
local function doKillAura()
    for _, mob in pairs(workspace:GetDescendants()) do
        if mob:IsA("Model") and mob:FindFirstChild("Humanoid") and mob ~= char then
            local targetHRP = mob:FindFirstChild("HumanoidRootPart")
            if targetHRP and (targetHRP.Position - HRP.Position).Magnitude <= range then
                mob.Humanoid:TakeDamage(damage)
            end
        end
    end
end

-- Loop de ataque
task.spawn(function()
    while true do
        task.wait(0.3)
        if enabled then
            pcall(doKillAura)
        end
    end
end)

-- Alternar KillAura
btn.MouseButton1Click:Connect(function()
    enabled = not enabled
    btn.Text = enabled and "KillAura: ON" or "KillAura: OFF"
    btn.BackgroundColor3 = enabled and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(100, 0, 0)
end)

print("Script KillAura by beabadoobee carregado com sucesso.")
