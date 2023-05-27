Config = {}

Config.General = {

    props = { -- props that can be searched: add more props here if you want https://gtahash.ru
        "zprop_bin_01a_old",
        "prop_ld_case_01",
        "prop_bin_01a",
        "prop_cs_bin_03",
        "prop_cs_bin_02",
        "prop_gas_smallbin01",
        "prop_recyclebin_03_a",
        "prop_bin_07c",
        "prop_bin_06a",
        "prop_bin_02a",
        "prop_bin_05a",
        "prop_recyclebin_01a",
        "prop_bin_04a",
        "prop_bin_03a",
        "prop_bin_14a",
        "prop_bin_13a",
        "prop_bin_14b",
    },

    searchTime = 3, -- how long it takes to search a bin
    refreshTime = 5, -- how long it takes to refresh a bin after it has been searched (in minutes)
    maxRange = 2,  -- how close you need to be to a bin to search it
     
    rewards = { -- rewards for searching bins (randomly selected) (can be items or money)
        money = {
            min = 1,
            max = 10,
        },
        items = {
            {
                name = "bread",
                amount = 1,
            },
            {
                name = "phone",
                amount = math.random(5, 10),
            },
        },
    },
}



Config.serverNotify = function (source,msg) 
    TriggerClientEvent('esx:showNotification', source, msg)
end

Config.clientNotify = function (msg)
    TriggerEvent('esx:showNotification', msg)
end
