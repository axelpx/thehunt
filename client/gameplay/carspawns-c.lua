local carsHunters = {"dubsta2", "baller6", "zion", "felon"}
local carsRunners = {"blista", "phoenix", "stratum", "coquette"}
--local carsSpawned = false

RegisterCommand("car", function()
    spawnCar(car)
    notify("~y~Spawned car: ~w~" .. car)
end)

function spawnCar(car, x, y, z, h)
    local car = GetHashKey(car)
    local x, y, z, h

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end
    local vehicle = CreateVehicle(car, x, y, z, h, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
end

function spawnStarterCars()
	local car = (carsHunter[math.random(#carsHunters)])
	--spawnCar(car, 1125.57, -3125.97, 5.41, 180)
end

--[[Citizen.CreateThread(function()

    while i < 1 do
        Citizen.Wait(1)
        spawnStarterCars()
        carsSpawned = true
        print("Spawned starter cars...")
        i = i + 1
    end
end)]]--