local ped = PlayerPedId()

if Config.isAntiVDMDamage then
    SetWeaponDamageModifier(-1553120962, 0.0)
end

local closestPlayerPed
local closestPlayerVehicle

if isAntiVDMCollision then
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
end