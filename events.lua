local myMod = ...

myMod:registerAsset({
	DataType = "QUEST",
	Id = "SUPER_QUEST",
	Name = "THE_GREAT_QUEST",
	Description = "THE_GREAT_QUEST_DESCRIPTION",
	ObjectiveList = {
		{
			DataType = "GAME_CONDITION_ACCUMULATE_IN_STORAGE",
			ResourceListToAccumulate = {
				{ Resource = "WOOD", Quantity = 10 },
			},
		},
		{
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
		},
	},
	FailureConditionList = {
		{
			DataType = "GAME_CONDITION_DAY_COUNT",
			DaysToComplete = 30,
		},
	},
	QuestSuccessActionList = {
		{
			DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
			BudgetCategory = "QUESTS",
			ResourceCollection = {
				{ Resource = "ASTEROID_ROCK", Quantity = 5 },
			},
		},
	},
	QuestFailActionList = {},
})

myMod:registerAsset({
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
})
