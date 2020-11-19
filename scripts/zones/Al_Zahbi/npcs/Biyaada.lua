-----------------------------------
-- Area: Al Zahbi
--  NPC: Biyaada
-- Type: Rughadjeen's Attendant
-- !pos -65.802 -6.999 69.273 48
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
   local serpentProgress = player:getCharVar("serpentProgress")
   local serpentDay = player:getCharVar("serpentDay")
   local sagaOfTheSkySerpent = player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.SAGA_OF_THE_SKY_SERPENT)

    if (sagaOfTheSkySerpent == QUEST_ACCEPTED and serpentProgress == 3) then
        player:startEvent(279,0,0,0,0,0,0,0,0)
    else
        player:startEvent(250)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 279 then
        player:setCharVar("serpentDay", vanaDay())
        player:setCharVar("serpentProgress", 4)

end

end
