---@type Mod
local myMod = ...

---@type TRADING_VILLAGE
local VILLAGE_AVIGNON = {
	DataType = "TRADING_VILLAGE",
	Id = "VILLAGE_AVIGNON",
	VillageName = "Avignon",
	Heraldry = "HERALDRY_MYDDLE",
	UnlockableCost = {
		ResourceCollection = {
			{ Resource = "WOOD", Quantity = 5 },
			{ Resource = "STONE", Quantity = 10 },
		},
	},
	ResourceNeededToUpgrade = "HERBS",
	BuyingResourceList = { "ASTEROID_ROCK" },
	SellingResourceList = { "ASTEROID_ROCK" },
	TradeRouteUpgradeNarrativePanelTemplate = "NARRATIVE_PANEL_TEMPLATE_TRADE_ROUTE_UPGRADE",
	UpgradeEventEnvoyProfile = "PROFILE_ENVOY_ROYAL",
	WorldGuiIcon = "ICON_TRADE",
	Allegiance = "KINGDOM",
}

myMod:registerAsset(VILLAGE_AVIGNON)

---@type BUILDING_PART
local BUILDING_PART_LUMBER_CAMP = {
	DataType = 'BUILDING_PART',
	Id = "BUILDING_PART_LUMBER_CAMP",
	Cost = {
		BuildRightTaxes = {
			{ Resource = "GOLD_COINS", Quantity = 5 },
		},
		UpkeepCost = {
			{ Resource = "GOLD_COINS", Quantity = 5 },
		},
		ResourceNeededList = {
			{
				{ Resource = "TOOL", Quantity = 10 },
			},
		}
	},
}

myMod:overrideAsset(BUILDING_PART_LUMBER_CAMP)

---@type BUILDING_PART
local BUILDING_PART_WELL = {
	DataType = 'BUILDING_PART',
	Id = "BUILDING_PART_WELL",
	Cost = {
		BuildRightTaxes = {
			{ Resource = "GOLD_COINS", Quantity = 15 }
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
}

myMod:overrideAsset(BUILDING_PART_WELL)

-- Override default village list
---@type TRADING_VILLAGE_LIST
local VILLAGE_LIST_DEFAULT = {
	DataType = 'TRADING_VILLAGE_LIST',
	Id = "VILLAGE_LIST_DEFAULT",
	TradingVillageList = {
		Action = "APPEND", -- Append the following value(s) to the existing list
		"VILLAGE_AVIGNON"
	}
}

myMod:overrideAsset(VILLAGE_LIST_DEFAULT)

-- Override default balancing
---@type BALANCING
local DEFAULT_BALANCING = {
	DataType ='BALANCING',
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
}
myMod:overrideAsset(DEFAULT_BALANCING)

---@type NAME_LIST
local NAME_LIST_ENGLISH = {
	DataType = 'NAME_LIST',
	Id = "NAME_LIST_ENGLISH",
	MaleNameList = {
		Action = "APPEND",
		"Merek", "Carac", "Ulric", "Tybalt", "Borin", "Sadon", "Terrowin", "Rowan", "Forthwind", "Althalos", "Fendrel", "Brom", "Hadrian", "Walter", "John", "Oliver", "Justice", 
		"Roger", "Joseph", "Geoffrey", "William", "Francis", "Simon", "Edmund", "Edgard", "Charles", "Benedict", "Gregory", "Peter", "Henry", "Frederick", "Thomas", "Arthur", "Bryce", "Donald", 
		"Leofrick", "Letholdus", "Lief", "Barda", "Rulf", "Robin", "Gavin", "Terrin", "Terryn", "Ronald", "Jarin", "Cassius", "Leo", "Cedric", "Peyton", "Josef", "Janshai", "Doran", "Asher", "Quinn", 
		"Zane", "Xalvador", "Favian", "Destrian", "Dain", "Berinon", "Tristan", "Gorvenal"
	},
}

myMod:overrideAsset(NAME_LIST_ENGLISH)