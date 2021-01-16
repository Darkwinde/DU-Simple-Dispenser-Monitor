## About
Dual Universe script to show dispenser item, price, batch and stock information on one screen. <br/>
Useful for any shop to update stock information on enter shop area (detection zone) or after dispenser give away.
<br/><br/>

## Credits
* Item list powered by Jericho1060 (https://github.com/Jericho1060/du-storage-monitoring)
* Format number function to make price values look nice (http://richard.warburton.it)
<br/><br/>

## Features
* Show item name plus price plus stock amount on one display
* Show batch information if item is sold as one
* Show special information headline, like "Black Friday", for your offer
<p align="center">
  <img src="/media/Normal.png">
</p>
<p align="center">
  <img src="/media/Batch.png">
</p>
<p align="center">
  <img src="/media/Special.png">
</p>
<br/><br/>

## Prerequisite
**Mandatory**
1. 1 Programming Board to connect up to 5 screens and 5 containers
1. 1 Screen per item to be provided by dispenser
1. 1 Container per item to be provided by dispenser
<br/><br/>

**Optional**
1. Detection Zone XS to L connected to a Relay element for automatic activation of programming boards
1. Additional screen, if you like to have a simple monitoring screen, you can only present 4 items (4 screens + 4 containers = 8 slots) per programming board.<br/>
To use monitoring screen, just connect it to the programming board and name the slot to "screenMonitor"
<br/><br/>

## Installation
**File by File** 
<br/>
Copy and past each LUA file content to the according section of the programming board (PB).
<br/><br/>

*"CTRL + L" on PB to open ingame editor*
<br/><br/>
Example for the file "library.start.lua":<br/>

1. Open the file and copy content to the clipboard
1. According to the filename "**library**.start.lua" select the category "library".
1. According to the filename "library.**start**.lua" we need an event filter of type "start" without parameter; so we are looking for "start()" as event filter name.
    1. To create a new filter press "+ ADD FILTER"
    1. To select event filter type, click on three dots on the left side of the draft event and select "start".
    1. The draft event changes to "start()" 
1. Click into the right field and past content from clipboard by pressing "CTRL+V".
1. Do the same process with every further "*.lua" file. Important to note, that you can define multiple filter targeting same event, e.g. the "start()". They will be processed all one by one; so do not worry about :)
1. Then you finished, do not forget set press "APPLY" to confirm changes.
<br/><br/>

**Item Configuration** 
<br/>
Setting up the screens you want to provide by dispensers is quite simple. 
Nevertheless, it is recommended to connect 1 screen and 1 container after another. Rename the slots in the LUA editor, so that it can be easily identified.
<br/>

1. Rename the element slots (left side LUA editor) to something useful...
    1. example: Railgun XS, I personally use "screenRG_XS" and "containerRG_XS" 
    1. example: Transfer Unit, I personally use "screenTransferUnit" and "containerTransferUnit".
1. Define up to 5 items you want to sell in the "items" array by the given schema
1. Then you finished, do not forget set press "APPLY" to confirm changes.
1. Activate the programming board and check if information correctly displayed. IF NOT, check LUA console for issue hints.
<p align="center">
  <img src="/media/Item.png">
</p>
<br/><br/>

**Item Schema** 
```lua
items = 
{
    ["Transfer Unit"] = 
    {
        ["price"] = 120000,
        ["batch"] = false,
        ["batchSize"] = 1,
        ["special"] = true,
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
        ["specialText"] = "",
        ["screenSlotName"] = "screenRGAA_XS",
        ["containerSlotName"] = "containerRGAA_XS",
    }
}
```
<br/><br/>

## Remarks
* If you see any failurs, bugs or have any kind of recommandation, feel free to contribute. :)
<br/><br/>
