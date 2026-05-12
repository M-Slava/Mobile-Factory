-- Mobile Factory Internal Battery --

-- Item --
local ibI = {}
ibI.type = "item"
ibI.name = "mfInternalBatteryEquipment"
ibI.icon = "__Mobile_Factory_Graphics_zoms__/graphics/energy/InternalEnergyCubeI.png"
ibI.icon_size = 128
ibI.place_as_equipment_result = "mfInternalBatteryEquipment"
ibI.subgroup = "MobileFactory"
ibI.order = "z"
ibI.stack_size = 1
data:extend{ibI}

-- Equipement --
local ibE = {}
ibE.name = "mfInternalBatteryEquipment"
ibE.type = "battery-equipment"
ibE.categories = {"mfEquipments"}
ibE.sprite = {filename="__Mobile_Factory_Graphics_zoms__/graphics/energy/InternalEnergyCubeI.png", size=128}
ibE.shape = {width=5, height=5, type="full"}
ibE.energy_source =
{
    type = "electric",
    usage_priority = "tertiary",
    input_flow_limit = "50MW",
    output_flow_limit = "50MW",
    buffer_capacity = "500MJ"
}
data:extend{ibE}

-- Recipe --
local ibR = {}
ibR.type = "recipe"
ibR.name = "mfInternalBatteryEquipment"
ibR.energy_required = 5
ibR.enabled = false
ibR.ingredients =
    {
		{type="item", name="CrystalizedCircuit", amount=50}
    }
ibR.results = 
  {
    {type="item", name="mfInternalBatteryEquipment", amount=1}
  }
data:extend{ibR}

-- Technology --
local ibT = {}
ibT.name = "MFInternalBattery"
ibT.type = "technology"
ibT.icon = "__Mobile_Factory_Graphics_zoms__/graphics/energy/InternalEnergyCubeI.png"
ibT.icon_size = 128
ibT.unit = {
	count = 5,
	time = 60,
	ingredients={
		{"DimensionalSample", 200},
		{"DimensionalCrystal", 5}
	}
}
ibT.prerequisites =  {"DimensionalCrystal", "ControlCenter"}
ibT.effects = {{type="unlock-recipe", recipe="mfInternalBatteryEquipment"}}
data:extend{ibT}