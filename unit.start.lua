-- WHAT DO YOU LIKE TO SELL?
-- Up to 5 items possible (5 screens and 5 containers connected)
-- Alternative: 4 items (4 screens and 4 containers connected) plus one monitoring screen
--> If you like to use a monitoring screen, please use the slot name "screenMonitor",
--  then it will be used automatically to display item stock and price information for 4 connected items


-- ITEM DEFINITION FOR SALE
-- Please always follow the array structure in the example
--> !!! The slot names (left side) do not allow spaces within the names. Use "_" underscore instead

-- EXAMPLE
--[[
items = 
{
    ["Transfer Unit"] = 
    {
        ["price"] = 120000,
        ["batch"] = false,
        ["batchSize"] = 1,
        ["special"] = false,
        ["specialText"] = "Black Friday",
        ["screenSlotName"] = "screenTransferUnit",
        ["containerSlotName"] = "containerTransferUnit",
    },
    ["Railgun Antimatter Ammo XS"] = 
    {
        ["price"] = 500,
        ["batch"] = true,
        ["batchSize"] = 10,
        ["special"] = false,
        ["specialText"] = "Black Friday",
        ["screenSlotName"] = "screenRGAA_XS",
        ["containerSlotName"] = "containerRGAA_XS",
    }
}
--]]



items =
{
    ["Container XS"] =
    {
        ["price"] = 20000,
        ["batch"] = true,
        ["batchSize"] = 10,
        ["special"] = false,
        ["specialText"] = "Black Friday",
        ["screenSlotName"] = "s_containerXS",
        ["containerSlotName"] = "c_containerXS",
    },
    ["Container S"] =
    {
        ["price"] = 55000,
        ["batch"] = true,
        ["batchSize"] = 5,
        ["special"] = false,
        ["specialText"] = "Black Friday",
        ["screenSlotName"] = "s_containerS",
        ["containerSlotName"] = "c_containerS",
    },
    ["Container M"] =
    {
        ["price"] = 60000,
        ["batch"] = false,
        ["batchSize"] = 1,
        ["special"] = false,
        ["specialText"] = "Black Friday",
        ["screenSlotName"] = "s_containerM",
        ["containerSlotName"] = "c_containerM",
    },
    ["Container L"] =
    {
        ["price"] = 125000,
        ["batch"] = false,
        ["batchSize"] = 1,
        ["special"] = false,
        ["specialText"] = "Black Friday",
        ["screenSlotName"] = "s_containerL",
        ["containerSlotName"] = "c_containerL",
    }
}



-- Update screens every 2 seconds
unit.setTimer("update", 2)
unit.hide()