config = {
    -- a_players_under_1 = { -- EXAMPLE: This will by checked first and trigger if the playercount on the server is below 1
    --     VehicleDensityMultiplier = 0, -- 0.00 - 1.00
    --     ParkedVehicleDensityMultiplier = 0, -- 0.00 - 1.00
    --     PedDensityMultiplier = 0, -- 0.00 - 1.00
    --     ScenarioPedDensityMultiplier = 0, -- 0.00 - 1.00
    --     DisabledDispatchServices = {  }, -- For a list check the "common.lua" file
    --     DisableCops = true -- Wether cops will chase the player or not
    -- },
    a_players_under_1 = {
        VehicleDensityMultiplier = 0,
        ParkedVehicleDensityMultiplier = 0,
        PedDensityMultiplier = 0,
        ScenarioPedDensityMultiplier = 0,
        DisabledDispatchServices = { Dispatch.PoliceAutomobile, Dispatch.PoliceAutomobileWaitPulledOver, Dispatch.PoliceAutomobileWaitCruising, Dispatch.PoliceRoadBlock, Dispatch.PoliceRiders, Dispatch.PoliceVehicleRequest, Dispatch.PoliceHelicopter, Dispatch.PoliceBoat, Dispatch.SwatAutomobile, Dispatch.SwatHelicopter, Dispatch.ArmyVehicle, Dispatch.FireDepartment, Dispatch.AmbulanceDepartment, Dispatch.Gangs, Dispatch.BikerBackup },
        DisableCops = true
    },
    b_players_under_2 = {
        VehicleDensityMultiplier = .25,
        ParkedVehicleDensityMultiplier = .75,
        PedDensityMultiplier = 1,
        ScenarioPedDensityMultiplier = 1,
        DisabledDispatchServices = { Dispatch.ArmyVehicle },
        DisableCops = false
    },
    c_percent_under_20 = {
        VehicleDensityMultiplier = 0,
        ParkedVehicleDensityMultiplier = 0,
        PedDensityMultiplier = .8,
        ScenarioPedDensityMultiplier = 0,
        DisabledDispatchServices = { Dispatch.PoliceAutomobile, Dispatch.PoliceAutomobileWaitPulledOver, Dispatch.PoliceAutomobileWaitCruising, Dispatch.PoliceRoadBlock, Dispatch.PoliceRiders, Dispatch.PoliceVehicleRequest, Dispatch.PoliceHelicopter, Dispatch.PoliceBoat, Dispatch.SwatAutomobile, Dispatch.SwatHelicopter, Dispatch.ArmyVehicle, Dispatch.FireDepartment, Dispatch.AmbulanceDepartment, Dispatch.Gangs, Dispatch.BikerBackup },
        DisableCops = true
    },
    d_percent_under_40 = {
        VehicleDensityMultiplier = 0,
        ParkedVehicleDensityMultiplier = 0,
        PedDensityMultiplier = .4,
        ScenarioPedDensityMultiplier = 0,
        DisabledDispatchServices = { Dispatch.PoliceAutomobile, Dispatch.PoliceAutomobileWaitPulledOver, Dispatch.PoliceAutomobileWaitCruising, Dispatch.PoliceRoadBlock, Dispatch.PoliceRiders, Dispatch.PoliceVehicleRequest, Dispatch.PoliceHelicopter, Dispatch.PoliceBoat, Dispatch.SwatAutomobile, Dispatch.SwatHelicopter, Dispatch.ArmyVehicle, Dispatch.FireDepartment, Dispatch.AmbulanceDepartment, Dispatch.Gangs, Dispatch.BikerBackup },
        DisableCops = true
    },
    e_percent_over_50 = {
        VehicleDensityMultiplier = 0,
        ParkedVehicleDensityMultiplier = 0,
        PedDensityMultiplier = 0,
        ScenarioPedDensityMultiplier = 0,
        DisabledDispatchServices = { Dispatch.PoliceAutomobile, Dispatch.PoliceAutomobileWaitPulledOver, Dispatch.PoliceAutomobileWaitCruising, Dispatch.PoliceRoadBlock, Dispatch.PoliceRiders, Dispatch.PoliceVehicleRequest, Dispatch.PoliceHelicopter, Dispatch.PoliceBoat, Dispatch.SwatAutomobile, Dispatch.SwatHelicopter, Dispatch.ArmyVehicle, Dispatch.FireDepartment, Dispatch.AmbulanceDepartment, Dispatch.Gangs, Dispatch.BikerBackup },
        DisableCops = true
    }
}