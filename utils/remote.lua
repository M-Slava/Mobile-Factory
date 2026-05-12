-- Return the storage Object --
function getStorage()
    return storage
end

-- Return the MFTable --
function getMFTable()
    return storage.MFTable
end

-- Return name list of all Users with a Mobile Factory --
function getMFUsersList()
    local MFUsersList = {}
    for k, _ in pairs(storage.MFTable) do
        table.insert(MFUsersList, k)
    end
    return MFUsersList
end

-- Return a MF Object from its owner name --
function getMFObj(name)
    return storage.MFTable[name]
end

-- Return a MF Entity from its owner name --
function getMFEnt(name)
    if storage.MFTable[name] ~= nil then
        return storage.MFTable[name].ent
    end
end

-- Return a MF Energy from its owner name --
function getMFEnergy(name)
    if storage.MFTable[name] ~= nil then
        return EI.energy(storage.MFTable[name].internalEnergyObj)
    end
    return 0
end

-- Remove Energy from a MF from its owner name --
function removeMFEnergy(name, amount)
    if storage.MFTable[name] ~= nil then
        return EI.removeEnergy(storage.MFTable[name].internalEnergyObj, amount)
    end
    return 0
end

-- Check if the Data Network has this Item --
function hasItem(name, item, quality)
    if storage.MFTable[name] ~= nil then
        return storage.MFTable[name].dataNetwork:hasItem(item, quality)
    end
    return 0
end

-- Add Items to the Data Network --
function addItems(name, item, amount, quality)
    if storage.MFTable[name] ~= nil then
        return storage.MFTable[name].dataNetwork:addItems(item, amount, quality)
    end
    return 0
end

-- Remove Items from the Data Network --
function takeItems(name, item, amount, quality)
    if storage.MFTable[name] ~= nil then
        return storage.MFTable[name].dataNetwork:getItem(item, amount, quality)
    end
    return 0
end

-- Add or remove crafting category to Data Assembler blacklist
function blacklistDACategory(category, value)
	if storage.dataAssemblerBlacklist ~= nil then
		if value then
			storage.dataAssemblerBlacklist[category] = true
		else
			storage.dataAssemblerBlacklist[category] = nil
		end
	end
end

-- Add the MFCom Interface --
remote.add_interface("MFCom", {
    getStorage=getStorage,
    getMFTable=getMFTable,
    getMFUsersList=getMFUsersList,
    getMFObj=getMFObj,
    getMFEnt=getMFEnt,
    getMFEnergy=getMFEnergy,
    removeMFEnergy=removeMFEnergy,
    hasItem=hasItem,
    addItems=addItems,
    takeItems=takeItems,
    blacklistDACategory=blacklistDACategory
})