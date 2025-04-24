local mod = ...

--------------------------------------------------------------------------
-- Create behavior tree node to finish guard job
mod:registerBehaviorTreeNode({
	Name = "FINISH_GUARD_LOCATOR_POST",
	
	VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
		WorkplaceLocation = "BEHAVIOR_TREE_DATA_LOCATION",
	},
	
	Update = function(self, level, instance)
		if (self.AgentData == nil) then mod:logError("SETUP_GUARD_LOCATOR_POST.AgentData should not be nil") return BEHAVIOR_TREE_NODE_RESULT.ERROR end
		if (self.WorkplaceLocation == nil) then mod:logError("SETUP_GUARD_LOCATOR_POST.WorkplaceLocation should not be nil") return BEHAVIOR_TREE_NODE_RESULT.ERROR end
		
		local guardLocator = self.WorkplaceLocation.DestinationObject:getEnabledComponent("COMP_GUARD_LOCATOR")
		guardLocator:unassignSoldier()
		
		return BEHAVIOR_TREE_NODE_RESULT.TRUE
	end
})
