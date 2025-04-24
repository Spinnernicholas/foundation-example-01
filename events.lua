---@type Mod
local myMod = ...

---@type GAME_CONDITION[]
local SUPER_QUEST_OBJECTIVE_LIST = {}

---@type GAME_CONDITION_ACCUMULATE_IN_STORAGE
SUPER_QUEST_OBJECTIVE_LIST[0] = {
	DataType = "GAME_CONDITION_ACCUMULATE_IN_STORAGE",
	ResourceListToAccumulate = {
		{ Resource = "WOOD", Quantity = 10 },
	},
}
---@type GAME_CONDITION_EXECUTE_ACTION_LIST
SUPER_QUEST_OBJECTIVE_LIST[1] = {
	DataType = "GAME_CONDITION_EXECUTE_ACTION_LIST",
	IsNeedExecution = true,
	ActionList = {
		{
			DataType = "GAME_ACTION_DELIVER_RESOURCE",
			AmountToPay = {
				{ Resource = "WOOD", Quantity = 10 },
			},
			IsDeliveryAction = true,
		},
	},
}

---@type GAME_CONDITION[]
local SUPER_QUEST_FAILURE_CONDITION_LIST = {}

---@type GAME_CONDITION_DAY_COUNT
SUPER_QUEST_FAILURE_CONDITION_LIST[0] = {
		DataType = "GAME_CONDITION_DAY_COUNT",
		DaysToComplete = 30,
}

---@type GAME_ACTION[]
local SUPER_QUEST_SUCCESS_ACTION_LIST = {}

---@type GAME_ACTION_GIVE_RESOURCE_LIST
SUPER_QUEST_SUCCESS_ACTION_LIST[0] = {
	DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
	BudgetCategory = "QUESTS",
	ResourceCollection = {
		{ Resource = "ASTEROID_ROCK", Quantity = 5 },
	},
}

---@type QUEST
local SUPER_QUEST = {
	DataType = "QUEST",
	Id = "SUPER_QUEST",
	Name = "THE_GREAT_QUEST",
	Description = "THE_GREAT_QUEST_DESCRIPTION",
	ObjectiveList = SUPER_QUEST_OBJECTIVE_LIST,
	FailureConditionList = SUPER_QUEST_FAILURE_CONDITION_LIST,
	QuestSuccessActionList = SUPER_QUEST_SUCCESS_ACTION_LIST,
	QuestFailActionList = {},
}

myMod:registerAsset(SUPER_QUEST)

---@type EVENT
local SUPER_EVENT = {
	DataType = "EVENT",
	Id = "SUPER_EVENT",
	Title = "SUPER_EVENT_TITLE",
	Description = "SUPER_EVENT_DESC",
	DaysToFirst = 1,
	Delay = 1,
	DaysBetweenOccurences = 60,
	IsRecurrent = true,
	ConditionList = {
		{
			DataType = "GAME_CONDITION_BUILDING_BUILT",
			AssetBuilding = "BUILDING_WOODCUTTER_CAMP",
		},
		{
			DataType = "GAME_CONDITION_POPULATION_COUNT",
			PopulationCount = 0,
		},
	},
	ActionList = {
		{
			DataType = "GAME_ACTION_GIVE_QUEST",
			Quest = "SUPER_QUEST",
		},
	}
}

myMod:registerAsset(SUPER_EVENT)
