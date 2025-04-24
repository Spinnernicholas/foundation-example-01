local mod = ...

mod:registerAssetId("models/soldier_locator.fbx/Prefab/Arrow", "PREFAB_SOLDIER_LOCATOR")

--------------------------------------------------------------------------
-- Create COMP_GUARD_LOCATOR (doesn't do anything, except it is used to locate locators)
local COMP_GUARD_LOCATOR = {
	TypeName = "COMP_GUARD_LOCATOR",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "AssignedSoldier", Type = "COMP_AGENT", Default = nil, Flags = { "SAVE_GAME" } },
	}
}

function COMP_GUARD_LOCATOR:isSoldierAssigned()
	return self.AssignedSoldier ~= nil
end

function COMP_GUARD_LOCATOR:assignSoldier(_agent)
	if (not self:isSoldierAssigned()) then
		self.AssignedSoldier = _agent
	else
		mod:logError("Cannot assign soldier, another one is already assigned")
	end
end

function COMP_GUARD_LOCATOR:unassignSoldier()
	if (self:isSoldierAssigned()) then
		self.AssignedSoldier = nil
	else
		mod:logError("Cannot unassign soldier, none is currently assigned")
	end
end

mod:registerClass(COMP_GUARD_LOCATOR)

--------------------------------------------------------------------------
-- Add COMP_BUILDING_PART and COMP_GUARD_LOCATOR on soldier guard locator prefab
mod:registerPrefabComponent("models/soldier_locator.fbx/Prefab/Arrow", { DataType = "COMP_BUILDING_PART" })
mod:registerPrefabComponent("models/soldier_locator.fbx/Prefab/Arrow", { DataType = "COMP_GUARD_LOCATOR" })

--------------------------------------------------------------------------
-- Add new building part type LOCATOR
mod:registerEnumValue("BUILDING_PART_TYPE", "LOCATOR")

--------------------------------------------------------------------------
-- Register guard locator building part
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "SOLDIER_PATROL_LOCATOR_PART",
	Name = "SOLDIER_GUARD_LOCATOR_NAME",
	Description = "SOLDIER_GUARD_LOCATOR_DESC",
	Category = BUILDING_PART_TYPE.LOCATOR,
	IsVisibleWhenBuilt = false,
	IsMovableWhenBuilt = true, --TODO: IsMovableWhenBuilt is no longer available
	IsShowInUi = true,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_SOLDIER_LOCATOR"
	},
	BuildingZone = {},
	Cost = {}
})

--------------------------------------------------------------------------
-- Add this building part to the wooden keep's part list
mod:overrideAsset({
	Id = "MONUMENT_CASTLE",
	AssetBuildingPartList = {
		Action = "APPEND",
		"SOLDIER_PATROL_LOCATOR_PART",
	},
})


--TODO: What asset replaced BUILDING_FUNCTION_WOODEN_KEEP?
--------------------------------------------------------------------------
-- Add the new behavior tree to the wooden keep activity list
mod:overrideAsset({
	Id = "BUILDING_FUNCTION_WOODEN_KEEP",
	TrainingBehaviorList = {
		Action = "APPEND",
		"BEHAVIOR_SOLDIER_GUARD_LOCATOR"
	}
})
