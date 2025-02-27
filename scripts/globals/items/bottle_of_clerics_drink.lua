-----------------------------------
-- ID: 5395
-- Item: bottle_of_clerics_drink
-- Item Effect: Instantly removes all negative status effects from nearby party members
--              Does not remove Plague or Curse
-----------------------------------
require("scripts/globals/msg")
require("scripts/globals/item_utils")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)
    local effects = xi.item_utils.removableEffects
    local count = 33

    target:forMembersInRange(10, function(member)
        xi.item_utils.removeMultipleEffects(member, effects, count)
    end)
end

return itemObject
