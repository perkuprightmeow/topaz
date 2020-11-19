-----------------------------------
-- Area: Halvung
--  NPC: ??? (Saga of the sky Serpent)
-- !pos -11.61 7.9355 -185.4690
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local sagaOfTheSkySerpent = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.SAGA_OF_THE_SKY_SERPENT)
    local serpentProgress = player:getCharVar("serpentProgress")

    if sagaOfTheSkySerpent == QUEST_ACCEPTED and serpentProgress == 1 then
        player:addKeyItem(tpz.ki.LILAC_RIBBON)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.LILAC_RIBBON)
        player:setCharVar("serpentProgress", 2)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
