local myMod = foundation.createMod()

--myMod:log("Hello World!")
--myMod:logWarning("This is a warning!")
--myMod:logError("This is an error!")
--myMod:msgBox("Hello there!")

myMod:registerAssetId("models/fountain.fbx/Prefab/Fountain", "PREFAB_FOUNTAIN")
myMod:registerAssetId("models/fountain.fbx/Prefab/Fountain_Construction_Steps", "PREFAB_FOUNTAIN_CONSTRUCTION")

myMod:registerAssetId("icons/asteroid rock.png", "ICON_ASTEROID_ROCK", "ATLAS_CELL")

myMod:registerEnumValue("RESOURCE_TYPE", "SPACE_LUXURY")

myMod:dofile("src/buildings.lua")
myMod:dofile("src/events.lua")
myMod:dofile("src/balancing.lua")

myMod:dofile("src/guard_behavior_tree/node_setup_guard_locator_post.lua")
myMod:dofile("src/guard_behavior_tree/node_finish_guard_locator_post.lua")
myMod:dofile("src/guard_behavior_tree/behavior_soldier_guard_locator.lua")
myMod:dofile("src/guard_behavior_tree/wooden_keep_locator_part.lua")

--
---@type RESOURCE
local ASTEROID_ROCK_RESOURCE = {
	DataType = "RESOURCE",
	Id = "ASTEROID_ROCK",
	ResourceName = "ASTEROID_ROCK",
	Icon = "ICON_ASTEROID_ROCK",
	ResourceTypeList = { "LUXURY", "SPACE_LUXURY" },
	TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 7 } },
	TradeSellingPrice = { { Resource = "WOOD", Quantity = 5 } },
	DisplayInToolbar = true,
	ResourceVisualPrefabList = { "PREFAB_RESOURCE_VISUAL_CRATE" },
	IndividualResourceVisualPrefabList = { "PREFAB_RESOURCE_VISUAL_CRATE" }
}
myMod:registerAsset(ASTEROID_ROCK_RESOURCE)
