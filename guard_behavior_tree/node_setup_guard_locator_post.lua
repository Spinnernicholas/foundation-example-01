 local mod = ...

--------------------------------------------------------------------------
-- Create behavior tree node to setup the guard at location job
mod:registerBehaviorTreeNode({
	Name = "SETUP_GUARD_LOCATOR_POST",
	
	VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
		GuardingLocationDistance = "BEHAVIOR_TREE_DATA_FLOAT",
		WorkplaceLocation = "BEHAVIOR_TREE_DATA_LOCATION",
		GuardingLocation1 = "BEHAVIOR_TREE_DATA_LOCATION",
		GuardingLocation2 = "BEHAVIOR_TREE_DATA_LOCATION",
	},
	
	Update = function(self, level, instance)
		local workplace = self.AgentData.Agent:getOwner():getEnabledComponent("COMP_VILLAGER"):getJobInstance().Workplace
		
		-- No workplace found that matches this job
		if (workplace == nil or not workplace:isEnabled()) then
			self.AgentData.Agent:setBehaviorMessage(foundation.localize("I_CANT_FIND_A_PLACE_TO_WORK"))
			return BEHAVIOR_TREE_NODE_RESULT.FALSE
		end
		
		local guardLocatorList = {}
		local building = workplace:getOwner():findFirstObjectWithComponentUp("COMP_BUILDING")
		building:getBuildingPartList():forEach(function(buildingPart)
			local guardLocator = buildingPart:getOwner():getEnabledComponent("COMP_GUARD_LOCATOR")
			if (guardLocator ~= nil and (not guardLocator:isSoldierAssigned())) then
				table.insert(guardLocatorList, guardLocator)
			end
		end)
		
		if (#guardLocatorList == 0) then
			self.AgentData.Agent:setBehaviorMessage(foundation.localize("I_CANT_FIND_A_PLACE_TO_GUARD"))
			return BEHAVIOR_TREE_NODE_RESULT.FALSE
		end
		
		local selectedLocator = guardLocatorList[math.random(#guardLocatorList)]
		selectedLocator:assignSoldier(self.AgentData.Agent)
		
		local selectedLocatorObject = selectedLocator:getOwner()
		self.WorkplaceLocation:setDestination(selectedLocatorObject)
		
		local firstGuardSpot, secondGuardSpot = nil
		if (math.random() < 0.5) then
			firstGuardSpot = self.GuardingLocation1
			secondGuardSpot = self.GuardingLocation2
		else
			firstGuardSpot = self.GuardingLocation2
			secondGuardSpot = self.GuardingLocation1
		end
		
		local halfHorizontalOffset = self.GuardingLocationDistance ~= nil and (self.GuardingLocationDistance.FloatValue / 2.0) or 1.0
		
		firstGuardSpot:setDestination(selectedLocatorObject, { halfHorizontalOffset, 0 }, true);
		secondGuardSpot:setDestination(selectedLocatorObject, { -halfHorizontalOffset, 0 }, true);
		
		return BEHAVIOR_TREE_NODE_RESULT.TRUE
	end
})
