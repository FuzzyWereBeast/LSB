-----------------------------------
-- ID: 5941
-- Item: Bar of Campfire Chocolate
-- Food Effect: 30Min, All Races
-----------------------------------
-- Mind +1
-- MP recovered while healing +2
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.FOOD) then
        result = xi.msg.basic.IS_FULL
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5941)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MND, 1)
    target:addMod(xi.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MND, 1)
    target:delMod(xi.mod.MPHEAL, 2)
end

return itemObject
