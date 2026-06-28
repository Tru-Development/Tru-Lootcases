TruUtils = TruUtils or {}

local resourceName = GetCurrentResourceName()

function TruUtils.Print(message, color)
    color = color or '^5'
    print(('%s[%s]^0 %s'):format(color, resourceName, message))
end

function TruUtils.Debug(message)
    if Config.Debug then
        TruUtils.Print(message, '^3')
    end
end

function TruUtils.IsString(value)
    return type(value) == 'string' and value ~= ''
end

function TruUtils.IsNumber(value)
    return type(value) == 'number' and value == value and value > 0
end

function TruUtils.GetCase(caseName)
    if not TruUtils.IsString(caseName) then
        return nil
    end

    return Config.Cases and Config.Cases[caseName] or nil
end

function TruUtils.GetTime()
    if IsDuplicityVersion() then
        return os.time()
    end

    return math.floor(GetGameTimer() / 1000)
end

function TruUtils.GetToken()
    local left = math.random(100000, 999999)
    local right = math.random(100000, 999999)

    return ('%s:%s:%s'):format(GetGameTimer and GetGameTimer() or os.time(), left, right)
end
