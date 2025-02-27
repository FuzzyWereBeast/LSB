-----------------------------------
-- ID: 5155
-- Item: cone_of_sub-zero_gelato
-- Food Effect: 1Hr, All Races
-----------------------------------
-- HP 10
-- MP % 16 (cap 80)
-- MP Recovered While Healing 2
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 5155)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 10)
    target:addMod(xi.mod.FOOD_MPP, 16)
    target:addMod(xi.mod.FOOD_MP_CAP, 80)
    target:addMod(xi.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 10)
    target:delMod(xi.mod.FOOD_MPP, 16)
    target:delMod(xi.mod.FOOD_MP_CAP, 80)
    target:delMod(xi.mod.MPHEAL, 2)
end

return itemObject
