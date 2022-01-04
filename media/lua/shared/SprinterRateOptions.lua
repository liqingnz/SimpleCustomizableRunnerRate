--**************************
-- Sprinter Rate
--**************************
--* Coded by: LichKingNZ
--* Date Created: 30/12/2021
--**************************

SprinterRate = SprinterRate or {}
SprinterRate.Options = SprinterRate.Options or {}

SprinterRate.Options.overwriteSystemRate = true
SprinterRate.Options.sprinterRate = 300

if ModOptions and ModOptions.getInstance then
    local sprinterRates = { 0, 100, 200, 233, 300, 400, 500, 600, 700, 800, 900, 1000 }

    local function onModOptionsApply(optionValues)
        if true then
        -- if isAdmin() or not isClient() then
            SprinterRate.Options.overwriteSystemRate = optionValues.settings.options.overwriteSystemRate
            SprinterRate.Options.sprinterRate = sprinterRates[optionValues.settings.options.sprinterRate]
            getPlayer():Say("Current sprinter spawn rate " .. SprinterRate.Options.sprinterRate)
        else
            getPlayer():Say("Cannot edit spawn rate, current rate: " .. SprinterRate.Options.sprinterRate)
        end
    end

    -- TODO: add listener for 'overwriteSystemRate'

    local SETTINGS = {
        options_data = {
            overwriteSystemRate = {
                name = "UI_SprinterRate_OverwriteSystemRate",
                tooltip = "UI_SprinterRate_OverwriteSystemRate_Tooltip",
                default = true,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            },
            sprinterRate = {
                "0%", "10%", "20%", "23.3%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "99%",
                name = "UI_SprinterRate_SprinterRate",
                tooltip = "UI_SprinterRate_SprinterRate_Tooltip",
                default = 4,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            },
        },

        mod_id = 'SprinterRate',
        mod_shortname = 'Sprinter Rate',
        mod_fullname = 'Sprinter Rate',
    }

    local optionsInstance = ModOptions:getInstance(SETTINGS)
    ModOptions:loadFile()

end