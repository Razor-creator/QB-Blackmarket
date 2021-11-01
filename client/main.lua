
QBCore = nil

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

--local menuOpened = false

local function openMenu(data)
    if not data then return end
    SetNuiFocus(true, true)
    --menuOpened = true
    SendNUIMessage({
        action = 'OPEN_MENU',
        data = data
    })
end

local function closeMenu()
    --menuOpened = false
    SetNuiFocus(false)
    SendNUIMessage({
        action = 'CLOSE_MENU'
    })
end

RegisterNUICallback('clickedButton', function(data)
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SetNuiFocus(false)
    if data.isServer then
        TriggerServerEvent(data.event, data.args)
    else
        TriggerEvent(data.event, data.args)
    end
end)

RegisterNUICallback('closeMenu', function()
    --menuOpened = false
    SetNuiFocus(false)
end)

-- RegisterCommand('+playerfocus', function()
--     if menuOpened then
--         SetNuiFocus(true, true)
--     end
-- end)

RegisterKeyMapping('+playerFocus', 'Give Menu Focus', 'keyboard', 'LMENU')

exports("openMenu", openMenu)
exports("closeMenu", closeMenu)
exports('clearHistory', clearHistory)

--[[RegisterCommand("qbmenutest", function(source, args, raw)
    openMenu({
        {
            header = "Black Market",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Buy Items",
            txt = "Here you can buy things",
            params = {
                event = "qb-menu:client:buyMenu",
                args = {
                    number = 1,
                }
            }
        },
        {
            header = "Sell Items",
            txt = "Here you can sell things",
            params = {
                event = "qb-menu:client:sellMenu",
                args = {
                    number = 1,
                }
            }
        },
    })
end)]]

RegisterNetEvent('qb-menu:client:buyMenu', function(data)
    local number = data.number
    openMenu({
        {
            header = "< Tilbage",
        },
        {
            header = "Trojan USB",
            txt = "5500,- pr. styk.",
            params = {
                event = "qb-menu:client:buyButton",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "Electronic Kit",
            txt = "8500,- pr. styk.",
            params = {
                event = "qb-menu:client:buy1Button",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "CokeLab Key",
            txt = "20.000,- pr. styk.",
            params = {
                event = "qb-menu:client:buy2Button",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "Laundry Key",
            txt = "20.000,- pr. styk.",
            params = {
                event = "qb-menu:client:buy3Button",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "WeedLab Key",
            txt = "20.000,- pr. styk.",
            params = {
                event = "qb-menu:client:buy4Button",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "MethLab Key",
            txt = "20.000,- pr. styk.",
            params = {
                event = "qb-menu:client:buy5Button",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "Handcuffs",
            txt = "10.000,- pr. styk.",
            params = {
                event = "qb-menu:client:buy6Button",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
    })
end)

RegisterNetEvent('qb-menu:client:sellMenu', function(data)
    local number = data.number
    openMenu({
        {
            header = "< Tilbage",
        },
        {
            header = "CokeLab Key",
            txt = "10.000,- pr. styk",
            params = {
                event = "qb-menu:client:sellButton",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "Laundry Key",
            txt = "10.000,- pr. styk",
            params = {
                event = "qb-menu:client:sellButton",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "WeedLab Key",
            txt = "10.000,- pr. styk",
            params = {
                event = "qb-menu:client:sellButton",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
        {
            header = "MethLab Key",
            txt = "10.000,- pr. styk",
            params = {
                event = "qb-menu:client:sellButton",
                args = {
                    message = "This was called by clicking this button"
                }
            }
        },
    })
end)

RegisterNetEvent('qb-menu:client:sellButton', function(data)
    TriggerServerEvent('qb-blackmarket:server:sellItems')
end)

RegisterNetEvent('qb-menu:client:buyButton', function(data)
    TriggerServerEvent('qb-blackmarket:server:buyItems')
end)

RegisterNetEvent('qb-menu:client:buy1Button', function(data)
    TriggerServerEvent('qb-blackmarket:server:buy1Items')
end)

RegisterNetEvent('qb-menu:client:buy2Button', function(data)
    TriggerServerEvent('qb-blackmarket:server:buy2Items')
end)

RegisterNetEvent('qb-menu:client:buy3Button', function(data)
    TriggerServerEvent('qb-blackmarket:server:buy3Items')
end)

RegisterNetEvent('qb-menu:client:buy4Button', function(data)
    TriggerServerEvent('qb-blackmarket:server:buy4Items')
end)

RegisterNetEvent('qb-menu:client:buy5Button', function(data)
    TriggerServerEvent('qb-blackmarket:server:buy5Items')
end)

RegisterNetEvent('qb-menu:client:buy6Button', function(data)
    TriggerServerEvent('qb-blackmarket:server:buy6Items')
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        if(Vdist(pos.x, pos.y, pos.z, Config.Location.x, Config.Location.y, Config.Location.z+0.2) < 15.0)then
			DrawText3D(Config.Location.x, Config.Location.y, Config.Location.z + 0.2, "~g~E~w~ - For at åbne det Sorte Markede")
				if IsControlJustReleased(0, 38) then -- E
                    openMenu({
                        {
                            header = "Det Sorte Markede",
                            isMenuHeader = true, -- Set to true to make a nonclickable title
                        },
                        {
                            header = "Køb Ting",
                            txt = "Her kan du købe ting",
                            params = {
                                event = "qb-menu:client:buyMenu",
                                args = {
                                    number = 1,
                                }
                            }
                        },
                        {
                            header = "Sælg Ting",
                            txt = "Her kan du sælge ting",
                            params = {
                                event = "qb-menu:client:sellMenu",
                                args = {
                                    number = 1,
                                }
                            }
                        },
                    })
				end
        end
	end
end)