local mod = ...

--------------------------------------------------------------------------
-- Create the new locator guard behavior tree
mod:registerBehaviorTree({
	Id = "BEHAVIOR_SOLDIER_GUARD_LOCATOR",
	VariableList = {
		{
			Name = foundation.BEHAVIOR_TREE_AGENT_DATA,
			DataType = "BEHAVIOR_TREE_DATA_AGENT",
		},
		{
			Name = "GuardingLocationDistance",
			DataType = "BEHAVIOR_TREE_DATA_FLOAT",
			InitialValue = { FloatValue = 4.0 }
		},
		{
			Name = "WorkplaceLocation",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION"
		},
		{
			Name = "GuardingLocation1",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION"
		},
		{
			Name = "GuardingLocation2",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION"
		},
		{
			Name = "GuardRepeatData",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			InitialValue = { LoopCount = 5 }
		},
		{
			Name = "GuardTimer",
			DataType = "BEHAVIOR_TREE_DATA_WAIT",
			InitialValue = {
				TimeToWait = 10.0,
				Animation = AGENT_ANIMATION.GUARD,
			}
		},
	},
	Root = {
		Name = "GlobalSequencer",
		Type = "SEQUENCER",
		Children = {
			{
				Name = "SetupGuardLocatorPost",
				Type = "SETUP_GUARD_LOCATOR_POST",
				AgentData = "AgentData",
				GuardingLocationDistance = "GuardingLocationDistance",
				WorkplaceLocation = "WorkplaceLocation",
				GuardingLocation1 = "GuardingLocation1",
				GuardingLocation2 = "GuardingLocation2",
			},
			{
				Name = "Repeater",
				Type = "REPEAT",
				RepeatData = "GuardRepeatData",
				Child = {
					Name = "GuardSequencer",
					Type = "SEQUENCER",
					Children = {
						{
							Name = "GoToLocation1",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "GuardingLocation1",
						},
						{
							Name = "SetRotationLocation1",
							Type = "SET_ORIENTATION",
							AgentData = "AgentData",
							Destination = "GuardingLocation1",
						},
						{
							Name = "WaitLocation1",
							Type = "WAIT",
							AgentData = "AgentData",
							TimeToWait = "GuardTimer",
						},
						{
							Name = "GoToLocation2",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "GuardingLocation2",
						},
						{
							Name = "SetRotationLocation2",
							Type = "SET_ORIENTATION",
							AgentData = "AgentData",
							Destination = "GuardingLocation2",
						},
						{
							Name = "WaitLocation2",
							Type = "WAIT",
							AgentData = "AgentData",
							TimeToWait = "GuardTimer",
						}
					}
				}
			},
			{
				Name = "FinishGuardLocatorPost",
				Type = "FINISH_GUARD_LOCATOR_POST",
				AgentData = "AgentData",
				WorkplaceLocation = "WorkplaceLocation",
			},
		}
	}
})
