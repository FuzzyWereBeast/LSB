-----------------------------------
-- ID: 4104
-- Fire Cluster
-- Turn into a stack of fire crystals
-----------------------------------
require("scripts/globals/msg")
require("scripts/globals/items")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = xi.msg.basic.ITEM_NO_USE_INVENTORY
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addItem(xi.items.FIRE_CRYSTAL, 12)
end

return itemObject
