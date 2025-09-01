local _populateCategoryList = ISWidgetRecipeCategories.populateCategoryList

function ISWidgetRecipeCategories:populateCategoryList()
    _populateCategoryList(self)
    for _, item in ipairs(self.recipeCategoryPanel.items) do
        if item.text == "-- ALL --" then
            item.text = getTextOrNull("UI_CraftCat_All") or item.text
        else
            item.text = getTextOrNull("UI_CraftCat_" .. item.text) or item.text
        end
    end
end
