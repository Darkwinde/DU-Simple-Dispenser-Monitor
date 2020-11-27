-- Item definition in JSON format
-- > mass: kg
itemsJSON = 
[[
{
    "missile xs": {"mass":207.02},
    "missile s": {"mass":593.35},
    "missile m": {"mass":2967.50},
    "missile l": {"mass":16130.00},

    "missile kinetic ammo xs": {"mass":1.29},
    "missile kinetic ammo s": {"mass":2.87},
    "missile kinetic ammo m": {"mass":7.92},
    "missile kinetic ammo l": {"mass":31.26},


    "railgun xs": {"mass":232.02},
    "railgun s": {"mass":599.53},
    "railgun m": {"mass":3007.00},
    "railgun l": {"mass":16720.00},

    "railgun antimatter ammo xs": {"mass":2.01},
    "railgun antimatter ammo s": {"mass":4.92},
    "railgun antimatter ammo m": {"mass":16.54},
    "railgun antimatter ammo l": {"mass":80.35},


    "transfer unit": {"mass":10150}
}
]]



function getItemInformation(name, parameter)
    local item = json.decode(itemsJSON)
    
    if item[name:lower()] == nil or item[name:lower()] == "" then
        system.printDanger("Item " .. name .. " unknown. Please check Library.start() for allowed items.")
        return nil
    else
        if parameter ~= nil or parameter ~= "" then
            return item[name:lower()][parameter]
        else
            return item[name:lower()]
        end
    end
end



function getElementObject(name)
    if unit[name] == nil then
        system.printDanger("Element" .. name .. " unknown. Please check slot name on left side of the LUA editor.")
        return nil
    else
        return unit[name]
    end
end



function getHTMLBody(name, price, amount, batch, batchSize, special, specialText)
    local returnValue = {}
    
    -- Define default layout parameters
    local paddingTop = 5
    local paddingBottom = 5
    local fontSize = 10

    -- Specialize layout parameters
    if batch and special then
        --paddingTop = 5
        paddingBottom = 4
        fontSize = 7
    elseif batch then
        --paddingTop = 1
        --paddingBottom = 4
        fontSize = 9
    elseif special then
        --paddingTop = 10
        paddingBottom = 4
        fontSize = 8
    end

  
     
    
    
    if batch then
        price = [[<div style="padding-top:]] .. paddingTop .. [[vw; color:white">]] .. price .. [[<br>(]] .. batchSize .. [[ per batch)</div>]]
    else
        price = [[<div style="padding-bottom:]] .. paddingBottom .. [[vw; color:white">]] .. price .. [[</div>]]
    end
    
    if amount > 0 then
        if batch then
            amount = [[<div style="padding-top:]] .. paddingTop .. [[vw;">Stock:]] .. math.floor(amount/batchSize) .. [[</div>]]
        else
            amount = [[<div style="padding-top:]] .. paddingTop .. [[vw;">Stock:]] .. amount .. [[</div>]]
        end
    else
        amount = [[<div style="padding-top:]] .. paddingTop .. [[vw; color:red">OUT OF STOCK</div>]]
    end
    
    
    returnValue[#returnValue + 1] = [[<div style="font-size:]] .. fontSize .. [[vw; font-weight: bold; color:yellow">]]
    returnValue[#returnValue + 1] = [[<center>]]
    if special then
         returnValue[#returnValue + 1] = [[<div style="padding-bottom:]] .. paddingBottom .. [[vw; font-size:]] .. (fontSize+3) .. [[vw; color:red">]] .. specialText ..[[</div>]]
    end
    returnValue[#returnValue + 1] = [[<div>]] .. name .. [[</div>]]
    returnValue[#returnValue + 1] = [[<div>]] .. price .. [[</div>]]
    returnValue[#returnValue + 1] = amount
    returnValue[#returnValue + 1] = [[</center>]]
    returnValue[#returnValue + 1] = [[</div>]]
    
    return  returnValue

end



function format_number(n) -- credit http://richard.warburton.it
    local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(,-)$')
    return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse()) .. right .. 'H'
end



function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    if numDecimalPlaces ~= nil then
        return math.floor(num * mult + 0.5) / mult
    else
        return math.floor((num * mult + 0.5) / mult)
    end
end



-- credit Jericho's system.print() extension 
-- https://github.com/Jericho1060/du-storage-monitoring
system.printColor = function(message, color) system.print('<span style="color:' .. color .. '; font-weight: bold;">' .. message .. '</span>') end
system.printSuccess = function (message) system.printColor(message, "#28a745") end
system.printDanger = function (message) system.printColor(message, "red") end
system.printWarning = function (message) system.printColor(message, "#ffc107") end
system.printInfo = function (message) system.printColor(message, "#17a2b8") end