
local myMod = ...

myMod:registerAsset({
	DataType = "TRADING_VILLAGE",
	Id = "VILLAGE_AVIGNON",
	VillageName = "Avignon",
	Heraldry = "HERALDRY_MYDDLE",
	UnlockCost = { 
		{ Resource = "WOOD", Quantity = 5 },
		{ Resource = "STONE", Quantity = 10 },
	},
	ResourceNeededToUpgrade = "HERBS",
	BuyingResourceList = {
		{
			ResourceMaxAmount = { Resource = "ASTEROID_ROCK", Quantity = 5 },
		}
	},
	SellingResourceList = {
		{
			ResourceMaxAmount = { Resource = "ASTEROID_ROCK", Quantity = 5 },
		}
	},
	TradeRouteUpgradeNarrativePanelTemplate = "NARRATIVE_PANEL_TEMPLATE_TRADE_ROUTE_UPGRADE",
	UpgradeEventEnvoyProfile = "PROFILE_ENVOY_ROYAL",
	WorldGuiIcon = "ICON_TRADE",
	Allegiance = "KINGDOM",
})

myMod:overrideAsset({
	Id = "BUILDING_PART_WOODCUTTER_CAMP",
	Cost = {
		BuildRightTaxes = {
			{ Resource = "GOLD", Quantity = 5 },
		},
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = 5 },
		},
		ResourceNeededList = {
			{
				{ Resource = "TOOL", Quantity = 10 },
			},
		}
	},
})

myMod:overrideAsset({
	Id = "BUILDING_PART_WELL",
	Cost = {
		BuildRightTaxes = {
			{ Resource = "GOLD", Quantity = 15 }
		},
		UpkeepCost = {},
		ResourceNeededList = {
			{
				{ Resource = "WOOD", Quantity = 2 },
				{ Resource = "STONE", Quantity = 5 },
			},
			{
				{ Resource = "WOOD", Quantity = 3 },
				{ Resource = "STONE", Quantity = 5 },
			},
		}
	},
})

-- Override default village list
myMod:overrideAsset({
	Id = "VILLAGE_LIST_DEFAULT",
	TradingVillageList = {
		Action = "APPEND", -- Append the following value(s) to the existing list
		"VILLAGE_AVIGNON"
	}
})

-- Override default balancing
myMod:overrideAsset({
	Id = "DEFAULT_BALANCING",
	Name = "MY_MOD_SUPER_BALANCING",
	TerritoryPrice = {
        Action = "APPEND", -- Append the following value(s) to the existing list
        { Resource = "WOOD", Quantity = 50 }, -- Append the price of 50 wood to purchase a tile, in addition to the default 500 gold
    },
	StartingTileResourceRequirement = {
        Action = "OVERRIDE", -- Override the whole list with the following value(s), optional (since the list will be overriden by default)
        { Resource = "WOOD", Quantity = 20 }, -- Replace the starting tile resource requirement to allow any tile containing only 20 trees to be the first tile
    },
	TerritoryRoyalTaxesList = {
		{
			{ Resource = "GOLD", Quantity = 0 }
		},
		{
			{ Resource = "GOLD", Quantity = 10 }
		},
		{
			{ Resource = "GOLD", Quantity = 25 }
		},
		{
			{ Resource = "GOLD", Quantity = 50 }
		}
	},
	EventList = { 
		Action = "APPEND", -- Append the following value(s) to the existing list
		"SUPER_EVENT"
	},
})

myMod:overrideAsset({
	Id = "NAME_LIST_ENGLISH",
	MaleNameList = {
		Action = "APPEND",
		"Merek", "Carac", "Ulric", "Tybalt", "Borin", "Sadon", "Terrowin", "Rowan", "Forthwind", "Althalos", "Fendrel", "Brom", "Hadrian", "Walter", "John", "Oliver", "Justice", 
		"Roger", "Joseph", "Geoffrey", "William", "Francis", "Simon", "Edmund", "Edgard", "Charles", "Benedict", "Gregory", "Peter", "Henry", "Frederick", "Thomas", "Arthur", "Bryce", "Donald", 
		"Leofrick", "Letholdus", "Lief", "Barda", "Rulf", "Robin", "Gavin", "Terrin", "Terryn", "Ronald", "Jarin", "Cassius", "Leo", "Cedric", "Peyton", "Josef", "Janshai", "Doran", "Asher", "Quinn", 
		"Zane", "Xalvador", "Favian", "Destrian", "Dain", "Berinon", "Tristan", "Gorvenal"
	},
})