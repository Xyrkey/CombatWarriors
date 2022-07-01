loadstring(game:HttpGet"https://raw.githubusercontent.com/Wheeleee/AIMWARE/main/Startup")()
loadstring(game:HttpGet("https://projecthook.xyz/scripts/new-free.lua"))()
local lp = game.Players.LocalPlayer

local animationInfo = {}

function getInfo(id)
  local success, info = pcall(function()
      return game:GetService("MarketplaceService"):GetProductInfo(id)
  end)
  if success then
      return info
  end
  return {Name=''}
end
function block(player)
  keypress(0x46)
  wait()
  keyrelease(0x46)
end

local AnimNames = {
  'Slash',
  'Swing',
  'Sword'
}

function playerAdded(v)
    local function charadded(char)
      local humanoid = char:WaitForChild("Humanoid", 5)
      if humanoid then
          humanoid.AnimationPlayed:Connect(function(track)
              local info = animationInfo[track.Animation.AnimationId]
              if not info then
                  info = getInfo(tonumber(track.Animation.AnimationId:match("%d+")))
                  animationInfo[track.Animation.AnimationId] = info
              end
             
              if (lp.Character and lp.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Head")) then
                  local mag = (v.Character.Head.Position - lp.Character.Head.Position).Magnitude
                  if mag < 15  then
                     
                      for _, animName in pairs(AnimNames) do
                          if info.Name:match(animName) then
                              pcall(block, v)
                          end
                      end
                     
                  end
              end
          end)
      end
  end
 
  if v.Character then
      charadded(v.Character)
  end
  v.CharacterAdded:Connect(charadded)
end

for i,v in pairs(game.Players:GetPlayers()) do
   if v ~= lp then
       playerAdded(v)
   end
end

game.Players.PlayerAdded:Connect(playerAdded)

local uis = game:GetService("UserInputService")
    local Jump = true

    uis.InputBegan:Connect(function(input,gameProcessedEvent) if not gameProcessedEvent then
	    if input.KeyCode == Enum.KeyCode.R then
	        if Jump == true then
	            Jump = false
	            getgenv().Glitch = true

	            local Players = game.Players

	            while getgenv().Glitch do wait()
	            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(1, 1, 1)
	            end
	        elseif Jump == false then
	            Jump = true
	            getgenv().Glitch = false
	        end
	    elseif input.KeyCode == Enum.KeyCode.E then
	        if getgenv().Glitch == true then
	            wait(0)
	            keypress(0x20)
	            wait(1)
	            keyrelease(0x20)
	        end
	    end
    end
    end)
 
