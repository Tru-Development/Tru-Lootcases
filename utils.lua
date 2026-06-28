local Framework = {
    name = 'standalone',
    object = nil
}

local Inventory = {
    name = 'standalone'
}

local activeSessions = {}
local openCooldowns = {}

local SESSION_EXPIRE_SECONDS = 30
local CLAIM_DELAY_SECONDS = 2
local OPEN_COOLDOWN_SECONDS = 3
local ROLL_ITEM_COUNT = 45
local WINNING_INDEX = 38

local function IsStarted(resourceName)
    return GetResourceState(resourceName) == 'started'
end

local function LoadFramework()
    local configuredFramework = Config.Framework or 'auto'

    if (configuredFramework == 'auto' or configuredFramework == 'qb') and IsStarted('qb-core') then
        local qbCore = exports['qb-core']:GetCoreObject()

        if qbCore then
            Framework.name = 'qb'
            Framework.object = qbCore
            return
        end
    end

    if (configuredFramework == 'auto' or configuredFramework == 'qbox') and IsStarted('qbx_core') then
        Framework.name = 'qbox'
        Framework.object = exports.qbx_core
        return
    end

    if (configuredFramework == 'auto' or configuredFramework == 'esx') and IsStarted('es_extended') then
        local esx = exports['es_extended']:getSharedObject()

        if esx then
            Framework.name = 'esx'
            Framework.object = esx
            return
        end
    end
end

local function LoadInventory()
    local configuredInventory = Config.Inventory or 'auto'

    if (configuredInventory == 'auto' or configuredInventory == 'ox') and IsStarted('ox_inventory') then
        Inventory.name = 'ox'
        return
    end

    if (configuredInventory == 'auto' or configuredInventory == 'qb') and IsStarted('qb-inventory') then
        Inventory.name = 'qb'
        return
    end

    if configuredInventory == 'esx' then
        Inventory.name = 'esx'
        return
    end

    if Framework.name == 'qb' then
        Inventory.name = 'qb'
    elseif Framework.name == 'esx' then
        Inventory.name = 'esx'
    else
        Inventory.name = 'standalone'
    end
end

local function GetPlayer(playerSource)
    if Framework.name == 'qb' and Framework.object then
        return Framework.object.Functions.GetPlayer(playerSource)
    end

    if Framework.name == 'esx' and Framework.object then
        return Framework.object.GetPlayerFromId(playerSource)
    end

    if Framework.name == 'qbox' then
        return playerSource
    end

    return playerSource
end

local function Notify(playerSource, message, infoType)
    TriggerClientEvent('tru-lootcases:client:notify', playerSource, message, infoType or 'primary')
end

local function LogSuspicious(playerSource, reason)
    TruUtils.Print(('Rejected action from %s: %s'):format(playerSource, reason), '^1')
end

local function GetItemCount(playerSource, itemName)
    if Inventory.name == 'ox' then
        return exports.ox_inventory:Search(playerSource, 'count', itemName) or 0
    end

    if Framework.name == 'qb' and Framework.object then
        local player = Framework.object.Functions.GetPlayer(playerSource)
        local item = player and player.Functions.GetItemByName(itemName)
        return item and item.amount or 0
    end

    if Framework.name == 'esx' and Framework.object then
        local player = Framework.object.GetPlayerFromId(playerSource)
        local item = player and player.getInventoryItem(itemName)
        return item and item.count or 0
    end

    return 1
end

local function RemoveItem(playerSource, itemName, amount)
    amount = amount or 1

    if GetItemCount(playerSource, itemName) < amount then
        return false
    end

    if Inventory.name == 'ox' then
        return exports.ox_inventory:RemoveItem(playerSource, itemName, amount) == true
    end

    if Framework.name == 'qb' and Framework.object then
        local player = Framework.object.Functions.GetPlayer(playerSource)
        return player and player.Functions.RemoveItem(itemName, amount) == true
    end

    if Framework.name == 'esx' and Framework.object then
        local player = Framework.object.GetPlayerFromId(playerSource)

        if not player then
            return false
        end

        player.removeInventoryItem(itemName, amount)
        return true
    end

    return true
