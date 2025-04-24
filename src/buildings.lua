---@type Mod
local myMod = ...

---@type BUILDING
local FOUNTAIN = {
	DataType = "BUILDING",
	Id = "FOUNTAIN",
	Name = "MY_MOD_FOUNTAIN",
	Description = "MY_MOD_FOUNTAIN_DESC",
	BuildingType = "DECORATION",
	AssetCoreBuildingPart = "FOUNTAIN_PART",
}

myMod:registerAsset(FOUNTAIN)

---@type BUILDING_PART
local FOUNTAIN_PART = {
	DataType = "BUILDING_PART",
	Id = "FOUNTAIN_PART",
	Description = "",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FOUNTAIN"
	},
	BuildingZone = {
		ZoneEntryList = {
			{
				Polygon = polygon.createCircle(2.5),
				Type = {
					DEFAULT = true
				}
			}
		}
	},
	ConstructionVisual = "PREFAB_FOUNTAIN_CONSTRUCTION",
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD_COINS", Quantity = 5 }
		},
		ResourceNeededList = {
			{
				{ Resource = "WOOD", Quantity = 5 },
				{ Resource = "STONE", Quantity = 10 },
			},
		}
	}
}

myMod:registerAsset(FOUNTAIN_PART)