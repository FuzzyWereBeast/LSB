-----------------------------------
-- Area: Norg
--  NPC: Achika
-- Type: Tenshodo Merchant
-- !pos 1.300 0.000 19.259 252
-----------------------------------
require("scripts/globals/shop")
local ID = require("scripts/zones/Norg/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.TENSHODO_MEMBERS_CARD) then
        if player:sendGuild(60421, 9, 23, 7) then
            player:showText(npc, ID.text.ACHIKA_SHOP_DIALOG)
        end
    else
        -- player:startEvent(150)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