end

local function AddItem(playerSource, itemName, amount)
    amount = amount or 1

    if Inventory.name == 'ox' then
        local success, response = exports.ox_inventory:AddItem(playerSource, itemName, amount)
        return success == true or response == true
    end

    if Framework.name == 'qb' and Framework.object then
        local player = Framework.object.Functions.GetPlayer(playerSource)
        return player and player.Functions.AddItem(itemName, amount) == true
    end

    if Framework.name == 'esx' and Framework.object then
        local player = Framework.object.GetPlayerFromId(playerSource)

        if not player then
            return false
        end

        player.addInventoryItem(itemName, amount)
        return true
    end

    return true
end

local function AddMoney(playerSource, amount)
    if Framework.name == 'qb' and Framework.object then
        local player = Framework.object.Functions.GetPlayer(playerSource)

        if player then
            player.Functions.AddMoney('cash', amount, 'tru-lootcases')
            return true
        end
    end

    if Framework.name == 'esx' and Framework.object then
        local player = Framework.object.GetPlayerFromId(playerSource)

        if player then
            player.addMoney(amount)
            return true
        end
    end

    if Inventory.name == 'ox' then
        local success, response = exports.ox_inventory:AddItem(playerSource, 'money', amount)
        return success == true or response == true
    end

    return true
end

