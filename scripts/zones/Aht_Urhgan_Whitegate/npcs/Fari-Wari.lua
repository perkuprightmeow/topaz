-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Fari-Wari
-- Type: Standard NPC
-- !pos 80.5182 -6.0000 -137.7298 50
--  Quest: Saga of the Skyserpent
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
   local sagaOfTheSkySerpent = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.SAGA_OF_THE_SKY_SERPENT)
   local serpentProgress = player:getCharVar("serpentProgress")
   local serpentReady = vanaDay() > player:getCharVar("serpentDay")
    if sagaOfTheSkySerpent == QUEST_AVAILABLE then
        player:startEvent(823,0,0,0,0,0,0,0,0,0)
    elseif serpentProgress == 1 then --flavor text if quest accepted before getting ribbon
        player:startEvent(832)
    elseif (serpentProgress == 2 and player:hasKeyItem(tpz.ki.LILAC_RIBBON)) then --return the ribbon
        player:startEvent(953,0,0,0,0,0,0,0,0,0)
    elseif serpentProgress == 3 then --flavor text while waiting on Biyaada & game day wait
        player:startEvent(833)
    elseif (serpentReady and serpentProgress == 4) then --finish quest
        player:startEvent(825,0,0,0,0,0,0,0,0,0)
    elseif serpentProgress == 4 then --flavor text while waiting on Biyaada & game day wait
        player:startEvent(833)
    else
        player:startEvent(831)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 823 then
        player:addQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.SAGA_OF_THE_SKY_SERPENT)
        player:setCharVar("serpentProgress", 1)
    elseif csid == 953 then
        player:setPos(0, 0, 0, 0, 51)
    elseif csid == 825 then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(2187)
            player:setCharVar("serpentProgress", 0)
            player:completeQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.SAGA_OF_THE_SKY_SERPENT)
            player:addCurrency("imperial_standing", 1000)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 2187)
            player:messageSpecial(ID.text.IMPERIAL_STANDING_INCREASED)
        end
    end
end