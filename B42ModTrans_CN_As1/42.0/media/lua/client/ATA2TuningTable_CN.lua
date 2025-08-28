require "ATA2TuningTable"

local original_ATA2Tuning_AddNewCars = ATA2Tuning_AddNewCars

local function localizeField(value, prefix)
    if not value then return value end
    return getTextOrNull(value:find("^IGUI_") and value or prefix .. value:gsub("%s", "")) or value
end

function ATA2Tuning_AddNewCars(carsTable)
    original_ATA2Tuning_AddNewCars(carsTable)
    for _, vc in pairs(carsTable) do
        if vc.parts then
            for _, pc in pairs(vc.parts) do
                for _, mc in pairs(pc) do
                    mc.name = localizeField(mc.name, "IGUI_VehiclePart_")
                    mc.category = localizeField(mc.category, "IGUI_VehicleCategory_")
                end
            end
        end
    end
end

Events.OnGameBoot.Add(function()
    if ATA2TuningTable then
        for _, vc in pairs(ATA2TuningTable) do
            if vc.parts then
                for _, pc in pairs(vc.parts) do
                    for _, mc in pairs(pc) do
                        mc.name = localizeField(mc.name, "IGUI_VehiclePart_")
                        mc.category = localizeField(mc.category, "IGUI_VehicleCategory_")
                    end
                end
            end
        end
    end
end)
