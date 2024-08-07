-- NOTE : Some parts of scripts are not exactly scripted, and some are created by others(Like dizzy made admin pad grab and anti brick kill), other parts of scripts are either scripted or copied from my previous script(XKah(XK or XKV1))

wait(1)

local antikill = true

local lp = game.Players.LocalPlayer
local char = lp.Character

local adminf = game:GetService("Workspace").Terrain["_Game"].Admin
local rp = game:GetService("Workspace").Terrain["_Game"].Admin:FindFirstChild("Regen")
local terrain = game:GetService("Workspace").Terrain
local gamev = terrain["_Game"]
local folder = gamev.Folder
local adminpads = adminf.Pads:GetChildren()

local rtx = {
  sunrise = {"outdoorambient 0.7 0.7 0.7", "ambient 100 0 100", "fogend 3000", "time 6.9", "colorshifttop 100 50 0", "colorshiftbottom 0 0 0"}
}

local blacklist = {}

local function ct(a)

  game.Players:Chat(a)

end

local function plrcheck(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
    if plr == string.sub(v.Name:lower(), 1, #plr) or plr == string.sub(v.DisplayName:lower(), 1, #plr) then
      print("plr: "..v.Name)
      gplr = v.Name
    end
  end
end

local function tct(a)

  for _, v in ipairs(a) do
    ct(v)
  end
end

local function h(b)

  ct("h "..tostring(b))

end

local function Regen()
  fireclickdetector(rp.ClickDetector)
end

local function a(plr)

  plr.Chatted:Connect(function(m)

    local p = ";"
    local split = string.split(m, " ")
    local cmd = split[1] or split[1]:find(p)
    local args1 = split[2]
    local args2 = split[3]
    local args3 = split[4]
    local args4 = split[5]

    if plr == game.Players.LocalPlayer then

      if cmd == "re" then

        ct("reset me")

      end

      if cmd == "regen" then

        Regen()

      end

      if cmd == "rail" then

      ct("ungear me")
      ct("samount "..args2)
      ct("sup gear me 79446473")
      ct("equipall")
      wait(1)
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
          wait(args3)
          plrcheck(args1)
          if v.Name == "Railgun" then
            v.Click:FireServer(game.Players[gplr].Character:GetPivot().Position)
          end
        end
      end

      if cmd == "bl" then
        plrcheck(args1)
        table.insert(blacklist, gplr)
      elseif cmd == "unbl" then
        plrcheck(args1)
        for i, v in pairs(blacklist) do
          if v == gplr then
            table.remove(blacklist, i)
          end
        end
      end
      if cmd == "laser" then

      ct("ungear me")
      ct("samount "..args2)
      ct("sup gear me 139578207")
      ct("equipall")
      wait(1)
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
          wait(args3)
          plrcheck(args1)
          if v.Name == "TriLaserGun" then
v.Click:FireServer(game.Players[gplr].Character:GetPivot().Position)
          end
        end
      end


      if cmd == "fakemsg" then

        local splitvar = string.split(m, "~")
        local splithelp = splitvar[2]

        h("\n\n\n"..args1..": "..tostring(splithelp).."\n\n\n")

      end

      if cmd == "antikill" then

        if args1 == "on" then

          antikill = true

        elseif args1 == "off" then

          antikill = false

        end

      end

      if cmd == "rtx" then

        if args == "sunrise" or "1" then
          tct(rtx[1])
        end

      end

    end

  end)

end

for _, v in ipairs(game.Players:GetPlayers()) do

  a(v)

end

game.Players.PlayerAdded:Connect(function(v)

  a(v)

end)

for _, Bricks in pairs(game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()) do
        Bricks.CanTouch = false
end

local admingrab = coroutine.wrap(function()
    while true do

        if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
            if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin") then
                local pad = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
                local padCFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head").CFrame
                task.wait()
                pad.CanCollide = false
                repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                pad.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait()
                pad.CFrame = padCFrame
                pad.CanCollide = true
            else
                Regen()
            end
        end

    task.wait()

    end

end)
admingrab()

local antikillc = coroutine.wrap(function()

  while wait() do

    if antikill then

      if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then

        ct("re")

      end

    end

  end

end)
antikillc()

local blc = corountine.wrap(function()
  while wait() do
    for i, v in pairs(game.Players:GetPlayers()) do
      for bli, blv in pairs(blacklist) do
        if v.Name == blv then
          if v:FindFirstChild("Character") then
            ct("setgrav "..blv.." -9e9")
            wait(0.2)
            ct("punish "..blv)
            ct("blind "..blv)
          end
        end
      end  
    end
  end
end)
blc()

wait(1)
h("\n\n\n\nXKahV2(XKV2) has loaded\n\n THIS SCRIPT USES GSCRIPT, TURN IT OFF IF YOU USE IT ALREADY\n\nPrefix is ; or no prefix")

loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lnfiniteCoder/My-roblox-scripts/main/General_Scripts_D_E_L_T_A.txt"))()

ct("antikill on")
