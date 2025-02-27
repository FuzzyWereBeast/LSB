-----------------------------------
-- Area: La Theine Plateau
--  NPC: Telepoint
-- !pos 420.000 19.104 20.000 102
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
require("scripts/globals/items")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- Trade any normal crystal for a faded crystal
    local item = trade:getItemId()
    if
        trade:getItemCount() == 1 and
        item >= xi.items.FIRE_CRYSTAL and
        item <= xi.items.DARK_CRYSTAL and
        npcUtil.giveItem(player, xi.items.FADED_CRYSTAL)
    then
        player:tradeComplete()
    end
end

entity.onTrigger = function(player, npc)
    if not player:hasKeyItem(xi.ki.HOLLA_GATE_CRYSTAL) then
        player:startEvent(116)
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 116 then
        npcUtil.giveKeyItem(player, xi.ki.HOLLA_GATE_CRYSTAL)
    end
end

return entity
