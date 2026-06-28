local isOpening = false
local currentSession = nil

local function Notify(message, infoType)
    infoType = infoType or 'primary'

    if GetResourceState('ox_lib') == 'started' then
        exports.ox_lib:notify({
            description = message,
            type = infoType
        })
        return
    end

    if GetResourceState('qb-core') == 'started' then
        TriggerEvent('QBCore:Notify', message, infoType)
        return
    end

    if GetResourceState('es_extended') == 'started' then
        TriggerEvent('esx:showNotification', message)
        return
    end

    print(('[Tru-Lootcases] %s'):format(message))
end

local function GetCaseNameFromItem(data)
    if type(data) == 'string' then
        return data
    end

    if type(data) ~= 'table' then
        return nil
    end

    if type(data.name) == 'string' then
        return data.name
    end

    if type(data.item) == 'table' and type(data.item.name) == 'string' then
        return data.item.name
    end

    if type(data.item) == 'string' then
        return data.item
    end

    if type(data.metadata) == 'table' and type(data.metadata.name) == 'string' then
        return data.metadata.name
    end

    return nil
end

local function UseCase(data)
    local caseName = GetCaseNameFromItem(data)

    if not caseName then
        return Notify('Invalid lootcase item.', 'error')
    end

    TriggerServerEvent('tru-lootcases:server:useCase', caseName)
end

RegisterNetEvent('tru-lootcases:client:openCase', function(caseData)
    if isOpening or type(caseData) ~= 'table' then
        return
    end

    local caseConfig = Config.Cases and Config.Cases[caseData.caseName]

    if not caseConfig then
        return
    end

    isOpening = true
    currentSession = {
        caseName = caseData.caseName,
        token = caseData.token
    }

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        caseName = caseData.caseName,
        caseLabel = caseData.caseLabel,
        caseImage = caseData.caseImage,
        color = caseData.color,
        duration = caseData.duration,
        reward = caseData.reward,
        items = caseData.items,
        branding = caseData.branding,
        theme = caseData.theme
    })
end)

RegisterNUICallback('finished', function(data, callback)
    SetNuiFocus(false, false)
    isOpening = false

    if currentSession then
        TriggerServerEvent('tru-lootcases:server:claimReward', currentSession.caseName, currentSession.token)
    end

    currentSession = nil
    callback({ ok = true })
end)

RegisterNUICallback('close', function(_, callback)
    SetNuiFocus(false, false)
    isOpening = false
    currentSession = nil
    callback({ ok = true })
end)

RegisterNetEvent('tru-lootcases:client:useCase', UseCase)
RegisterNetEvent('tru-lootcases:client:notify', Notify)
exports('useCase', UseCase)

if Config.AllowCommandTesting then
    RegisterCommand(Config.Command or 'lootcase', function(_, args)
        TriggerServerEvent('tru-lootcases:server:useCase', args[1] or 'common_case')
    end, false)
end
