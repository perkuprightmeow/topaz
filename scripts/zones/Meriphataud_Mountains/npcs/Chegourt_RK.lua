-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Chegourt, R.K.
-- Type: Outpost Conquest Guards
-- !pos -295 16 418 119
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = tpz.nation.SANDORIA
local guardType   = tpz.conq.guard.OUTPOST
local guardRegion = tpz.region.ARAGONEU
local guardEvent  = 32763

function onTrade(player, npc, trade)
    tpz.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

function onTrigger(player, npc)
    tpz.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

function onEventUpdate(player, csid, option)
    tpz.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

function onEventFinish(player, csid, option)
    tpz.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end
