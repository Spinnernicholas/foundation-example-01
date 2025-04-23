
local myMod = ...

myMod:registerAsset({
	DataType = "BUILDING",
	Id = "FOUNTAIN",
	Name = "MY_MOD_FOUNTAIN",
	Description = "MY_MOD_FOUNTAIN_DESC",
	BuildingType = "DECORATION",
	AssetCoreBuildingPart = "FOUNTAIN_PART",
})

myMod:registerAsset({
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
			{ Resource = "GOLD", Quantity = 5 }
		},
		ResourceNeededList = {
			{
				{ Resource = "WOOD", Quantity = 5 },
				{ Resource = "STONE", Quantity = 10 },
			},
		}
	}
})