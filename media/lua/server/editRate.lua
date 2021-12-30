local rrate = 0
path = "./rate.txt"

local function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

function lines_from(file)
    if not file_exists(file) then return {} end
    lines = {}
    for line in io.lines(file) do 
      lines[#lines + 1] = line
    end
    return lines
end


local function adjustRate(key) 
    if key == 8 then
        rrate = 20
        print(rrate)
    elseif key == 7 then
        rrate = 0
        print(rrate)
    elseif key == 9 then
        rrate = 50
        print(rrate)
    elseif key == 10 then
        rrate = 100
        print(rrate)
    end
end


local function spawnZed()
    local rate = ZombRand(100)
    if rate<=rrate then
        getSandboxOptions():set("ZombieLore.Speed", 1)
    else
        getSandboxOptions():set("ZombieLore.Speed", 2)
    end
end

Events.OnKeyPressed.Add(adjustRate)
Events.OnZombieUpdate.Add(spawnZed)
print("added Liqing's mod----------------------")