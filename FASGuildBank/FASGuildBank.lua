InventoryLogData = {} -- Initialize List -> This is defined as a Character Saved Variable in the .toc file

local frame = CreateFrame("FRAME"); -- Frame being one game frame
frame:RegisterEvent("BAG_UPDATE"); -- Subscribe to this event, will allow us to respond in the case that this event is fired from WoW Client

function frame:OnEvent(event, arg1)
    if event == "BAG_UPDATE" then -- Bag Update event fired within WoW Client
        updateInventoryLog() -- Update our saved var
    end
end

frame:SetScript("OnEvent", frame.OnEvent); -- Specify function to handle frame event data

function updateInventoryLog()
    InventoryLogData = table.wipe(InventoryLogData); -- When we grab a new snapshot, we want to clear the old table -> We are grabbing a new snapshot of entire inventory
    for bag = 0,4 do -- These represent all the bag positions, 0 = backpack. Loop through
        for slot = 1, GetContainerNumSlots(bag) do -- Loop through all slots in the current bag
            local itemID = GetContainerItemID(bag,slot) -- Get the item ID -> This lets us get more info about the item
            if itemID then
                local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemMaxStackCount = GetItemInfo(itemID) -- Get generic item info
                local itemTexture, itemCount, locked, itemQuality, itemReadable = GetContainerItemInfo(bag, slot) -- Get item info specific to item in bag

                tinsert(InventoryLogData,format("{id: %s, name: %s, count: %s}",itemID,itemName,itemCount)) -- Update our saved table variable with a new row
            end
        end
    end
end
