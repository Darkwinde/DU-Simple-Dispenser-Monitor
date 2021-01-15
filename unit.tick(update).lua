-- Iterate through each item to be displayed
-- Order does not matter as we have the reference to the screen and container attached in the array itself
for itemName, itemParameters in pairs(items) do
    -- Check if required array fields are defined in the way expected
    if 
        itemParameters == nil or itemParameters["price"] == nil or
        itemParameters["batch"] == nil or itemParameters["batchSize"] == nil or
        itemParameters["special"] == nil or itemParameters["specialText"] == nil or
        itemParameters["screenSlotName"] == nil or itemParameters["containerSlotName"] == nil 
        then 
        system.print("Item parameter definition not correct. Please check: " .. itemName)
    else
        -- Get screen and container element object
        screen = getElementObject(itemParameters["screenSlotName"])
        container = getElementObject(itemParameters["containerSlotName"])

        -- Get item volume
        itemVolume = getItemInformation(itemName, "volume")

        if screen ~= nil and container ~= nil and itemVolume ~= nil then
            -- Get amount from container by mass reference
            amount = round(container.getItemsVolume() / itemVolume)

            screen.clear()
            screen.setHTML(table.concat(getHTMLBody(itemName, format_number(itemParameters["price"]), amount, itemParameters["batch"], itemParameters["batchSize"], itemParameters["special"], itemParameters["specialText"]), ""))
            screen.activate()
        end
    end
end


-- A screen to monitor the stacks and prices
if screenMonitor ~= nil then
    local monitorHTML = {}

    for itemName, itemParameters in pairs(items) do
        container = getElementObject(itemParameters["containerSlotName"])
        itemMass = getItemInformation(itemName, "mass")

        if screen ~= nil and container ~= nil and itemMass ~= nil then          
            amount = round(container.getItemsMass() / itemMass)

            if itemParameters["batch"] then
                monitorHTML[#monitorHTML+1] = [[<div style="font-size:3.5vw; color:yellow; padding-top: 1vw; padding-bottom: 2.5vw;"><center>]]
                monitorHTML[#monitorHTML + 1] = [[<div style="color:white">]] .. itemName .. '</div><div>' .. math.floor(amount/itemParameters["batchSize"]) .. [[x (]] .. format_number(itemParameters["price"]) .. [[)</div><div>Batch size: ]] .. itemParameters["batchSize"] .. [[ // Amount: ]] .. amount .. [[</div>]]
                monitorHTML[#monitorHTML + 1] = [[</center></div>]]
            else
			monitorHTML[#monitorHTML+1] = [[<div style="font-size:4vw; color:yellow; padding-top: 2vw; padding-bottom: 3vw;"><center>]]
                monitorHTML[#monitorHTML + 1] = [[<div style="color:white">]] .. itemName .. '</div><div>' .. amount .. [[x (]] .. format_number(itemParameters["price"]) .. [[)</div>]]
                monitorHTML[#monitorHTML + 1] = [[</center></div>]]
            end
        end
    end

    screenMonitor.clear()
    screenMonitor.setHTML(table.concat(monitorHTML, ""))  
    screen.activate()
end