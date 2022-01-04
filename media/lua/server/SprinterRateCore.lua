--**************************
-- Sprinter Rate
--**************************
--* Coded by: LichKingNZ
--* Date Created: 30/12/2021
--**************************

local option = SprinterRate.Options

local BASE_RATIO = 1000
local isServer = false

local safeZoneMinX = 5600
local safeZoneMaxX = 6900

local safeZoneMinY = 5200
local safeZoneMaxY = 5600


local function adjustSpawnRate(zed)
    -- if not isServer then
    --     return
    -- end

    local modData = zed:getModData()
    local speedTypeField = getClassField(zed, 44) -- 44:speedType

    if ((zed:getX() < safeZoneMinX or zed:getX() > safeZoneMaxX) or
            (zed:getY() < safeZoneMinY or zed:getY() > safeZoneMaxY)) 
    then -- outside safezone
        if modData.isSet ~= "setComeplete" then
            if ZombRand(BASE_RATIO) <= option.sprinterRate then
                print("sprinter")
                getSandboxOptions():set("ZombieLore.Speed", 1)
                modData.zedType = 1
            else
                print("normal zed")
                getSandboxOptions():set("ZombieLore.Speed", 2)
                modData.zedType = 2
            end
            zed:makeInactive(true)
            zed:makeInactive(false)
            modData.isSet = "setComeplete"
        end
    
    
        if getClassFieldVal(zed, speedTypeField) ~= modData.zedType then
            print("re-adjust - " .. getClassFieldVal(zed, speedTypeField) .. " : ".. modData.zedType)
            getSandboxOptions():set("ZombieLore.Speed", modData.zedType)
            zed:makeInactive(true)
            zed:makeInactive(false)
        end

    else -- inside safezone
        -- print("safezone zed")
        if getClassFieldVal(zed, speedTypeField) ~= 2 then
            getSandboxOptions():set("ZombieLore.Speed", 2)
            zed:makeInactive(true)
            zed:makeInactive(false)
        end
    end


    -- TODO: implement overwrite system
    -- if option.overwriteSystemRate then
    -- end
end

-- local function init()
--     if isServer() then
--         print("\n>>>>>>>>>>>>>>>IS_SERVER>>>>>>>>>>>>>>>\n")
--         isServer = true
--     elseif isClient() then
--         print("\n>>>>>>>>>>>>>>>IS_CLIENT>>>>>>>>>>>>>>>\n")
--     end
-- end

-- Events.OnLoad.Add(init)
-- Events.OnServerStarted.Add(init)
Events.OnZombieUpdate.Add(adjustSpawnRate)