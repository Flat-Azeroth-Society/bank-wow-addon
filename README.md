# Flat Azeroth Society Guild Bank WoW Classic AddOn

A simple World of Warcraft Classic AddOn used for exporting inventory data for the Guild Bank.

## Getting Started

Place the "FASGuildBank Folder in your WoW classic AddOn directory. Once enabled, your character inventory will be saved under

```
WoW_Install_Dir/_classic_/WTF/Account/[ACCOUNT_ID]/[SERVER_NAME]/[CHARACTER_NAME]/SavedVariables/FASGuildBank.lua
```

### File Format

The final saved variable is saved as a Lua table.

```
InventoryLogData = {
	"{id: 6948, name: Hearthstone, count: 1}", -- [1]
	"{id: 159, name: Refreshing Spring Water, count: 2}", -- [2]
	"{id: 2070, name: Darnassian Bleu, count: 4}", -- [3]
	"{id: 4865, name: Ruined Pelt, count: 1}", -- [4]
	"{id: 3365, name: Frayed Bracers, count: 1}", -- [5]
	"{id: 3365, name: Frayed Bracers, count: 1}", -- [6]
	"{id: 7074, name: Chipped Claw, count: 2}", -- [7]
}
```