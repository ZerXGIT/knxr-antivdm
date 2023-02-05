local isAntiVDM = Config.isAntiVDM
local ped = PlayerPedId()

if isAntiVDM then
    SetWeaponDamageModifier(-1553120962, 0.0)
end

local closestPlayerPed
local closestPlayerVehicle

CreateThread(function()
    while true do
        Citizen.Wait(500)
        vehicle = GetVehiclePedIsIn(ped, false)
        for _, i in ipairs(GetActivePlayers()) do
            if i ~= PlayerId() then
                closestPlayerPed = GetPlayerPed(i)
                closestPlayerVehicle = GetVehiclePedIsIn(closestPlayerPed, false)
            end
        end
    end
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        Citizen.Wait(0)
        SetEntityNoCollisionEntity(closestPlayerVehicle, ped, true)
    end
end)