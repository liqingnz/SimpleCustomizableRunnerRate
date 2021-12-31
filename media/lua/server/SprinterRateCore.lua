--**************************
-- Sprinter Rate
--**************************
--* Coded by: LichKingNZ
--* Date Created: 30/12/2021
--**************************

local option = SprinterRate.Options

local BASE_RATIO = 1000

local function adjustSpawnRate()
    if option.overwriteSystemRate then
        if ZombRand(BASE_RATIO) <= option.sprinterRate then
            getSandboxOptions():set("ZombieLore.Speed", 1)
        else
            getSandboxOptions():set("ZombieLore.Speed", 2)
        end
    end
end


Events.OnZombieUpdate.Add(adjustSpawnRate)