local function SelectReward(caseConfig)
    local totalChance = 0

    for _, reward in ipairs(caseConfig.rewards or {}) do
        totalChance = totalChance + tonumber(reward.chance) or 0
    end

    if totalChance <= 0 then
        return nil
    end

    local roll = math.random() * totalChance
    local currentChance = 0

    for _, reward in ipairs(caseConfig.rewards) do
        currentChance = currentChance + tonumber(reward.chance) or 0

        if roll <= currentChance then
            return reward
        end
    end

    return caseConfig.rewards[#caseConfig.rewards]
end

local function BuildRollItems(caseConfig, reward)
    local rollItems = {}
    local rewards = caseConfig.rewards or {}

    for index = 1, ROLL_ITEM_COUNT do
        local rollReward = rewards[math.random(#rewards)]

        rollItems[index] = {
            item = rollReward.item,
            label = rollReward.label,
            amount = rollReward.amount,
            rarity = rollReward.rarity,
            image = rollReward.image
        }
    end

    rollItems[WINNING_INDEX] = {
        item = reward.item,
        label = reward.label,
        amount = reward.amount,
        rarity = reward.rarity,
        image = reward.image,
        winning = true
    }

    return rollItems
end

local function IsOnCooldown(playerSource)
    local lastOpen = openCooldowns[playerSource]

    if not lastOpen then
        return false
    end

    return TruUtils.GetTime() - lastOpen < OPEN_COOLDOWN_SECONDS
end

local function CreateSession(playerSource, caseName, reward)
    local token = TruUtils.GetToken()

    activeSessions[playerSource] = {
        token = token,
        caseName = caseName,
        reward = reward,
        createdAt = TruUtils.GetTime(),
        claimed = false
    }

    return token
end

local function OpenCase(playerSource, caseName)
    if not TruUtils.IsString(caseName) then
        return LogSuspicious(playerSource, 'invalid case payload')
    end

    if not GetPlayer(playerSource) then
        return LogSuspicious(playerSource, 'missing player object')
    end

    local caseConfig = TruUtils.GetCase(caseName)

    if not caseConfig then
        return Notify(playerSource, 'Invalid lootcase.', 'error')
    end

    if IsOnCooldown(playerSource) then
        return Notify(playerSource, 'Please wait before opening another case.', 'error')
    end

    if activeSessions[playerSource] then
        return Notify(playerSource, 'You are already opening a case.', 'error')
    end

    if not RemoveItem(playerSource, caseName, 1) then
        return Notify(playerSource, ('You need a %s.'):format(caseConfig.label or caseName), 'error')
    end

    local reward = SelectReward(caseConfig)

    if not reward then
        return Notify(playerSource, 'This case has no valid rewards configured.', 'error')
    end

    openCooldowns[playerSource] = TruUtils.GetTime()

    local token = CreateSession(playerSource, caseName, reward)

    TriggerClientEvent('tru-lootcases:client:openCase', playerSource, {
        token = token,
        caseName = caseName,
        caseLabel = caseConfig.label or caseName,
        caseImage = caseConfig.image,
        color = caseConfig.color,
        duration = caseConfig.duration or 6500,
        reward = reward,
        items = BuildRollItems(caseConfig, reward),
        branding = Config.Branding or {},
        theme = Config.Theme or {}
    })
end

local function ClaimReward(playerSource, caseName, token)
    if not TruUtils.IsString(caseName) or not TruUtils.IsString(token) then
        return LogSuspicious(playerSource, 'invalid claim payload')
    end

    local session = activeSessions[playerSource]

    if not session then
        return LogSuspicious(playerSource, 'missing session')
    end

    if session.claimed then
        return LogSuspicious(playerSource, 'duplicate claim')
    end

    if session.caseName ~= caseName or session.token ~= token then
        return LogSuspicious(playerSource, 'session mismatch')
    end

    local elapsed = TruUtils.GetTime() - session.createdAt

    if elapsed < CLAIM_DELAY_SECONDS then
        return LogSuspicious(playerSource, 'claim too early')
    end

    if elapsed > SESSION_EXPIRE_SECONDS then
        activeSessions[playerSource] = nil
        return Notify(playerSource, 'Lootcase session expired.', 'error')
    end

    session.claimed = true
    activeSessions[playerSource] = nil

    local reward = session.reward
    local success

    if reward.money then
        success = AddMoney(playerSource, tonumber(reward.amount) or 0)
    else
        success = AddItem(playerSource, reward.item, tonumber(reward.amount) or 1)
    end

    if not success then
        return Notify(playerSource, 'Reward could not be added. Check your inventory item list.', 'error')
    end

    Notify(playerSource, ('You won %sx %s!'):format(reward.amount or 1, reward.label or reward.item), 'success')
end

local function RegisterUsableItems()
    if Framework.name == 'qb' and Framework.object and Framework.object.Functions.CreateUseableItem then
        for caseName in pairs(Config.Cases or {}) do
            Framework.object.Functions.CreateUseableItem(caseName, function(playerSource)
                OpenCase(playerSource, caseName)
            end)
        end

        TruUtils.Print('Registered QBCore usable case items.', '^2')
        return
    end

    if Framework.name == 'esx' and Framework.object and Framework.object.RegisterUsableItem then
        for caseName in pairs(Config.Cases or {}) do
            Framework.object.RegisterUsableItem(caseName, function(playerSource)
                OpenCase(playerSource, caseName)
            end)
        end

        TruUtils.Print('Registered ESX usable case items.', '^2')
        return
    end

    if Inventory.name == 'ox' then
        TruUtils.Print('Using ox_inventory item exports. Add the included ox item snippets to ox_inventory/data/items.lua.', '^2')
        return
    end

    TruUtils.Print('No usable item registration found. Enable Config.AllowCommandTesting to test with /lootcase.', '^3')
end

RegisterNetEvent('tru-lootcases:server:useCase', function(caseName)
    OpenCase(source, caseName)
end)

RegisterNetEvent('tru-lootcases:server:claimReward', function(caseName, token)
    ClaimReward(source, caseName, token)
end)

AddEventHandler('playerDropped', function()
    activeSessions[source] = nil
    openCooldowns[source] = nil
end)

CreateThread(function()
    Wait(1000)
    LoadFramework()
    LoadInventory()

    TruUtils.Print(('Framework: %s | Inventory: %s'):format(Framework.name, Inventory.name), '^5')
    RegisterUsableItems()
end)
