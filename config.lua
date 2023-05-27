Config = {}

Config.General = {

    props = {
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

    searchTime = 3, -- in seconds
    refreshTime = 5, -- in minutes
    maxRange = 2,
    
    rewards = {
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