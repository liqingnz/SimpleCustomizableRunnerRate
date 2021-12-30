ZombieRate = ZombieRate or {}
ZombieRate.Options = ZombieRate.Options or {}

ZombieRate.Options.overwriteSystemRate = true
ZombieRate.Options.sprinterRate = 200

if ModOptions and ModOptions.getInstance then
    local sprinterRates = { 0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000 }

    local function onModOptionsApply(optionValues)
        if isAdmin() or not isClient() then
        -- if isClient() then
            ZombieRate.Options.overwriteSystemRate = optionValues.settings.options.overwriteSystemRate
            ZombieRate.Options.sprinterRate = sprinterRates[optionValues.settings.options.sprinterRate]
            print("-----------Current sprinter spawn rate " .. ZombieRate.Options.sprinterRate)
        else
            print("-----------Cannot edit spawn rate, current rate: " .. ZombieRate.Options.sprinterRate)
        end
    end

    local SETTINGS = {
        options_data = {
            overwriteSystemRate = {
                name = "UI_ZombieRate_OverwriteSystemRate",
                tooltip = "UI_ZombieRate_OverwriteSystemRate_Tooltip",
                default = true,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            },
            sprinterRate = {
                "0", "100", "200", "300", "400", "500", "600", "700", "800", "900", "1000",
                name = "UI_ZombieRate_SprinterRate",
                tooltip = "UI_ZombieRate_SprinterRate_Tooltip",
                default = 3,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            },
        },

        mod_id = 'ZombieRate',
        mod_shortname = 'Zombie Rate',
        mod_fullname = 'Zombie Rate',
    }

    local optionsInstance = ModOptions:getInstance(SETTINGS)
    ModOptions:loadFile()

end