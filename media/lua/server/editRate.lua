local option = ZombieRate.Options

local BASE_RATIO = 1000

local function spawnZed()
    if ZombRand(BASE_RATIO) <= option.sprinterRate then
        getSandboxOptions():set("ZombieLore.Speed", 1)
    else
        getSandboxOptions():set("ZombieLore.Speed", 2)
    end
end


Events.OnZombieUpdate.Add(spawnZed)