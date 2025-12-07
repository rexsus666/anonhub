-- ts file was generated at discord.gg/25ms


if game.PlaceId == 121864768012064 then
    local v1 = game:GetService("Players")
    local vu2 = game:GetService("RunService")
    local vu3 = game:GetService("ReplicatedStorage")
    local vu4 = game:GetService("HttpService")
    game:GetService("VirtualUser")
    local vu5 = v1.LocalPlayer
    local v6 = vu3
    vu3.WaitForChild(v6, "Controllers")
    local vu7 = workspace.CurrentCamera
    local vu8 = game:GetService("Players").LocalPlayer.PlayerGui
    game:GetService("VirtualInputManager")
    local vu9 = game:GetService("TeleportService")
    local vu10 = game:GetService("UserInputService")
    game:GetService("TweenService")
    local vu11 = {
        MerchantRoot = vu8.Merchant.Main.Background,
        ItemsFrame = vu8.Merchant.Main.Background.Items.ScrollingFrame,
        RefreshMerchant = vu8.Merchant.Main.Background.RefreshLabel
    }
    local vu13 = (function()
        local v12 = vu3.Packages._Index["sleitnick_net@0.2.0"].net
        return {
            RE_FishCaught = v12:WaitForChild("RE/FishCaught"),
            RE_Fishing = v12:WaitForChild("RE/FishingCompleted"),
            RE_FishingStopped = v12:WaitForChild("RE/FishingStopped"),
            RF_Charge = v12:WaitForChild("RF/ChargeFishingRod"),
            RF_Minigame = v12:WaitForChild("RF/RequestFishingMinigameStarted"),
            RF_Cancel = v12:WaitForChild("RF/CancelFishingInputs"),
            RF_Sell = v12:WaitForChild("RF/SellAllItems"),
            RF_Weather = v12:WaitForChild("RF/PurchaseWeatherEvent"),
            RF_Radar = v12:WaitForChild("RF/UpdateFishingRadar"),
            RF_EquipDiving = v12:WaitForChild("RF/EquipOxygenTank"),
            RF_UnequipDiving = v12:WaitForChild("RF/UnequipOxygenTank"),
            RF_PurchaseRod = v12:WaitForChild("RF/PurchaseFishingRod"),
            RF_PurchaseBait = v12:WaitForChild("RF/PurchaseBait"),
            RF_PurchaseBoat = v12:WaitForChild("RF/PurchaseBoat"),
            RE_Cutscene = v12:WaitForChild("RE/ReplicateCutscene"),
            RE_StopCutscene = v12:WaitForChild("RE/StopCutscene"),
            RF_AutoFishing = v12:WaitForChild("RF/UpdateAutoFishingState"),
            RE_EquipItem = v12:WaitForChild("RE/EquipItem"),
            RE_Altar = v12:WaitForChild("RE/ActivateEnchantingAltar"),
            RE_Altar2 = v12:WaitForChild("RE/ActivateSecondEnchantingAltar"),
            RE_Equip = v12:WaitForChild("RE/EquipToolFromHotbar"),
            RE_Unequip = v12:WaitForChild("RE/UnequipToolFromHotbar"),
            RE_Favorite = v12:WaitForChild("RE/FavoriteItem"),
            RE_FavoriteChanged = v12:WaitForChild("RE/FavoriteStateChanged"),
            RE_ReplicateTextEffect = v12:WaitForChild("RE/ReplicateTextEffect"),
            RE_ObtainedNewFishNotification = v12:WaitForChild("RE/ObtainedNewFishNotification"),
            RE_FishingMinigameEvent = v12:WaitForChild("RE/FishingMinigameChanged"),
            RF_Trade = v12:WaitForChild("RF/InitiateTrade"),
            Totem = v12:WaitForChild("RE/SpawnTotem")
        }
    end)()
    local vu14 = require(vu3.Packages.Replion)
    local vu15 = require(vu3.Controllers.FishingController)
    require(vu3.Controllers.ItemTradingController)
    local vu16 = require(vu3.Shared.ItemUtility)
    require(vu3.Shared.VendorUtility)
    require(vu3.Shared.PlayerStatsUtility)
    local v17 = require(vu3.Modules.InputControl)
    local vu18 = vu14.Client:WaitReplion("Data")
    local v19 = vu3
    local vu20 = vu3.WaitForChild(v19, "Items")
    local vu21 = vu16.GetItemDataFromItemType("Gears", "Diving Gear")
    local vu22 = {}
    local vu23 = {}
    local vu24 = nil
    local vu25 = false
    local vu26 = false
    local vu27 = false
    local vu28 = {}
    local vu29 = false
    local vu30 = nil
    local vu31 = false
    local vu32 = false
    local vu33 = 0.2
    local vu34 = false
    local vu35 = 1.9
    local vu36 = 1.1
    local vu37 = false
    local vu38 = true
    local vu39 = 0.1
    local vu40 = 0
    local vu41 = nil
    local v42 = nil
    local function vu44()
        local v43 = game.Players.LocalPlayer.PlayerGui:WaitForChild("Inventory"):WaitForChild("Main"):WaitForChild("Top"):WaitForChild("Options"):WaitForChild("Fish"):WaitForChild("Label"):WaitForChild("BagSize")
        return tonumber((v43.Text or "0/???"):match("(%d+)/")) or 0
    end
    local vu45 = 0.15
    local vu46 = false
    local vu47 = false
    local vu48 = false
    local vu49 = 1
    local vu50 = 1
    tonumber(AutoSellValue)
    local vu51 = SellMode or "Delay"
    local _ = lastSellTick
    local vu52 = {}
    local vu53 = false
    local vu54 = {}
    local vu55 = {}
    local function vu57(p56)
        if p56 >= 1000000 then
            return string.format("%.1fM", p56 / 1000000)
        elseif p56 >= 1000 then
            return string.format("%.0fK", p56 / 1000)
        else
            return tostring(p56)
        end
    end
    local function v67(p58, p59)
        local v60, v61, v62 = pairs(p58)
        local v63 = {}
        local v64 = {}
        while true do
            local v65
            v62, v65 = v60(v61, v62)
            if v62 == nil then
                break
            end
            local v66 = string.format("%s (%s)", v62, vu57(v65.Price))
            table.insert(v63, v66)
            v64[v66] = v65.Id
        end
        table.sort(v63)
        vu54[p59] = v63
        vu55[p59] = v64
    end
    v67({
        ["Chrome Rod"] = {
            Id = 7,
            Price = 43700
        },
        ["Lucky Rod"] = {
            Id = 4,
            Price = 15000
        },
        ["Magma Rod"] = {
            Id = 3,
            Price = 0
        },
        ["Starter Rod"] = {
            Id = 1,
            Price = 50
        },
        ["Steampunk Rod"] = {
            Id = 6,
            Price = 215000
        },
        ["Hyper Rod"] = {
            Id = 9,
            Price = 0
        },
        ["Gold Rod"] = {
            Id = 8,
            Price = 0
        },
        ["Lava Rod"] = {
            Id = 2,
            Price = 0
        },
        ["Carbon Rod"] = {
            Id = 76,
            Price = 750
        },
        ["Gingerbread Rod"] = {
            Id = 103,
            Price = 0
        },
        ["Ice Rod"] = {
            Id = 78,
            Price = 5000
        },
        ["Luck Rod"] = {
            Id = 79,
            Price = 325
        },
        ["Midnight Rod"] = {
            Id = 80,
            Price = 50000
        },
        ["Toy Rod"] = {
            Id = 84,
            Price = 0
        },
        ["Grass Rod"] = {
            Id = 85,
            Price = 1500
        },
        ["Candy Cane Rod"] = {
            Id = 100,
            Price = 0
        },
        ["Christmas Tree Rod"] = {
            Id = 101,
            Price = 0
        },
        ["Demascus Rod"] = {
            Id = 77,
            Price = 3000
        },
        ["Frozen Rod"] = {
            Id = 102,
            Price = 0
        },
        ["Cute Rod"] = {
            Id = 123,
            Price = 0
        },
        ["Angelic Rod"] = {
            Id = 124,
            Price = 75000
        },
        ["Astral Rod"] = {
            Id = 5,
            Price = 1000000
        },
        ["Ares Rod"] = {
            Id = 126,
            Price = 3000000
        },
        ["Ghoul Rod"] = {
            Id = 129,
            Price = 0
        },
        ["Angler Rod"] = {
            Id = 168,
            Price = 8000000
        },
        ["Ghostfinn Rod"] = {
            Id = 169,
            Price = 0
        },
        ["Element Rod"] = {
            Id = 257,
            Price = 0
        },
        ["Hazmat Rod"] = {
            Id = 256,
            Price = 0
        },
        ["Fluorescent Rod"] = {
            Id = 255,
            Price = 715000
        },
        ["Bamboo Rod"] = {
            Id = 258,
            Price = 12000000
        },
        ["Studded Rod"] = {
            Id = 400,
            Price = 0
        }
    }, "Rod")
    v67({
        ["Starter Bait"] = {
            Id = 1,
            Price = 0
        },
        ["Chroma Bait"] = {
            Id = 6,
            Price = 290000
        },
        ["Gold Bait"] = {
            Id = 4,
            Price = 0
        },
        ["Hyper Bait"] = {
            Id = 5,
            Price = 0
        },
        ["Luck Bait"] = {
            Id = 2,
            Price = 1000
        },
        ["Midnight Bait"] = {
            Id = 3,
            Price = 3000
        },
        ["Bag-O-Gold Bait"] = {
            Id = 7,
            Price = 0
        },
        ["Beach Ball Bait"] = {
            Id = 9,
            Price = 0
        },
        ["Topwater Bait"] = {
            Id = 10,
            Price = 100
        },
        ["Anchor Bait"] = {
            Id = 11,
            Price = 0
        },
        ["Ornament Bait"] = {
            Id = 12,
            Price = 0
        },
        ["Jolly Bait"] = {
            Id = 13,
            Price = 0
        },
        ["Frozen Bait"] = {
            Id = 14,
            Price = 0
        },
        ["Dark Matter Bait"] = {
            Id = 8,
            Price = 630000
        },
        ["Nature Bait"] = {
            Id = 17,
            Price = 83500
        },
        ["Aether Bait"] = {
            Id = 16,
            Price = 3700000
        },
        ["Corrupt Bait"] = {
            Id = 15,
            Price = 1148484
        },
        ["Singularity Bait"] = {
            Id = 18,
            Price = 0
        },
        ["Royal Bait"] = {
            Id = 19,
            Price = 0
        },
        ["Floral Bait"] = {
            Id = 20,
            Price = 4000000
        },
        ["Radioactive Bait"] = {
            Id = 21,
            Price = 0
        },
        ["Root Bait"] = {
            Id = 22,
            Price = 0
        },
        ["Delayed Orb Bait"] = {
            Id = 23,
            Price = 0
        },
        ["Pumpkin Bait"] = {
            Id = 24,
            Price = 0
        },
        ["Purple Moon Bait"] = {
            Id = 25,
            Price = 0
        },
        ["Corruption Crystal"] = {
            Id = 27,
            Price = 0
        },
        ["Matrix Hologram"] = {
            Id = 26,
            Price = 0
        },
        ["Binary Crystal"] = {
            Id = 28,
            Price = 0
        },
        ["Wyvern Artifact"] = {
            Id = 29,
            Price = 0
        }
    }, "Bait")
    v67({
        ["Small Boat"] = {
            Id = 1,
            Price = 300
        },
        Kayak = {
            Id = 2,
            Price = 1100
        },
        Jetski = {
            Id = 3,
            Price = 7500
        },
        ["Highfield Boat"] = {
            Id = 4,
            Price = 25000
        },
        ["Speed Boat"] = {
            Id = 5,
            Price = 70000
        },
        ["Fishing Boat"] = {
            Id = 6,
            Price = 180000
        },
        ["Mini Yacht"] = {
            Id = 14,
            Price = 1200000
        }
    }, "Boat")
    local vu68 = nil
    local vu69 = nil
    local vu70 = nil
    local vu71 = nil
    local vu72 = nil
    local vu73 = {}
    game.Players.PlayerAdded:Connect(function(p74)
        table.insert(vu73, p74.Name)
    end)
    game.Players.PlayerRemoving:Connect(function(p75)
        local v76, v77, v78 = ipairs(vu73)
        while true do
            local v79
            v78, v79 = v76(v77, v78)
            if v78 == nil then
                break
            end
            if v79 == p75.Name then
                table.remove(vu73, v78)
                break
            end
        end
    end)
    local function vu80()
        return vu73
    end
    local v81, v82, v83 = pairs(game.Players:GetPlayers())
    local vu84 = vu3
    local v85 = vu54
    local v86 = vu73
    while true do
        local v87
        v83, v87 = v81(v82, v83)
        if v83 == nil then
            break
        end
        table.insert(v86, v87.Name)
    end
    local vu88 = {
        ["Ancient Jungle"] = Vector3.new(1272.5, 7.8, - 191.5),
        ["Ancient Jungle Outside"] = Vector3.new(1488, 7.6, - 392),
        ["Ancient Ruin"] = Vector3.new(6090, - 585.9, 4634),
        ["Classic Event"] = Vector3.new(1173, 4, 2839),
        ["Classic Event River"] = Vector3.new(1439, 46, 2779),
        ["Coral Reefs SPOT 1"] = Vector3.new(- 3031.9, 2.5, 2276.4),
        ["Coral Reefs SPOT 2"] = Vector3.new(- 3270.9, 2.5, 2228.1),
        ["Coral Reefs SPOT 3"] = Vector3.new(- 3136.1, 2.6, 2126.1),
        ["Creater Island Grounds"] = Vector3.new(1079.6, 3.6, 5080.4),
        ["Creater Island Top"] = Vector3.new(1011.3, 22.7, 5076.3),
        ["Crystaline Pessage"] = Vector3.new(6051, - 538.9, 4386),
        ["Esotoric Deep"] = Vector3.new(3181, - 1302.7, 1425),
        ["Fishermand Island"] = Vector3.new(33, 3.3, 2764),
        ["Iron Cafe"] = Vector3.new(- 8642, - 547.5, 162),
        ["Iron Cavern Left"] = Vector3.new(- 8795, - 585, 89),
        ["Iron Cavern Right"] = Vector3.new(- 8792, - 585, 223),
        Kohana = Vector3.new(- 684.1, 3, 800.8),
        ["Kohana SPOT 1"] = Vector3.new(- 367.8, 6.8, 521.9),
        ["Kohana SPOT 2"] = Vector3.new(- 624, 19.3, 419.4),
        ["Kohana Volcano"] = Vector3.new(- 561.8, 21.2, 156.7),
        ["Lost Shore"] = Vector3.new(- 3738, 5.4, - 854.7),
        ["Sacred Temple"] = Vector3.new(1475, - 21.9, - 632),
        ["Sisyphus Statue"] = Vector3.new(- 3703.7, - 135.6, - 1017.2),
        ["Stingray Shores"] = Vector3.new(32.5, 24.8, 3039.4),
        ["Treasure Room"] = Vector3.new(- 3602, - 266.6, - 1577.2),
        ["Tropical Grove"] = Vector3.new(- 2018.9, 9, 3750.6),
        ["Tropical Grove Cafe 1"] = Vector3.new(- 2151, 2.5, 3671),
        ["Tropical Grove Cafe 2"] = Vector3.new(- 2018, 4.5, 3756),
        ["Tropical Grove Highground"] = Vector3.new(- 2139, 53.5, 3624),
        ["Underground Cellar"] = Vector3.new(2136, - 91.2, - 699),
        ["Weather Machine"] = Vector3.new(- 1524.9, 2.9, 1915.6)
    }
    local v89 = {
        "Ancient Jungle",
        "Ancient Jungle Outside",
        "Ancient Ruin",
        "Classic Event",
        "Classic Event River",
        "Coral Reefs SPOT 1",
        "Coral Reefs SPOT 2",
        "Coral Reefs SPOT 3",
        "Creater Island Grounds",
        "Creater Island Top",
        "Crystaline Pessage",
        "Esotoric Deep",
        "Fishermand Island",
        "Iron Cafe",
        "Iron Cavern Left",
        "Iron Cavern Right",
        "Kohana",
        "Kohana SPOT 1",
        "Kohana SPOT 2",
        "Kohana Volcano",
        "Lost Shore",
        "Sacred Temple",
        "Sisyphus Statue",
        "Stingray Shores",
        "Treasure Room",
        "Tropical Grove",
        "Tropical Grove Cafe 1",
        "Tropical Grove Cafe 2",
        "Tropical Grove Highground",
        "Underground Cellar",
        "Weather Machine"
    }
    local vu90 = {}
    local vu91 = {
        Enabled = false,
        URL = ""
    }
    local vu92 = false
    local vu93 = {}
    local vu94 = {}
    local vu95 = ""
    local vu96 = {}
    local vu97 = {
        "Common",
        "Uncommon",
        "Rare",
        "Epic",
        "Legendary",
        "Mythic",
        "Secret"
    }
    local function v105()
        if vu20 then
            local v98 = vu20
            local v99, v100, v101 = ipairs(v98:GetChildren())
            while true do
                local v102
                v101, v102 = v99(v100, v101)
                if v101 == nil then
                    break
                end
                if v102:IsA("ModuleScript") then
                    local v103, v104 = pcall(require, v102)
                    if v103 and (v104 and (v104.Data and v104.Data.Type == "Fish")) then
                        vu90[v104.Data.Id] = {
                            Name = v104.Data.Name,
                            Tier = v104.Data.Tier,
                            Icon = v104.Data.Icon,
                            SellPrice = v104.SellPrice
                        }
                    end
                end
            end
        end
    end
    local function vu112(p106)
        local v107 = p106:match("rbxassetid://(%d+)")
        if not v107 then
            return nil
        end
        local vu108 = string.format("https://thumbnails.roblox.com/v1/assets?assetIds=%s&type=Asset&size=420x420&format=Png", v107)
        local v109, v110 = pcall(function()
            return vu4:JSONDecode(game:HttpGet(vu108))
        end)
        local v111 = v109 and (v110 and (v110.data and v110.data[1]))
        if v111 then
            v111 = v110.data[1].imageUrl
        end
        return v111
    end
    local function vu115(p113)
        local v114 = syn and syn.request or (http_request or http and http.request or (fluxus and fluxus.request or request))
        if v114 then
            return v114(p113)
        end
        warn("Executor kamu tidak support http request")
        return nil
    end
    local function vu120(pu116, pu117)
        if pu116 and pu116 ~= "" then
            if not vu96[pu116] then
                vu96[pu116] = true
                task.delay(0.25, function()
                    vu96[pu116] = nil
                end)
                pcall(function()
                    local v118 = vu115
                    local v119 = {
                        Url = pu116,
                        Method = "POST",
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = vu4:JSONEncode(pu117)
                    }
                    v118(v119)
                end)
            end
        else
            return
        end
    end
    local function vu128(p121)
        if vu91.Enabled then
            local v122 = vu91.URL
            if v122 and v122:match("discord.com/api/webhooks") then
                local v123 = vu90[p121.Id]
                if v123 then
                    local v124 = vu97[v123.Tier] or "Unknown"
                    if # vu93 <= 0 or table.find(vu93, v124) then
                        if # vu94 <= 0 or table.find(vu94, v123.Name) then
                            local v125 = p121.Metadata and p121.Metadata.Weight and (string.format("%.2f Kg", p121.Metadata.Weight) or "N/A") or "N/A"
                            local v126 = p121.Metadata and (p121.Metadata.VariantId and tostring(p121.Metadata.VariantId)) or "None"
                            local v127 = v123.SellPrice and ("$" .. string.format("%d", v123.SellPrice):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") or "N/A") or "N/A"
                            vu120(v122, {
                                username = "AnonHub Notification!",
                                avatar_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Anonymous_emblem.svg/2048px-Anonymous_emblem.svg.png",
                                embeds = {
                                    {
                                        description = string.format("Congratulations **%s**! You just caught a **%s** fish!", vu95 ~= "" and vu95 or vu5.Name, v124),
                                        color = 16738740,
                                        author = {
                                            name = "AnonHub Webhook | Fish Caught"
                                        },
                                        image = {
                                            url = vu112(v123.Icon) or "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Anonymous_emblem.svg/2048px-Anonymous_emblem.svg.png"
                                        },
                                        fields = {
                                            {
                                                name = "\239\191\189\239\191\189\239\191\189 Fish Name",
                                                value = "```\226\157\175 " .. v123.Name .. "```"
                                            },
                                            {
                                                name = "\239\191\189\239\191\189\239\191\189 Tier",
                                                value = "```\226\157\175 " .. v124 .. "```"
                                            },
                                            {
                                                name = "\239\191\189\239\191\189\239\191\189 Weight",
                                                value = "```\226\157\175 " .. v125 .. "```"
                                            },
                                            {
                                                name = "\239\191\189\239\191\189\239\191\189 Mutation",
                                                value = "```\226\157\175 " .. v126 .. "```"
                                            },
                                            {
                                                name = "\239\191\189\239\191\189\239\191\189 Sell Price",
                                                value = "```\226\157\175 " .. v127 .. "```"
                                            },
                                            {
                                                name = "\239\191\189\239\191\189\239\191\189 Caught At",
                                                value = "```\226\157\175 " .. os.date("%Y-%m-%d %H:%M:%S") .. "```"
                                            }
                                        },
                                        footer = {
                                            text = "Powered by AnonHub",
                                            icon_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Anonymous_emblem.svg/2048px-Anonymous_emblem.svg.png"
                                        },
                                        timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
                                    }
                                }
                            })
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    end
    v105()
    local v129, v130, v131 = pairs(vu90)
    local vu132 = vu97
    local vu133 = vu93
    local vu134 = vu95
    local vu135 = vu91
    local vu136 = vu94
    local vu137 = {}
    while true do
        local v138
        v131, v138 = v129(v130, v131)
        if v131 == nil then
            break
        end
        table.insert(vu137, v138.Name)
    end
    table.sort(vu137)
    task.spawn(function()
        repeat
            task.wait(1)
        until vu13.RE_ObtainedNewFishNotification
        if not FishWebhookConnected then
            FishWebhookConnected = true
            vu13.RE_ObtainedNewFishNotification.OnClientEvent:Connect(function(p139, p140)
                if vu92 then
                    vu128({
                        Id = p139,
                        Metadata = p140
                    })
                end
            end)
        end
    end)
    local v141 = getconnections or get_signal_cons
    if v141 then
        local v142, v143, v144 = pairs(v141(vu5.Idled))
        while true do
            local v145, v146 = v142(v143, v144)
            if v145 == nil then
                break
            end
            v144 = v145
            if v146.Disable then
                v146:Disable()
            elseif v146.Disconnect then
                v146:Disconnect()
            end
        end
    end
    local vu147 = cloneref and cloneref(game:GetService("VirtualUser")) or game:GetService("VirtualUser")
    vu5.Idled:Connect(function()
        vu147:CaptureController()
        vu147:ClickButton2(Vector2.new())
    end)
    local vu148 = false
    local vu149 = {}
    local vu150 = nil
    local vu151 = nil
    local vu152 = {
        Cloudy = true,
        Day = true,
        ["Increased Luck"] = true,
        Mutated = true,
        Night = true,
        Snow = true,
        ["Sparkling Cove"] = true,
        Storm = true,
        Wind = true,
        UIListLayout = true,
        ["Admin - Shocked"] = true,
        ["Admin - Super Mutated"] = true,
        Radiant = true
    }
    offs = {
        ["Worm Hunt"] = 25
    }
    local function vu154(p153)
        if p153 then
            p153 = p153:FindFirstChild("HumanoidRootPart") or p153:FindFirstChildWhichIsA("BasePart")
        end
        return p153
    end
    local _ = nil
    local _ = nil
    local function v163()
        local v155 = {}
        local v156 = vu5:WaitForChild("PlayerGui"):FindFirstChild("Events")
        if v156 and v156:FindFirstChild("Frame") then
            local v157 = v156.Frame:FindFirstChild("Events")
            if v157 then
                local v158, v159, v160 = ipairs(v157:GetChildren())
                while true do
                    local v161
                    v160, v161 = v158(v159, v160)
                    if v160 == nil then
                        break
                    end
                    local v162 = v161:FindFirstChild("DisplayName") and v161.DisplayName.Text or v161.Name
                    if type(v162) == "string" and (v162 ~= "" and not vu152[v162]) then
                        table.insert(v155, (v162:gsub("^Admin %- ", "")))
                    end
                end
            end
        end
        return v155
    end
    local function vu191(p164)
        if p164 then
            if p164 == "Megalodon Hunt" then
                local v165 = workspace:FindFirstChild("!!! MENU RINGS")
                if v165 then
                    local v166, v167, v168 = ipairs(v165:GetChildren())
                    while true do
                        local v169
                        v168, v169 = v166(v167, v168)
                        if v168 == nil then
                            break
                        end
                        local v170 = v169:FindFirstChild("Megalodon Hunt")
                        if v170 then
                            v170 = v170:FindFirstChild("Megalodon Hunt")
                        end
                        if v170 and v170:IsA("BasePart") then
                            return v170
                        end
                    end
                end
            else
                local v171 = {
                    workspace:FindFirstChild("Props")
                }
                local v172 = workspace:FindFirstChild("!!! MENU RINGS")
                if v172 then
                    local v173, v174, v175 = ipairs(v172:GetChildren())
                    while true do
                        local v176
                        v175, v176 = v173(v174, v175)
                        if v175 == nil then
                            break
                        end
                        if v176.Name:match("^Props") then
                            table.insert(v171, v176)
                        end
                    end
                end
                local v177, v178, v179 = ipairs(v171)
                while true do
                    local v180
                    v179, v180 = v177(v178, v179)
                    if v179 == nil then
                        break
                    end
                    local v181, v182, v183 = ipairs(v180:GetChildren())
                    while true do
                        local v184
                        v183, v184 = v181(v182, v183)
                        if v183 == nil then
                            break
                        end
                        local v185, v186, v187 = ipairs(v184:GetDescendants())
                        while true do
                            local v188
                            v187, v188 = v185(v186, v187)
                            if v187 == nil then
                                break
                            end
                            if v188:IsA("TextLabel") and v188.Name == "DisplayName" and (v188.ContentText ~= "" and v188.ContentText or v188.Text):lower() == p164:lower() then
                                local v189 = v188:FindFirstAncestorOfClass("Model")
                                local v190 = v189 and v189:FindFirstChild("Part") or v184:FindFirstChild("Part")
                                if v190 and v190:IsA("BasePart") then
                                    return v190
                                end
                            end
                        end
                    end
                end
                return
            end
        else
            return
        end
    end
    local vu192 = nil
    local function vu194(p193)
        if vu192 ~= p193 then
            WindUI:Notify({
                Title = p193,
                Duration = 2.5
            })
            vu192 = p193
        end
    end
    function EventLoop()
        while vu148 do
            local v195, v196
            if vu149 then
                v195 = vu191(vu149)
                v196 = v195 and vu149
                if not v196 then
                    v196 = nil
                end
            else
                v195 = nil
                v196 = nil
            end
            local v197 = vu154(vu5.Character)
            if v195 and v197 then
                if not vu151 then
                    vu151 = v197.CFrame
                end
                if (v197.Position - v195.Position).Magnitude > 40 then
                    vu150 = v195.CFrame + Vector3.new(0, offs[v196] or 7, 0)
                    vu5.Character:PivotTo(vu150)
                    task.wait(1)
                    vu194("Event! " .. v196)
                end
            else
                if vu151 and (v197 and vu150) then
                    vu5.Character:PivotTo(vu151)
                end
                vu150 = nil
                vu151 = nil
                vu194("Idle")
            end
            task.wait(0.2)
        end
        if vu151 and vu5.Character then
            vu5.Character:PivotTo(vu151)
        end
        vu194("Auto Event off")
        vu151 = nil
        vu150 = nil
    end
    vu5.CharacterAdded:Connect(function(pu198)
        if vu148 then
            task.spawn(function()
                local v199 = pu198:WaitForChild("HumanoidRootPart", 5)
                task.wait(0.3)
                if v199 then
                    if vu150 then
                        pu198:PivotTo(vu150)
                        task.wait(0.5)
                    elseif vu151 then
                        pu198:PivotTo(vu151)
                    end
                end
            end)
        end
    end)
    local v200 = {
        "Galaxy",
        "Corrupt",
        "Gemstone",
        "Ghost",
        "Lightning",
        "Fairy Dust",
        "Gold",
        "Midnight",
        "Radioactive",
        "Stone",
        "Holographic",
        "Albino",
        "Bloodmoon",
        "Sandy",
        "Acidic",
        "Color Burn",
        "Festive",
        "Frozen"
    }
    function toSet(p201)
        local v202 = {}
        if type(p201) == "table" then
            local v203, v204, v205 = ipairs(p201)
            while true do
                local v206
                v205, v206 = v203(v204, v205)
                if v205 == nil then
                    break
                end
                v202[v206] = true
            end
            local v207, v208, v209 = pairs(p201)
            while true do
                local v210
                v209, v210 = v207(v208, v209)
                if v209 == nil then
                    break
                end
                if v210 then
                    v202[v209] = true
                end
            end
        end
        return v202
    end
    local vu211 = {
        auto = false,
        name = {},
        rarity = {},
        variant = {}
    }
    local vu212 = {}
    vu13.RE_FavoriteChanged.OnClientEvent:Connect(function(p213, p214)
        rawset(vu212, p213, p214)
    end)
    function checkAndFavorite(p215)
        if vu211.auto then
            local v216 = vu16.GetItemDataFromItemType("Items", p215.Id)
            if v216 and v216.Data.Type == "Fish" then
                local v217 = vu132[v216.Data.Tier]
                local v218 = v216.Data.Name
                local v219 = p215.Metadata and (p215.Metadata.VariantId or "None") or "None"
                local v220 = vu211.name[v218]
                local v221 = vu211.rarity[v217]
                local v222 = vu211.variant[v219]
                local v223 = rawget(vu212, p215.UUID)
                if v223 == nil then
                    v223 = p215.Favorited
                end
                if next(vu211.variant) == nil or next(vu211.name) == nil then
                    v222 = v220 or v221
                elseif not v220 then
                    v222 = v220
                end
                if v222 and not v223 then
                    vu13.RE_Favorite:FireServer(p215.UUID)
                    rawset(vu212, p215.UUID, true)
                end
            end
        else
            return
        end
    end
    function scanInventory()
        if vu211.auto then
            local v224 = vu18
            local v225, v226, v227 = ipairs(v224:GetExpect({
                "Inventory",
                "Items"
            }))
            while true do
                local v228
                v227, v228 = v225(v226, v227)
                if v227 == nil then
                    break
                end
                checkAndFavorite(v228)
            end
        end
    end
    local vu229 = loadstring(game:HttpGet("https://raw.githubusercontent.com/rexsus666/anonhub/refs/heads/main/theme.lua"))()
    local v230 = vu229
    local vu231 = vu229.CreateWindow(v230, {
        Title = "AnonHub - Fish It",
        Icon = "rbxassetid://78018573702743",
        Author = "Freemium",
        Folder = "anonhub",
        Size = UDim2.fromOffset(600, 410),
        MinSize = Vector2.new(560, 350),
        MaxSize = Vector2.new(850, 560),
        Transparent = true,
        Theme = "Dark",
        Resizable = true,
        SideBarWidth = 175,
        BackgroundImageTransparency = 0.42,
        HideSearchBar = false,
        ScrollBarEnabled = true
    })
    local v232 = vu231
    vu231.Tag(v232, {
        Title = "v1.0.2",
        Icon = "triangle-alert",
        Color = Color3.fromHex("#fbbc47"),
        Radius = 12
    })
    local v233 = vu231
    vu231.EditOpenButton(v233, {
        Title = "Open Example UI",
        OnlyMobile = false,
        Enabled = false,
        Draggable = false
    })
    local v234 = vu229
    vu229.AddTheme(v234, {
        Name = "Dark Theme",
        Accent = Color3.fromHex("#1c1c1e"),
        Background = Color3.fromHex("#121212"),
        Outline = Color3.fromHex("#2c2c2c"),
        Text = Color3.fromHex("#e0e0e0"),
        Placeholder = Color3.fromHex("#7a7a7a"),
        Button = Color3.fromHex("#2fac7c"),
        Icon = Color3.fromHex("#c1c1c1")
    })
    local v235 = vu229
    vu229.AddTheme(v235, {
        Name = "BlueDark Theme",
        Accent = Color3.fromHex("#1abc9c"),
        Background = Color3.fromHex("#2d355e"),
        Outline = Color3.fromHex("#c0c0c0"),
        Text = Color3.fromHex("#ffffff"),
        Placeholder = Color3.fromHex("#7a7a7a"),
        Button = Color3.fromHex("#2fac7c"),
        Icon = Color3.fromHex("#bebebe")
    })
    local v236 = vu229
    vu229.AddTheme(v236, {
        Name = "Light Theme",
        Accent = Color3.fromHex("#1abc9c"),
        Background = Color3.fromHex("#e5e5e5"),
        Outline = Color3.fromHex("#c0c0c0"),
        Text = Color3.fromHex("#2c2c2c"),
        Placeholder = Color3.fromHex("#7a7a7a"),
        Button = Color3.fromHex("#2fac7c"),
        Icon = Color3.fromHex("#e91e63")
    })
    local vu237 = vu231.ConfigManager:CreateConfig("MengXHubConfig");
    ({
        ToggleUI = function(_)
            local v238 = Instance.new("ScreenGui")
            v238.Parent = game:GetService("CoreGui")
            v238.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            v238.Name = "ToggleUIButton"
            local vu239 = Instance.new("ImageLabel")
            vu239.Parent = v238
            vu239.Size = UDim2.new(0, 40, 0, 40)
            vu239.Position = UDim2.new(0, 20, 0, 100)
            vu239.BackgroundTransparency = 1
            vu239.Image = "rbxassetid://78018573702743"
            vu239.ScaleType = Enum.ScaleType.Fit
            local v240 = Instance.new("UICorner")
            v240.CornerRadius = UDim.new(0, 6)
            v240.Parent = vu239
            local v241 = Instance.new("TextButton")
            v241.Parent = vu239
            v241.Size = UDim2.new(1, 0, 1, 0)
            v241.BackgroundTransparency = 1
            v241.Text = ""
            v241.MouseButton1Click:Connect(function()
                vu231:Toggle()
            end)
            local vu242 = false
            local vu243 = nil
            local vu244 = nil
            local function vu247(p245)
                local v246 = p245.Position - vu243
                vu239.Position = UDim2.new(vu244.X.Scale, vu244.X.Offset + v246.X, vu244.Y.Scale, vu244.Y.Offset + v246.Y)
            end
            v241.InputBegan:Connect(function(pu248)
                if pu248.UserInputType == Enum.UserInputType.MouseButton1 or pu248.UserInputType == Enum.UserInputType.Touch then
                    vu242 = true
                    vu243 = pu248.Position
                    vu244 = vu239.Position
                    pu248.Changed:Connect(function()
                        if pu248.UserInputState == Enum.UserInputState.End then
                            vu242 = false
                        end
                    end)
                end
            end)
            game:GetService("UserInputService").InputChanged:Connect(function(p249)
                if vu242 and (p249.UserInputType == Enum.UserInputType.MouseMovement or p249.UserInputType == Enum.UserInputType.Touch) then
                    vu247(p249)
                end
            end)
        end
    }):ToggleUI()
    local v250 = vu231
    vu231.SetToggleKey(v250, Enum.KeyCode.F3)
    local v251 = vu231
    vu231.IsResizable(v251, true)
    local v252 = vu231
    InfoTab = vu231.Tab(v252, {
        Title = "Info",
        Icon = "info"
    })
    local v253 = vu231
    PlayerTab = vu231.Tab(v253, {
        Title = "Player",
        Icon = "users"
    })
    local v254 = vu231
    FishingTab = vu231.Tab(v254, {
        Title = "Fishing",
        Icon = "rbxassetid://103247953194129"
    })
    local v255 = vu231
    AutomaticTab = vu231.Tab(v255, {
        Title = "Automatic",
        Icon = "rbxassetid://12662718374"
    })
    local v256 = vu231
    WebhookTab = vu231.Tab(v256, {
        Title = "Weebhook",
        Icon = "rbxassetid://137601480983962"
    })
    local v257 = vu231
    QuestTab = vu231.Tab(v257, {
        Title = "Quest",
        Icon = "rbxassetid://114127804740858"
    })
    local v258 = vu231
    UtilitiesTab = vu231.Tab(v258, {
        Title = "Utilities",
        Icon = "box"
    })
    local v259 = vu231
    ShopTab = vu231.Tab(v259, {
        Title = "Shop",
        Icon = "shopping-cart"
    })
    local v260 = vu231
    TeleportTab = vu231.Tab(v260, {
        Title = "Teleport",
        Icon = "map"
    })
    InfoTab:Paragraph({
        Title = "AnonHub Alert!",
        Desc = "This script is still under development!\nThere is a possibility it may get detected if used in public servers!\nIf you have suggestions or found bugs, please report them to <font color=\"#00AAFF\">Discord AnonHub</font>!\n<b>Use at your own risk!</b>",
        Color = "Green",
        Image = "rbxassetid://17313330026",
        ImageSize = 30
    })
    InfoTab:Button({
        Title = "Need Help?",
        Desc = "Click This To Copy Discord Link.\nJoin to <font color=\"#FF90E3\">Discord AnonHub</font>!",
        Callback = function()
            if setclipboard then
                setclipboard("discord.gg/#")
                vu229:Notify({
                    Title = "Success",
                    Content = "Link Discord berhasil disalin ke clipboard!",
                    Duration = 3,
                    Icon = "laptop-minimal-check"
                })
            else
                vu229:Notify({
                    Title = "Error",
                    Content = "Executor tidak support salin clipboard!",
                    Duration = 3,
                    Icon = "circle-x"
                })
            end
        end
    })
    InfoTab:Space()
    local function vu261()
        if vu5 then
            vu9:Teleport(game.PlaceId, vu5)
        end
    end
    local function vu272()
        local v262 = game.PlaceId
        local v263 = nil
        local v264 = {}
        while true do
            local vu265 = "https://games.roblox.com/v1/games/" .. v262 .. "/servers/Public?sortOrder=Asc&limit=100"
            if v263 then
                vu265 = vu265 .. "&cursor=" .. v263
            end
            local v266, v267 = pcall(function()
                return vu4:JSONDecode(game:HttpGet(vu265))
            end)
            if not (v266 and (v267 and v267.data)) then
                break
            end
            local v268, v269, v270 = pairs(v267.data)
            while true do
                local v271
                v270, v271 = v268(v269, v270)
                if v270 == nil then
                    break
                end
                if v271.playing < v271.maxPlayers and v271.id ~= game.JobId then
                    table.insert(v264, v271.id)
                end
            end
            v263 = v267.nextPageCursor
            if not v263 then
                break
            end
        end
        if # v264 <= 0 then
            vu229:Notify({
                Title = "Error",
                Content = "No servers available or all are full",
                Duration = 2.5,
                Icon = "circle-x"
            })
        else
            vu9:TeleportToPlaceInstance(v262, v264[math.random(1, # v264)], vu5)
        end
    end
    InfoTab:Button({
        Title = "Rejoin Server",
        Callback = function()
            vu261()
        end
    })
    InfoTab:Button({
        Title = "Server Hop",
        Desc = "Join a new server",
        Callback = function()
            vu272()
        end
    })
    InfoTab:Select()
    InterfaceSection = PlayerTab:Section({
        Title = "User Interface"
    })
    vu237:Register("themeDropdown", (InterfaceSection:Dropdown({
        Title = "Change Theme UI",
        Values = {
            {
                Title = "Light Theme",
                Icon = "sun",
                Callback = function()
                    vu229:SetTheme("Light Theme")
                end
            },
            {
                Title = "Dark Theme",
                Icon = "moon",
                Callback = function()
                    vu229:SetTheme("Dark Theme")
                end
            },
            {
                Title = "Blue Dark Theme",
                Icon = "moon-star",
                Callback = function()
                    vu229:SetTheme("BlueDark Theme")
                end
            }
        }
    })))
    MovementSection = PlayerTab:Section({
        Title = "Movement"
    })
    local vu274 = MovementSection:Slider({
        Title = "WalkSpeed",
        Desc = "",
        Step = 1,
        Value = {
            Min = 16,
            Max = 200,
            Default = 16
        },
        Callback = function(p273)
            vu5.Character.Humanoid.WalkSpeed = p273
        end
    })
    local vu276 = MovementSection:Slider({
        Title = "JumpPower",
        Desc = "",
        Step = 1,
        Value = {
            Min = 50,
            Max = 500,
            Default = 50
        },
        Callback = function(p275)
            vu5.Character.Humanoid.JumpPower = p275
        end
    })
    MovementSection:Button({
        Title = "Reset Speed And Jump",
        Callback = function()
            vu5.Character.Humanoid.WalkSpeed = 16
            vu5.Character.Humanoid.JumpPower = 50
            vu274:Set(16)
            vu276:Set(50)
            vu229:Notify({
                Title = "Success",
                Content = "Berhasil mereset jump and speed",
                Duration = 2.5,
                Icon = "laptop-minimal-check"
            })
        end
    })
    MovementSection:Divider()
    local vu277 = false
    local vu278 = true
    local vu279 = 1
    local vu280 = nil
    local vu281 = nil
    local function vu283(p282)
        return p282:FindFirstChild("HumanoidRootPart") or (p282:FindFirstChild("Torso") or p282:FindFirstChild("UpperTorso"))
    end
    local function vu291()
        vu277 = false
        local v284 = vu5.Character
        if v284 then
            local v285 = v284:FindFirstChildOfClass("Humanoid")
            if v285 then
                v285.PlatformStand = false
            end
            local v286 = v284:FindFirstChild("HumanoidRootPart")
            if v286 then
                local v287, v288, v289 = pairs(v286:GetChildren())
                while true do
                    local v290
                    v289, v290 = v287(v288, v289)
                    if v289 == nil then
                        break
                    end
                    if v290:IsA("BodyGyro") or v290:IsA("BodyVelocity") then
                        v290:Destroy()
                    end
                end
            end
        end
    end
    local function vu310(pu292)
        local v293 = vu5
        local v294 = v293.Character or v293.CharacterAdded:Wait()
        local vu295 = v294:FindFirstChildOfClass("Humanoid") or v294:WaitForChild("Humanoid")
        local vu296 = vu283(v294)
        local vu297 = {
            F = 0,
            B = 0,
            L = 0,
            R = 0,
            Q = 0,
            E = 0
        }
        local vu298 = {
            F = 0,
            B = 0,
            L = 0,
            R = 0,
            Q = 0,
            E = 0
        }
        local vu299 = 0
        if vu280 then
            vu280:Disconnect()
        end
        if vu281 then
            vu281:Disconnect()
        end
        local function v305()
            vu277 = true
            local vu300 = Instance.new("BodyGyro")
            local vu301 = Instance.new("BodyVelocity")
            vu300.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
            vu300.P = 90000
            local v302 = vu296.CFrame
            local v303 = vu296
            vu301.Parent = vu296
            vu300.Parent = v303
            vu300.CFrame = v302
            vu301.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
            task.spawn(function()
                while true do
                    task.wait()
                    local v304 = workspace.CurrentCamera
                    if not pu292 then
                        vu295.PlatformStand = true
                    end
                    vu299 = (vu297.L + vu297.R ~= 0 or (vu297.F + vu297.B ~= 0 or vu297.Q + vu297.E ~= 0)) and (vu279 * 50 or 0) or 0
                    if vu299 == 0 then
                        vu301.Velocity = Vector3.zero
                    else
                        vu301.Velocity = (v304.CFrame.LookVector * (vu297.F + vu297.B) + (v304.CFrame * CFrame.new(vu297.L + vu297.R, (vu297.F + vu297.B + vu297.Q + vu297.E) * 0.2, 0).p - v304.CFrame.p)) * vu299
                        vu298 = {
                            F = vu297.F,
                            B = vu297.B,
                            L = vu297.L,
                            R = vu297.R
                        }
                    end
                    vu300.CFrame = v304.CFrame
                    if not vu277 then
                        vu300:Destroy()
                        vu301:Destroy()
                        vu295.PlatformStand = false
                        return
                    end
                end
            end)
        end
        vu280 = vu10.InputBegan:Connect(function(p306)
            local v307 = p306.KeyCode
            if v307 ~= Enum.KeyCode.W then
                if v307 ~= Enum.KeyCode.S then
                    if v307 ~= Enum.KeyCode.A then
                        if v307 ~= Enum.KeyCode.D then
                            if v307 ~= Enum.KeyCode.E or not vu278 then
                                if v307 == Enum.KeyCode.Q and vu278 then
                                    vu297.E = - 1
                                end
                            else
                                vu297.Q = 1
                            end
                        else
                            vu297.R = 1
                        end
                    else
                        vu297.L = - 1
                    end
                else
                    vu297.B = - 1
                end
            else
                vu297.F = 1
            end
        end)
        vu281 = vu10.InputEnded:Connect(function(p308)
            local v309 = p308.KeyCode
            if v309 ~= Enum.KeyCode.W then
                if v309 ~= Enum.KeyCode.S then
                    if v309 ~= Enum.KeyCode.A then
                        if v309 ~= Enum.KeyCode.D then
                            if v309 ~= Enum.KeyCode.E then
                                if v309 == Enum.KeyCode.Q then
                                    vu297.E = 0
                                end
                            else
                                vu297.Q = 0
                            end
                        else
                            vu297.R = 0
                        end
                    else
                        vu297.L = 0
                    end
                else
                    vu297.B = 0
                end
            else
                vu297.F = 0
            end
        end)
        v305()
    end
    local function vu321(p311)
        vu277 = true
        local v312 = p311.Character or p311.CharacterAdded:Wait()
        local v313 = v312:WaitForChild("HumanoidRootPart")
        local vu314 = v312:FindFirstChildOfClass("Humanoid")
        local vu315 = workspace.CurrentCamera
        local vu316 = require(p311:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
        local vu317 = Instance.new("BodyVelocity")
        local vu318 = Instance.new("BodyGyro")
        vu317.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
        local v319 = Vector3.new(9000000000, 9000000000, 9000000000)
        vu318.D = 50
        vu318.P = 1000
        vu318.MaxTorque = v319
        vu318.Parent = v313
        vu317.Parent = v313
        vu314.PlatformStand = true
        task.spawn(function()
            while vu277 and task.wait() do
                local v320 = vu316:GetMoveVector()
                vu318.CFrame = vu315.CFrame
                vu317.Velocity = (vu315.CFrame.RightVector * v320.X + vu315.CFrame.LookVector * - v320.Z) * (vu279 * 50)
            end
            vu314.PlatformStand = false
            vu317:Destroy()
            vu318:Destroy()
        end)
    end
    local vu323 = MovementSection:Slider({
        Title = "Fly Speed",
        Step = 1,
        Value = {
            Min = 1,
            Max = 10,
            Default = 1
        },
        Callback = function(p322)
            vu279 = p322
        end
    })
    MovementSection:Toggle({
        Title = "Enable Fly",
        Value = false,
        Callback = function(p324)
            if p324 then
                if vu10.TouchEnabled then
                    vu321(vu5)
                else
                    vu310()
                end
            else
                vu291()
            end
        end
    })
    ModesSection = PlayerTab:Section({
        Title = "Modes"
    })
    local vu332 = ModesSection:Toggle({
        Title = "No Animations",
        Value = false,
        Callback = function(p325)
            local v326 = (vu5.Character or vu5.CharacterAdded:Wait()):WaitForChild("Humanoid"):FindFirstChildOfClass("Animator")
            if v326 then
                if p325 then
                    vu29 = true
                    local v327, v328, v329 = ipairs(v326:GetPlayingAnimationTracks())
                    while true do
                        local v330
                        v329, v330 = v327(v328, v329)
                        if v329 == nil then
                            break
                        end
                        v330:Stop(0)
                    end
                    vu30 = v326.AnimationPlayed:Connect(function(pu331)
                        if vu29 then
                            task.defer(function()
                                pcall(function()
                                    pu331:Stop(0)
                                end)
                            end)
                        end
                    end)
                else
                    vu29 = false
                    if vu30 then
                        vu30:Disconnect()
                        vu30 = nil
                    end
                end
            end
        end
    })
    vu237:Register("noAnimationToggle", vu332)
    ModesSection:Toggle({
        Title = "Hide Rod On Hand",
        Desc = "This feature irivisible! and hide other player too",
        Value = false,
        Callback = function(p333)
            vu31 = p333
            if p333 then
                task.spawn(function()
                    while vu31 do
                        local v334, v335, v336 = ipairs(workspace.Characters:GetChildren())
                        while true do
                            local v337
                            v336, v337 = v334(v335, v336)
                            if v336 == nil then
                                break
                            end
                            local v338 = v337:FindFirstChild("!!!EQUIPPED_TOOL!!!")
                            if v338 then
                                v338:Destroy()
                            end
                        end
                        task.wait(1)
                    end
                end)
            end
        end
    })
    ModesSection:Divider()
    ModesSection:Toggle({
        Title = "Infinite Jump",
        Value = false,
        Callback = function(p339)
            vu46 = p339
        end
    })
    vu10.JumpRequest:Connect(function()
        if vu46 and vu5.Character and vu5.Character:FindFirstChild("Humanoid") then
            vu5.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    ModesSection:Toggle({
        Title = "Noclip",
        Value = false,
        Callback = function(p340)
            vu47 = p340
            if vu47 then
                vu229:Notify({
                    Title = "Success",
                    Content = "Anda mengaktifkan Noclip",
                    Duration = 2.5,
                    Icon = "laptop-minimal-check"
                })
            end
            local v341 = vu5.Character
            if v341 then
                local v342, v343, v344 = pairs(v341:GetDescendants())
                while true do
                    local v345
                    v344, v345 = v342(v343, v344)
                    if v344 == nil then
                        break
                    end
                    if v345:IsA("BasePart") then
                        v345.CanCollide = true
                    end
                end
            end
        end
    })
    vu2.Stepped:Connect(function()
        if vu47 and vu5.Character then
            local v346, v347, v348 = pairs(vu5.Character:GetDescendants())
            while true do
                local v349
                v348, v349 = v346(v347, v348)
                if v348 == nil then
                    break
                end
                if v349:IsA("BasePart") and v349.CanCollide then
                    v349.CanCollide = false
                end
            end
        end
    end)
    function autoPerfection(p350)
        if type(_G.__APRF) == "function" then
            _G.__APRF(p350)
        end
    end
    local vu351 = vu15.RequestChargeFishingRod
    local vu352 = vu15.RequestFishingMinigameClick
    local vu353 = false
    function _G.__APRF(p354)
        vu353 = p354
        if p354 then
            function vu15.RequestChargeFishingRod()
                return nil
            end
            function vu15.RequestFishingMinigameClick()
                return nil
            end
            vu13.RF_AutoFishing:InvokeServer(true)
            print("AutoFishing UI: ON | Auto mechanics: DISABLED ?")
        else
            vu15.RequestChargeFishingRod = vu351
            vu15.RequestFishingMinigameClick = vu352
            vu13.RF_AutoFishing:InvokeServer(false)
            print("AutoFishing UI: OFF | Auto mechanics restored ?")
        end
    end
    function SetWalkOnWater(p355)
        if type(_G.__WALKFN) == "function" then
            _G.__WALKFN(p355)
        end
    end
    local vu356 = false
    local vu357 = nil
    local vu358 = nil
    function _G.__WALKFN(p359)
        vu356 = p359
        if p359 then
            vu357 = Instance.new("Part")
            vu357.Name = "WW_Part"
            vu357.Size = Vector3.new(20, 1, 20)
            vu357.Transparency = 1
            vu357.Anchored = true
            vu357.CanCollide = true
            vu357.Parent = Workspace
            vu358 = vu2.Heartbeat:Connect(function()
                if vu356 and vu357 then
                    local v360 = vu283(vu5.Character)
                    if v360 then
                        vu357.CFrame = CFrame.new(v360.Position.X, - 1.8, v360.Position.Z)
                    end
                else
                    return
                end
            end)
        else
            if vu358 then
                vu358:Disconnect()
                vu358 = nil
            end
            if vu357 then
                vu357:Destroy()
                vu357 = nil
            end
        end
    end
    ModesSection:Toggle({
        Title = "Walk On Water",
        Value = false,
        Callback = function(p361)
            SetWalkOnWater(p361)
        end
    })
    local vu362 = 128
    local vu363 = nil
    ModesSection:Toggle({
        Title = "Max Zoom 1000",
        Desc = "Increase max camera distance",
        Value = false,
        Callback = function(p364)
            if vu363 then
                vu363:Disconnect()
                vu363 = nil
            end
            if p364 then
                vu5.CameraMaxZoomDistance = 1000
                vu5.CameraMinZoomDistance = 0.5
                vu363 = vu5.CharacterAdded:Connect(function()
                    task.wait(0.3)
                    vu5.CameraMaxZoomDistance = 1000
                    vu5.CameraMinZoomDistance = 0.5
                end)
            else
                vu5.CameraMaxZoomDistance = vu362
                vu5.CameraMinZoomDistance = 0.5
            end
        end
    })
    BoostSection = PlayerTab:Section({
        Title = "Boost Player"
    })
    local function vu372(p365)
        vu27 = p365
        local v366, v367 = pcall(function()
            return require(vu84.Controllers:WaitForChild("VFXController"))
        end)
        if v366 and v367 then
            local v368, v369, v370 = pairs(v367)
            while true do
                local v371
                v370, v371 = v368(v369, v370)
                if v370 == nil then
                    break
                end
                if typeof(v371) == "function" then
                    if p365 then
                        if not vu28[v370] then
                            vu28[v370] = v371
                        end
                        v367[v370] = function()
                        end
                    elseif vu28[v370] then
                        v367[v370] = vu28[v370]
                    end
                end
            end
            print("[MengXHub] Rod VFX Disabled:", p365)
        end
    end
    BoostSection:Toggle({
        Title = "Disable VFX",
        Value = false,
        Callback = function(p373)
            vu372(p373)
        end
    })
    l_LocalPlayer_5 = nil
    v979 = nil
    v980 = nil
    local v374, v375 = pcall(function()
        return require(vu84.Controllers.CutsceneController)
    end)
    v982 = v375
    v981 = v374
    if v981 and v982 then
        l_LocalPlayer_5 = v982
        v979 = l_LocalPlayer_5.Play
        v980 = l_LocalPlayer_5.Stop
    end
    local function vu376()
        if vu13.RE_Cutscene then
            vu13.RE_Cutscene.OnClientEvent:Connect(function(...)
                warn("[CELESTIAL] Cutscene blocked (ReplicateCutscene)", ...)
            end)
        end
        if vu13.RE_StopCutscene then
            vu13.RE_StopCutscene.OnClientEvent:Connect(function()
                warn("[CELESTIAL] Cutscene blocked (stopCutscene)")
            end)
        end
        if l_LocalPlayer_5 then
            function l_LocalPlayer_5.Play()
                warn("[CELESTIAL] Cutscene skipped!")
            end
            function l_LocalPlayer_5.Stop()
                warn("[CELESTIAL] Cutscene stop skipped!")
            end
        end
    end
    local function vu377()
        if l_LocalPlayer_5 and (v979 and v980) then
            l_LocalPlayer_5.Play = v979
            l_LocalPlayer_5.Stop = v980
            warn("[CELESTIAL] Cutscene restored to default")
        end
    end
    vu237:Register("cutsceneToggle", (BoostSection:Toggle({
        Title = "Disable Cutscene",
        Value = false,
        Callback = function(p378)
            if p378 then
                vu376()
            else
                vu377()
            end
        end
    })))
    vu237:Register("obtainedFishToggle", (BoostSection:Toggle({
        Title = "Disable Obtained Fish",
        Value = false,
        Callback = function(p379)
            local v380 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Small Notification")
            if v380 and v380:FindFirstChild("Display") then
                v380.Display.Visible = not p379
            end
        end
    })))
    RenderSection = PlayerTab:Section({
        Title = "Rendering"
    })
    RenderSection:Button({
        Title = "Reduce Map",
        Desc = "Boost FPS Mode (Permanent Until Rejoin)",
        Callback = function()
            local function vu382(p381)
                if not p381:IsDescendantOf(vu5.Character) then
                    if p381:IsA("BasePart") then
                        p381.Material = Enum.Material.Plastic
                        p381.CastShadow = false
                        p381.Reflectance = 0
                    elseif p381:IsA("Decal") or p381:IsA("Texture") then
                        p381.Transparency = 1
                    elseif p381:IsA("ParticleEmitter") or (p381:IsA("Trail") or (p381:IsA("Beam") or (p381:IsA("Smoke") or (p381:IsA("Fire") or p381:IsA("Sparkles"))))) then
                        p381.Enabled = false
                    elseif p381:IsA("Highlight") then
                        p381:Destroy()
                    elseif p381:IsA("MeshPart") then
                        p381.MeshId = ""
                        p381.TextureID = ""
                    elseif p381:IsA("SpecialMesh") then
                        p381.MeshId = ""
                        p381.TextureId = ""
                    end
                end
            end
            local v383, v384, v385 = ipairs(workspace:GetDescendants())
            local vu386 = true
            while true do
                local v387
                v385, v387 = v383(v384, v385)
                if v385 == nil then
                    break
                end
                vu382(v387)
            end
            workspace.DescendantAdded:Connect(function(p388)
                if vu386 then
                    task.wait(0.05)
                    vu382(p388)
                end
            end)
            local v389 = game:GetService("Lighting")
            v389.GlobalShadows = false
            v389.FogStart = 9999999
            v389.FogEnd = 9999999
            v389.Brightness = 1
            local v390, v391, v392 = ipairs(v389:GetChildren())
            while true do
                local v393
                v392, v393 = v390(v391, v392)
                if v392 == nil then
                    break
                end
                if v393:IsA("BloomEffect") or (v393:IsA("DepthOfFieldEffect") or (v393:IsA("ColorCorrectionEffect") or v393:IsA("SunRaysEffect"))) then
                    v393.Enabled = false
                end
            end
            local v394 = workspace:FindFirstChild("Terrain")
            if v394 then
                v394.WaterWaveSize = 0
                v394.WaterWaveSpeed = 0
                v394.WaterReflectance = 0
                v394.WaterTransparency = 1
            end
        end
    })
    RenderSection:Toggle({
        Title = "Disable 3D Rendering",
        Value = false,
        Callback = function(p395)
            vu2:Set3dRenderingEnabled(not p395)
            vu229:Notify({
                Title = p395 and "Disabled" or "Enabled",
                Content = p395 and "3D Render Dimatikan" or "3D Render Diaktifkan",
                Duration = 2.5,
                Icon = p395 and "circle-x" or "laptop-minimal-check"
            })
        end
    })
    HideIdentSection = PlayerTab:Section({
        Title = "Identity"
    })
    local function vu397()
        local v396 = (vu5.Character or vu5.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart"):WaitForChild("Overhead")
        vu22.Title = v396.TitleContainer:WaitForChild("Label")
        vu22.Header = v396.Content:WaitForChild("Header")
        vu22.Level = v396.LevelContainer:WaitForChild("Label")
        vu22.Grad = vu22.Title:FindFirstChildOfClass("UIGradient") or Instance.new("UIGradient", vu22.Title)
        vu22.Watermark = v396:FindFirstChild("AnonHubWatermark")
        if not vu22.Watermark then
            vu22.Watermark = Instance.new("TextLabel")
            vu22.Watermark.Name = "AnonHubWatermark"
            vu22.Watermark.Parent = v396
            vu22.Watermark.Text = "[AnonHub]"
            vu22.Watermark.TextColor3 = Color3.fromRGB(255, 105, 180)
            vu22.Watermark.TextScaled = true
            vu22.Watermark.TextSize = 30
            vu22.Watermark.Font = Enum.Font.SourceSansBold
            vu22.Watermark.BackgroundTransparency = 1
            vu22.Watermark.Size = UDim2.new(1, 0, 0.25, 0)
            vu22.Watermark.Position = UDim2.new(0, 0, 0, 0)
            vu22.Watermark.ZIndex = 3
            vu22.Watermark.Visible = false
        end
        vu23.Title = vu22.Title.Text
        vu23.Header = vu22.Header.Text
        vu23.Level = vu22.Level.Text
        vu23.Grad = vu22.Grad.Color
        vu23.Rotation = vu22.Grad.Rotation
        vu23.WatermarkVisible = vu22.Watermark.Visible
    end
    local function vu398()
        if vu22.Title then
            vu22.Title.Text = "AnonHub"
            vu22.Header.Text = vu23.NewHeader or vu23.Header
            vu22.Level.Text = vu23.NewLevel or vu23.Level
            vu22.Grad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 85, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(136, 200, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(136, 243, 255))
            })
            vu22.Grad.Rotation = 0
            if vu22.Watermark then
                vu22.Watermark.Visible = true
            end
        end
    end
    local function vu399()
        if vu22.Title then
            vu22.Title.Text = vu23.Title
            vu22.Header.Text = vu23.Header
            vu22.Level.Text = vu23.Level
            vu22.Grad.Color = vu23.Grad
            vu22.Grad.Rotation = vu23.Rotation
            if vu22.Watermark then
                vu22.Watermark.Visible = false
            end
        end
    end
    local function vu400()
        if vu24 then
            task.cancel(vu24)
        end
        vu24 = task.spawn(function()
            while true do
                vu398()
                task.wait(1)
            end
        end)
    end
    local function vu401()
        if vu24 then
            task.cancel(vu24)
        end
        vu24 = nil
    end
    vu397()
    vu237:Register("nameChangerInput", (HideIdentSection:Input({
        Title = "Name Changer",
        Value = "",
        Placeholder = "AnonHub",
        Callback = function(p402)
            vu23.NewHeader = p402
        end
    })))
    vu237:Register("levelChangerInput", (HideIdentSection:Input({
        Title = "Level Changer",
        Value = "",
        Placeholder = "Lvl: ",
        Callback = function(p403)
            vu23.NewLevel = p403
        end
    })))
    local vu405 = HideIdentSection:Toggle({
        Title = "Start Hide Identity",
        Value = false,
        Callback = function(p404)
            vu23.ToggleState = p404
            if p404 then
                vu398()
                vu400()
            else
                vu401()
                vu399()
            end
        end
    })
    vu237:Register("startIdentityToggle", vu405)
    vu5.CharacterAdded:Connect(function()
        task.wait(0.1)
        vu397()
        if vu23.ToggleState then
            vu398()
            vu400()
        end
    end)
    HideIdentSection:Button({
        Title = "Reset Character In Place",
        Callback = function()
            local v406 = vu5.Character
            if v406 then
                local v407 = v406:FindFirstChild("HumanoidRootPart")
                if v407 then
                    local v408 = v407.CFrame
                    v406:BreakJoints()
                    vu5.CharacterAdded:Wait()
                    task.wait(0.2)
                    vu5.Character:WaitForChild("HumanoidRootPart").CFrame = v408
                    vu229:Notify({
                        Title = "Character berhasil direset di lokasi yang sama!"
                    })
                end
            else
                return
            end
        end
    })
    FishingTab:Section({
        Title = "Auto Fishing"
    })
    vu237:Register("legitInput", (FishingTab:Input({
        Title = "Legit Delay",
        Desc = "Delay complete fishing!",
        Value = "",
        Placeholder = "Default: 0.2",
        Callback = function(p409)
            local v410 = tonumber(p409)
            if v410 and 0 < v410 then
                vu33 = v410
                task.spawn(function()
                    print("Started")
                    while true do
                        if vu15 and vu15._autoLoop and vu15:GetCurrentGUID() then
                            print("Waiting", vu33)
                            task.wait(vu33)
                            while vu15._autoLoop do
                                if pcall(function()
                                    vu13.RE_Fishing:FireServer()
                                end) then
                                    print("Successfully")
                                end
                                task.wait(0.05)
                                if not vu15:GetCurrentGUID() then
                                end
                            end
                            print("Loop ended")
                        end
                        task.wait(0.05)
                    end
                end)
            else
                warn("Invalid fishing delay input")
            end
        end
    })))
    vu237:Register("shakeInput", (FishingTab:Input({
        Title = "Shake Delay",
        Value = "",
        Placeholder = "Default: 0.15",
        Callback = function(p411)
            local v412 = tonumber(p411)
            if v412 and 0 < v412 then
                vu45 = v412
            end
        end
    })))
    local vu413 = nil
    local vu414 = v17.RegisterMouseReleased
    function registerMouseReleasedHook(p415, p416, p417)
        vu413 = p417
        return vu414(p415, p416, p417)
    end
    v17.RegisterMouseReleased = registerMouseReleasedHook
    function castWithBarRelease()
        local v418 = vu8
        local v419 = vu7
        local vu420 = Vector2.new(v419.ViewportSize.X / 2, v419.ViewportSize.Y / 2)
        pcall(function()
            vu13.RF_Cancel:InvokeServer()
        end)
        pcall(function()
            vu15:RequestChargeFishingRod(vu420, false)
        end)
        local v421 = v418:WaitForChild("Charge"):WaitForChild("Main"):WaitForChild("CanvasGroup"):WaitForChild("Bar")
        repeat
            task.wait()
        until v421.Size.Y.Scale > 0
        local v422 = tick()
        while v421:IsDescendantOf(v418) and v421.Size.Y.Scale < 0.93 do
            task.wait()
            if tick() - v422 > 2 then
                break
            end
        end
        if vu413 then
            pcall(vu413)
        end
    end
    userId = tostring(vu5.UserId)
    CosmeticFolder = workspace:WaitForChild("CosmeticFolder")
    local vu424 = FishingTab:Toggle({
        Title = "Legit Fishing",
        Value = false,
        Callback = function(p423)
            vu15._autoLoop = p423
            if p423 then
                task.spawn(function()
                    while vu15._autoLoop do
                        if not CosmeticFolder:FindFirstChild(userId) then
                            castWithBarRelease()
                            task.wait(0.2)
                        end
                        repeat
                            task.wait(0.2)
                        until not (CosmeticFolder:FindFirstChild(userId) and vu15._autoLoop)
                        task.wait(0.2)
                    end
                end)
            end
        end
    })
    vu237:Register("LegitFishingToggle", vu424)
    local vu427 = FishingTab:Toggle({
        Title = "Auto Shake",
        Desc = "Spam click during fishing (only legit)",
        Value = false,
        Callback = function(p425)
            AutoShake = p425
            local v426 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("!!! Click Effect")
            if v426 then
                v426.Enabled = not p425
            end
            if p425 then
                task.spawn(function()
                    while AutoShake do
                        pcall(function()
                            vu15:RequestFishingMinigameClick()
                        end)
                        task.wait(vu45)
                    end
                end)
            end
        end
    })
    vu237:Register("autoShakeToggle", vu427)
    FishingTab:Section({
        Title = "Instant Fishing"
    })
    FishingTab:Paragraph({
        Title = "Instant Fishing Settings",
        Desc = "For instant fishing, you must first set the completion delay. The default is 0.1.",
        Color = "Green",
        Image = "rbxassetid://103247953194129",
        ImageSize = 30
    })
    vu237:Register("instantDelayCompleteValue", (FishingTab:Input({
        Title = "Delay Complete",
        Value = "",
        Placeholder = "Default: 0.1",
        Callback = function(p428)
            local v429 = tonumber(p428)
            if v429 and 0 < v429 then
                vu39 = v429
                print("?? Instant Fishing Delay diatur ke: " .. vu39 .. "s")
            end
        end
    })))
    local vu436 = FishingTab:Toggle({
        Title = "Instant Fishing",
        Desc = "Auto instantly catch fish",
        Value = false,
        Callback = function(p430)
            vu37 = p430
            autoPerfection(p430)
            if p430 then
                vu40 = vu44()
                task.spawn(function()
                    while vu37 do
                        if vu38 then
                            vu38 = false
                            local v431, _, vu432 = pcall(function()
                                return vu13.RF_Charge:InvokeServer(workspace:GetServerTimeNow())
                            end)
                            if v431 and typeof(vu432) == "number" then
                                task.wait(0.3)
                                pcall(function()
                                    vu13.RF_Minigame:InvokeServer(- 1, 0.999, vu432)
                                end)
                                local v433 = tick()
                                repeat
                                    task.wait(0.05)
                                until vu41 and vu41.LastShift or tick() - v433 > 1
                                task.wait(delayComplete)
                                pcall(function()
                                    vu13.RE_Fishing:FireServer()
                                end)
                                local v434 = vu44()
                                local v435 = tick()
                                repeat
                                    task.wait(0.05)
                                until v434 < vu44() or tick() - v435 > 1
                            end
                            vu38 = true
                        end
                        task.wait(0.05)
                    end
                end)
            end
        end
    })
    vu237:Register("instantToggle", vu436)
    if RE_FishingMinigameEvent then
        if v42 then
            v42:Disconnect()
        end
        RE_FishingMinigameEvent.OnClientEvent:Connect(function(_, p437)
            if p437 then
                vu41 = p437
            end
        end)
    end
    FishingTab:Toggle({
        Title = "Talon Fishing",
        Desc = "Auto In Game Fishing + Auto Shake",
        Value = false,
        Callback = function(p438)
            AutoShake = p438
            local v439 = vu8:FindFirstChild("!!! Click Effect")
            vu13.RF_AutoFishing:InvokeServer(p438)
            if p438 then
                if v439 then
                    v439.Enabled = false
                end
                task.spawn(function()
                    while AutoShake do
                        pcall(function()
                            vu15:RequestFishingMinigameClick()
                        end)
                        task.wait(0.15)
                    end
                end)
            elseif v439 then
                v439.Enabled = true
            end
        end
    })
    FishingTab:Section({
        Title = "Blatant Features"
    })
    vu237:Register("blatantReelInput", (FishingTab:Input({
        Title = "Delay Reel",
        Desc = "Reel Timing (e.g. 1.9)",
        Value = "",
        Placeholder = "Default: 1.9",
        Callback = function(p440)
            local v441 = tonumber(p440)
            if v441 and 0 < v441 then
                vu35 = v441
            end
        end
    })))
    vu237:Register("blatantFishInput", (FishingTab:Input({
        Title = "Delay Fishing",
        Desc = "Fishing Timing (e.g. 1.1)",
        Value = "",
        Placeholder = "Default: 1.1",
        Callback = function(p442)
            local v443 = tonumber(p442)
            if v443 and 0 < v443 then
                vu36 = v443
            end
        end
    })))
    local function vu445()
        task.spawn(function()
            pcall(function()
                vu13.RF_Cancel:InvokeServer()
            end)
            local vu444 = workspace:GetServerTimeNow()
            pcall(function()
                vu13.RF_Charge:InvokeServer(vu444)
            end)
            pcall(function()
                vu13.RF_Minigame:InvokeServer(- 1, 0.999)
            end)
            task.wait(vu36)
            pcall(function()
                vu13.RE_Fishing:FireServer()
            end)
        end)
    end
    local vu447 = FishingTab:Toggle({
        Title = "Blatant Fishing",
        Value = false,
        Callback = function(p446)
            vu34 = p446
            autoPerfection(p446)
            if p446 then
                vu5:SetAttribute("Loading", nil)
                task.spawn(function()
                    while vu34 do
                        vu445()
                        task.wait(vu35)
                    end
                end)
            else
                vu5:SetAttribute("Loading", false)
            end
        end
    })
    vu237:Register("blatantToggle", vu447)
    FishingTab:Button({
        Title = "Recovery Fishing",
        Callback = function()
            vu13.RF_Cancel:InvokeServer()
            vu229:Notify({
                Title = "Recovery Fishing Successfully!"
            })
        end
    })
    SellSection = AutomaticTab:Section({
        Title = "Auto Sell"
    })
    SellSection:Dropdown({
        Title = "Select Sell Mode",
        Values = {
            "Delay",
            "Count"
        },
        Value = "Delay",
        Callback = function(p448)
            vu51 = tostring(p448 or vu51)
        end
    })
    SellSection:Input({
        Title = "Sell Value",
        Desc = "Delay = Minute | Count = Fish Count",
        Value = "60",
        Callback = function(p449)
            local v450 = tonumber(p449) or 1
            if vu51 ~= "Delay" then
                vu50 = v450
            else
                vu49 = v450
            end
        end
    })
    SellSection:Toggle({
        Title = "Auto Sell All",
        Value = false,
        Callback = function(p451)
            vu48 = p451
            if p451 then
                task.spawn(function()
                    while vu48 do
                        local v452 = vu5:WaitForChild("PlayerGui"):WaitForChild("Inventory").Main.Top.Options.Fish.Label:FindFirstChild("BagSize")
                        local v453, v454
                        if v452 and v452:IsA("TextLabel") then
                            local v455, v456 = (v452.Text or ""):match("(%d+)%s*/%s*(%d+)")
                            v453 = tonumber(v455) or 0
                            v454 = tonumber(v456) or 0
                        else
                            v453 = 0
                            v454 = 0
                        end
                        if vu51 ~= "Delay" then
                            if vu51 == "Count" then
                                if (tonumber(vu50) or v454) <= v453 then
                                    vu13.RF_Sell:InvokeServer()
                                    task.wait(0)
                                else
                                    task.wait(0)
                                end
                            end
                        else
                            vu13.RF_Sell:InvokeServer()
                            task.wait(vu49)
                        end
                    end
                end)
            end
        end
    })
    WeatherSection = AutomaticTab:Section({
        Title = "Auto Buy Weather"
    })
    vu237:Register("weatherDropdown", (WeatherSection:Dropdown({
        Title = "Select Weather",
        Desc = "",
        Values = {
            "Cloudy ($10,000)",
            "Wind ($10,000)",
            "Snow ($15,000)",
            "Storm ($35,000)",
            "Radiant ($50,000)",
            "Shark Hunt ($300,000)"
        },
        Multi = true,
        AllowNone = true,
        Callback = function(p457)
            vu52 = {}
            if type(p457) == "table" then
                local v458, v459, v460 = ipairs(p457)
                while true do
                    local v461
                    v460, v461 = v458(v459, v460)
                    if v460 == nil then
                        break
                    end
                    local v462 = v461:match("^(.-) %(") or v461
                    table.insert(vu52, v462)
                end
            end
        end
    })))
    local vu475 = WeatherSection:Toggle({
        Title = "Auto Buy Weather",
        Value = false,
        Callback = function(p463)
            vu53 = p463
            if vu13.RF_Weather then
                if p463 then
                    task.spawn(function()
                        while vu53 do
                            local v464 = vu52
                            if # v464 > 0 then
                                local v465 = {}
                                local v466 = workspace:FindFirstChild("Weather")
                                if v466 then
                                    local v467, v468, v469 = ipairs(v466:GetChildren())
                                    while true do
                                        local v470
                                        v469, v470 = v467(v468, v469)
                                        if v469 == nil then
                                            break
                                        end
                                        table.insert(v465, string.lower(v470.Name))
                                    end
                                end
                                local v471, v472, v473 = ipairs(v464)
                                while true do
                                    local vu474
                                    v473, vu474 = v471(v472, v473)
                                    if v473 == nil then
                                        break
                                    end
                                    if not table.find(v465, string.lower(vu474)) then
                                        pcall(function()
                                            vu13.RF_Weather:InvokeServer(vu474)
                                        end)
                                        task.wait(0.1)
                                    end
                                end
                            end
                            task.wait(0.1)
                        end
                    end)
                end
            end
        end
    })
    vu237:Register("weatherToggle", vu475)
    EnchantSection = AutomaticTab:Section({
        Title = "Enchant Features"
    })
    local vu476 = "Big Hunter I"
    local vu477 = false
    local function vu503(p478)
        local v479 = vu18:Get("EquippedItems") or {}
        local v480 = vu18:Get({
            "Inventory",
            "Fishing Rods"
        }) or {}
        local v481, v482, v483 = pairs(v479)
        local v484 = false
        local v485 = 0
        local v486 = {}
        local v487 = "None"
        local v488 = "None"
        while true do
            local v489
            v483, v489 = v481(v482, v483)
            if v483 == nil then
                break
            end
            local v490, v491, v492 = ipairs(v480)
            while true do
                local v493
                v492, v493 = v490(v491, v492)
                if v492 == nil then
                    break
                end
                if v493.UUID == v489 then
                    local v494 = vu16:GetItemData(v493.Id)
                    v487 = v494 and v494.Data.Name or (v493.ItemName or "None")
                    if v493.Metadata and v493.Metadata.EnchantId then
                        local v495 = vu16:GetEnchantData(v493.Metadata.EnchantId)
                        local v496
                        if v495 then
                            v496 = v495.Data.Name
                            if v496 then
                                v484 = true
                            else
                                v496 = v488
                            end
                        else
                            v496 = v488
                        end
                        if v484 then
                            v488 = v496
                        else
                            v488 = "None"
                        end
                    end
                end
                v484 = false
            end
        end
        local v497 = vu18
        local v498, v499, v500 = pairs(v497:GetExpect({
            "Inventory",
            "Items"
        }))
        while true do
            local v501
            v500, v501 = v498(v499, v500)
            if v500 == nil then
                break
            end
            local v502 = vu16:GetItemData(v501.Id)
            if v502 and (v502.Data.Type == "Enchant Stones" and v501.Id == p478) then
                v485 = v485 + 1
                table.insert(v486, v501.UUID)
            end
        end
        return v487, v488, v485, v486
    end
    local vu504 = EnchantSection:Paragraph({
        Title = "Enchant Status",
        Desc = "Current Rod : None\nCurrent Enchant : None\nEnchant Stones Left : 0"
    })
    EnchantSection:Dropdown({
        Title = "Select Enchant Target",
        Desc = "This will repeat until you get the selected enchantment!",
        Values = {
            "Big Hunter I",
            "Cursed I",
            "Empowered I",
            "Glistening I",
            "Gold Digger I",
            "Leprechaun I",
            "Leprechaun II",
            "Mutation Hunter I",
            "Mutation Hunter II",
            "Prismatic I",
            "Reeler I",
            "Stargazer I",
            "Stormhunter I",
            "XPerienced I"
        },
        Value = "Big Hunter I",
        Callback = function(p505)
            vu476 = p505
        end
    })
    EnchantSection:Toggle({
        Title = "Auto Enchant",
        Desc = "Automatically enchants until it reaches your selected enchant target!",
        Default = false,
        Callback = function(p506)
            vu477 = p506
            task.spawn(function()
                while true do
                    if not vu477 then
                        return
                    end
                    local v507, v508, v509, v510 = vu503(10)
                    vu504:SetDesc(("Current Rod : %s\nCurrent Enchant : %s\nEnchant Stones Left : %d"):format(v507, v508, v509))
                    if v508 == vu476 then
                        vu504:SetDesc("<font color=\'rgb(0,255,0)\'>SUCCESS: " .. vu476 .. " Acquired!</font>")
                        vu477 = false
                        break
                    end
                    if v509 <= 0 then
                        vu504:SetDesc("<font color=\'rgb(255,0,0)\'>Stopped: No enchant stones left.</font>")
                        vu477 = false
                        break
                    end
                    local v511 = tick()
                    local v512 = nil
                    while true do
                        if tick() - v511 >= 5 or not vu477 then
                            v516 = v512
                        end
                        local v513 = vu18
                        local v514, v515, v516 = pairs(v513:Get("EquippedItems") or {})
                        while true do
                            local v517
                            v516, v517 = v514(v515, v516)
                            if v516 == nil then
                                v516 = v512
                                break
                            end
                            if v517 == v510[1] then
                                break
                            end
                        end
                        if v516 then
                        end
                        vu13.RE_EquipItem:FireServer(v510[1], "Enchant Stones")
                        task.wait(0.3)
                        v512 = v516
                    end
                    if not (vu477 and v516) then
                        break
                    end
                    vu13.RE_Equip:FireServer(v516)
                    task.wait(0.2)
                    vu13.RE_Altar:FireServer()
                    task.wait(1.5)
                end
            end)
        end
    })
    EnchantSection:Button({
        Title = "Teleport Enchant Altar",
        Callback = function()
            local v518 = vu5.Character or vu5.CharacterAdded:Wait()
            local v519 = v518:FindFirstChild("HumanoidRootPart")
            local v520 = v518:FindFirstChildOfClass("Humanoid")
            if v519 and v520 then
                v519.CFrame = CFrame.new(Vector3.new(3258, - 1301, 1391))
                v520:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                v520:ChangeState(Enum.HumanoidStateType.Running)
            end
        end
    })
    EnchantSection:Divider()
    EnchantSection:Dropdown({
        Title = "Select Enchant Target (Second Slot)",
        Desc = "This will repeat until you get the selected enchantment!",
        Values = {
            "Big Hunter I",
            "Cursed I",
            "Empowered I",
            "Glistening I",
            "Gold Digger I",
            "Leprechaun I",
            "Leprechaun II",
            "Mutation Hunter I",
            "Mutation Hunter II",
            "Perfection",
            "Prismatic I",
            "Reeler I",
            "Stargazer I",
            "Stormhunter I",
            "XPerienced I"
        },
        Value = "Big Hunter I",
        Callback = function(p521)
            vu476 = p521
        end
    })
    EnchantSection:Toggle({
        Title = "Auto Double Enchant",
        Desc = "Automatically enchants the second slot until target enchant is reached.",
        Default = false,
        Callback = function(p522)
            vu477 = p522
            task.spawn(function()
                while true do
                    if not vu477 then
                        return
                    end
                    local v523, v524, v525, v526 = vu503(246)
                    vu504:SetDesc(("Current Rod : %s\nCurrent Enchant : %s\nEnchant Stones Left : %d"):format(v523, v524, v525))
                    if v525 <= 0 then
                        vu504:SetDesc("<font color=\'rgb(255,0,0)\'>Stopped: No enchant stones left.</font>")
                        vu477 = false
                        break
                    end
                    if v524 == vu476 then
                        vu504:SetDesc("<font color=\'rgb(0,255,0)\'>SUCCESS: " .. vu476 .. " Acquired!</font>")
                        vu477 = false
                        break
                    end
                    local v527 = tick()
                    local v528 = nil
                    while true do
                        if tick() - v527 >= 5 or not vu477 then
                            v532 = v528
                        end
                        local v529 = vu18
                        local v530, v531, v532 = pairs(v529:Get("EquippedItems") or {})
                        while true do
                            local v533
                            v532, v533 = v530(v531, v532)
                            if v532 == nil then
                                v532 = v528
                                break
                            end
                            if v533 == v526[1] then
                                break
                            end
                        end
                        if v532 then
                        end
                        vu13.RE_EquipItem:FireServer(v526[1], "Enchant Stones")
                        task.wait(0.3)
                        v528 = v532
                    end
                    if not (vu477 and v532) then
                        break
                    end
                    vu13.RE_Equip:FireServer(v532)
                    task.wait(0.2)
                    vu13.RE_Altar2:FireServer()
                    task.wait(1.5)
                end
            end)
        end
    })
    EnchantSection:Button({
        Title = "Teleport Second Enchant Altar",
        Callback = function()
            local v534 = vu5.Character or vu5.CharacterAdded:Wait()
            local v535 = v534:FindFirstChild("HumanoidRootPart")
            local v536 = v534:FindFirstChildOfClass("Humanoid")
            if v535 and v536 then
                v535.CFrame = CFrame.new(Vector3.new(1480, 128, - 593))
                v536:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                v536:ChangeState(Enum.HumanoidStateType.Running)
            end
        end
    })
    TotemSection = AutomaticTab:Section({
        Title = "Totems Features"
    })
    TotemPanel = TotemSection:Paragraph({
        Title = "Panel Activated Totem",
        Desc = "Scanning Totems..."
    })
    HeaderPanel = TotemSection:Paragraph({
        Title = "Auto Totem Status",
        Desc = "Idle."
    })
    function GetTT()
        local v537 = vu5.Character and (vu5.Character:FindFirstChild("HumanoidRootPart") and vu5.Character.HumanoidRootPart.Position) or Vector3.zero
        local v538, v539, v540 = pairs(workspace.Totems:GetChildren())
        local v541 = {}
        while true do
            local v542
            v540, v542 = v538(v539, v540)
            if v540 == nil then
                break
            end
            if v542:IsA("Model") then
                local v543 = v542:FindFirstChild("Handle")
                if v543 then
                    v543 = v543:FindFirstChild("Overhead")
                end
                if v543 then
                    v543 = v543:FindFirstChild("Content")
                end
                local v544
                if v543 then
                    v544 = v543:FindFirstChild("Header")
                else
                    v544 = v543
                end
                if v543 then
                    v543 = v543:FindFirstChild("TimerLabel")
                end
                local v545 = (v537 - v542:GetPivot().Position).Magnitude
                local v546 = v543 and v543.Text or "??"
                local v547 = v544 and v544.Text or "??"
                table.insert(v541, {
                    Name = v547,
                    Distance = v545,
                    TimeLeft = v546
                })
            end
        end
        return v541
    end
    function UpdTT()
        local v548 = GetTT()
        if # v548 ~= 0 then
            local v549, v550, v551 = ipairs(v548)
            local v552 = {}
            while true do
                local v553
                v551, v553 = v549(v550, v551)
                if v551 == nil then
                    break
                end
                table.insert(v552, string.format("%s \226\128\162 %.1f studs \226\128\162 %s", v553.Name, v553.Distance, v553.TimeLeft))
            end
            TotemPanel:SetDesc(table.concat(v552, "\n"))
        else
            TotemPanel:SetDesc("No active totems detected")
        end
    end
    task.spawn(function()
        while task.wait(1) do
            pcall(UpdTT)
        end
    end)
    function GetTTUUID(p554)
        if not Data then
            Data = vu14.Client:WaitReplion("Data")
            if not Data then
                return nil
            end
        end
        if not Totems then
            Totems = require(game:GetService("ReplicatedStorage"):WaitForChild("Totems"))
            if not Totems then
                return nil
            end
        end
        local v555 = Data:GetExpect({
            "Inventory",
            "Totems"
        }) or {}
        local v556, v557, v558 = ipairs(v555)
        while true do
            local v559
            v558, v559 = v556(v557, v558)
            if v558 == nil then
                return nil
            end
            local v560 = "Unknown Totem"
            if typeof(Totems) == "table" then
                local v561, v562, v563 = pairs(Totems)
                while true do
                    local v564
                    v563, v564 = v561(v562, v563)
                    if v563 == nil then
                        break
                    end
                    if v564.Data and v564.Data.Id == v559.Id then
                        v560 = v564.Data.Name
                        break
                    end
                end
            end
            if v560 == p554 then
                return v559.UUID, v560
            end
        end
    end
    TotemSection:Button({
        Title = "Teleport To Nearest Totem",
        Callback = function()
            local v565 = vu5.Character
            if v565 then
                v565 = vu5.Character:FindFirstChild("HumanoidRootPart")
            end
            if not v565 then
                return
            end
            local v566 = GetTT()
            if # v566 == 0 then
                return
            end
            table.sort(v566, function(p567, p568)
                return p567.Distance < p568.Distance
            end)
            local v569 = v566[1]
            local v570, v571, v572 = pairs(workspace.Totems:GetChildren())
            while true do
                local v573
                v572, v573 = v570(v571, v572)
                if v572 == nil then
                    break
                end
                if v573:IsA("Model") then
                    local v574 = v573:GetPivot().Position
                    if math.abs((v574 - v565.Position).Magnitude - v569.Distance) < 1 then
                        v565.CFrame = CFrame.new(v574 + Vector3.new(0, 3, 0))
                        break
                    end
                end
            end
        end
    })
    TotemsFolder = vu84:WaitForChild("Totems")
    vu23.Totems = vu23.Totems or {}
    vu23.TotemDisplayName = vu23.TotemDisplayName or {}
    local v575, v576, v577 = ipairs(TotemsFolder:GetChildren())
    local vu578 = vu212
    local v579 = vu231
    local vu580 = vu150
    local vu581 = vu279
    local vu582 = vu377
    local vu583 = vu276
    local vu584 = vu477
    local vu585 = vu151
    local vu586 = vu148
    local vu587 = vu229
    local vu588 = vu154
    local vu589 = vu372
    local vu590 = vu211
    local vu591 = vu149
    local vu592 = vu291
    local vu593 = vu274
    local function vu594()
        if RealTotemPanel and RealTotemPanel.Show then
            RealTotemPanel:Show()
        end
    end
    while true do
        local v595, v596 = v575(v576, v577)
        if v595 == nil then
            break
        end
        v577 = v595
        if v596:IsA("ModuleScript") then
            local v597, v598 = pcall(require, v596)
            if v597 and (typeof(v598) == "table" and v598.Data) then
                local v599 = v598.Data.Name or "Unknown"
                local v600 = v598.Data.Id or "Unknown"
                local v601 = {
                    Name = v599,
                    Id = v600
                }
                vu23.Totems[v600] = v601
                vu23.Totems[v599] = v601
                table.insert(vu23.TotemDisplayName, v599)
            end
        end
    end
    selectedTotem = nil
    TotemSection:Dropdown({
        Title = "Select Totem to Auto Place",
        Values = vu23.TotemDisplayName or {
            "No Totems Found"
        },
        Value = vu23.TotemDisplayName and (vu23.TotemDisplayName[1] or "No Totems Found") or "No Totems Found",
        Callback = function(p602)
            selectedTotem = p602
        end
    })
    TotemSection:Toggle({
        Title = "Auto Place Totem",
        Desc = "Place Totem every 60 min automatically!",
        Value = false,
        Callback = function(p603)
            vu23.TotemActive = p603
            if p603 then
                if selectedTotem then
                    task.spawn(function()
                        HeaderPanel:SetDesc(("Auto Totem Enabled [%s]"):format(selectedTotem))
                        local v604 = 0
                        while vu23.TotemActive do
                            local v605 = 0
                            while true do
                                local vu606 = select(1, GetTTUUID(selectedTotem))
                                v605 = v605 + 1
                                if not vu23.TotemActive then
                                    break
                                end
                                if not vu606 then
                                    HeaderPanel:SetDesc(("Looking for Totem... (Try %s)"):format(v605))
                                    task.wait(2)
                                end
                                if vu606 or 15 <= v605 then
                                    break
                                end
                            end
                            if not vu23.TotemActive then
                                break
                            end
                            if not vu606 then
                                HeaderPanel:SetDesc("No usable Totem found. Waiting 20s and retrying...")
                                task.wait(20)
                                break
                            end
                            pcall(function()
                                vu13.Totem:FireServer(vu606)
                            end)
                            v604 = v604 + 1
                            HeaderPanel:SetDesc(("Totem Placed [%s] | Next in 60m"):format(selectedTotem))
                            for _ = 3600, 1, - 1 do
                                if not vu23.TotemActive then
                                    break
                                end
                                task.wait(1)
                            end
                        end
                        HeaderPanel:SetDesc("Auto Totem Disabled")
                        vu594()
                    end)
                else
                    HeaderPanel:SetDesc("Please select a Totem first!")
                    vu23.TotemActive = false
                end
            else
                HeaderPanel:SetDesc("Auto Totem Disabled")
                vu594()
                return
            end
        end
    })
    EventSection = AutomaticTab:Section({
        Title = "Event Features"
    })
    EventSection:Dropdown({
        Title = "Select Event",
        Values = v163() or {},
        Callback = function(p607)
            vu591 = p607
        end
    })
    EventSection:Toggle({
        Title = "Auto Event",
        Value = false,
        Callback = function(p608)
            vu586 = p608
            SetWalkOnWater(p608)
            if p608 and vu591 then
                local v609 = vu585
                if v609 then
                    v609 = vu588(vu5.Character).CFrame
                end
                vu585 = v609
                task.spawn(EventLoop)
            else
                if vu585 then
                    vu5.Character:PivotTo(vu585)
                    vu587:Notify({
                        Title = "Auto Event Off",
                        Duration = 2.5
                    })
                end
                vu580 = nil
                vu585 = nil
            end
        end
    })
    EventSection:Divider()
    countdownParagraph = EventSection:Paragraph({
        Title = "Ancient Lochness Monster Countdown",
        Desc = "<font color=\'#FF4D4D\'><b>waiting for ... for joined event!</b></font>"
    })
    vu23.FarmPosition = vu23.FarmPosition or nil
    vu23.autoCountdownUpdate = false
    EventSection:Toggle({
        Title = "Auto Admin Event",
        Value = false,
        Callback = function(p610)
            vu23.autoCountdownUpdate = p610
            function getLabel()
                local v611, v612 = pcall(function()
                    return workspace["!!! MENU RINGS"]["Event Tracker"].Main.Gui.Content.Items.Countdown.Label
                end)
                return v611 and v612 and v612 or nil
            end
            function toEvent(p613)
                p613.CFrame = CFrame.new(Vector3.new(6063, - 586, 4715))
            end
            function backEvent(p614)
                if vu23.FarmPosition then
                    p614.CFrame = vu23.FarmPosition
                    countdownParagraph:SetDesc("<font color=\'#00FF99\'><b> Returned to saved farm position!</b></font>")
                else
                    countdownParagraph:SetDesc("<font color=\'#FF4D4D\'><b> No saved farm position found!</b></font>")
                end
            end
            if p610 then
                local v615 = (vu5.Character or vu5.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 5)
                if v615 then
                    vu23.FarmPosition = v615.CFrame
                    countdownParagraph:SetDesc(string.format("<font color=\'#00ff99\'><b>Farm position saved!</b></font>"))
                end
                local v616 = getLabel()
                if not v616 then
                    countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>Label not found!</b></font>")
                    return
                end
                local vu617 = v616
                task.spawn(function()
                    local v618 = false
                    while vu23.autoCountdownUpdate do
                        task.wait(1)
                        local vu619 = ""
                        pcall(function()
                            vu619 = vu617.Text or ""
                        end)
                        if vu619 == "" then
                            countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>Waiting for countdown...</b></font>")
                        else
                            countdownParagraph:SetDesc(string.format("<font color=\'#4AFFE7\'><b>Timer: %s</b></font>", vu619))
                            local v620 = (vu5.Character or vu5.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 5)
                            if v620 then
                                local v621, v622, v623 = vu619:match("(%d+)H%s*(%d+)M%s*(%d+)S")
                                local v624 = tonumber(v621)
                                local v625 = tonumber(v622)
                                local v626 = tonumber(v623)
                                if v624 == 3 and (v625 == 59 and (v626 == 59 and not v618)) then
                                    countdownParagraph:SetDesc("<font color=\'#00ff99\'><b>Event started! Teleporting...</b></font>")
                                    toEvent(v620)
                                    v618 = true
                                elseif v624 == 3 and (v625 == 49 and (v626 == 59 and v618)) then
                                    countdownParagraph:SetDesc("<font color=\'#ffaa00\'><b>Event ended! Returning...</b></font>")
                                    backEvent(v620)
                                    v618 = false
                                end
                            else
                                countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>\226\154\160\239\184\143 HRP not found, retrying...</b></font>")
                            end
                        end
                        if not (vu617 and vu617.Parent) then
                            vu617 = getLabel()
                            if not vu617 then
                                countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>Label lost. Reconnecting...</b></font>")
                                task.wait(2)
                                vu617 = getLabel()
                            end
                        end
                    end
                end)
            else
                local v627 = (vu5.Character or vu5.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 5)
                if v627 then
                    backEvent(v627)
                end
                countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>Auto Admin Event disabled.</b></font>")
            end
        end
    })
    FavoriteSection = AutomaticTab:Section({
        Title = "Favorite Features"
    })
    local vu629 = FavoriteSection:Dropdown({
        Title = "Name",
        Desc = "Favorite By Name Fish (Recommended)",
        Values = {
            "No Fish Found"
        },
        Multi = true,
        AllowNone = true,
        Callback = function(p628)
            vu590.name = toSet(p628)
        end
    })
    FavoriteSection:Button({
        Title = "Refresh Fish",
        Callback = function()
            vu629:Refresh(vu137)
        end
    })
    FavoriteSection:Dropdown({
        Title = "Rarity",
        Desc = "Favorite By Rarity (Optional)",
        Values = {
            "Common",
            "Uncommon",
            "Rare",
            "Epic",
            "Legendary",
            "Mythic",
            "Secret"
        },
        Multi = true,
        AllowNone = true,
        Callback = function(p630)
            vu590.rarity = toSet(p630)
        end
    })
    FavoriteSection:Dropdown({
        Title = "Variant",
        Desc = "Favorite By Variant (Only works with Name)",
        Values = v200,
        Multi = true,
        AllowNone = true,
        Callback = function(p631)
            if next(vu590.name) == nil then
                vu590.variant = {}
                warn("Pilih Name Dulu Sebelum Variant!")
            else
                vu590.variant = toSet(p631)
            end
        end
    })
    FavoriteSection:Toggle({
        Title = "Auto Favorite",
        Value = false,
        Callback = function(p632)
            vu590.auto = p632
            if p632 then
                scanInventory()
                vu18:OnChange({
                    "Inventory",
                    "Items"
                }, scanInventory)
            end
        end
    })
    FavoriteSection:Button({
        Title = "Unfavorite All",
        Callback = function()
            local v633 = vu18
            local v634, v635, v636 = ipairs(v633:GetExpect({
                "Inventory",
                "Items"
            }))
            while true do
                local v637
                v636, v637 = v634(v635, v636)
                if v636 == nil then
                    break
                end
                local v638 = rawget(vu578, v637.UUID)
                if v638 == nil then
                    v638 = v637.Favorited
                end
                if v638 then
                    vu13.RE_Favorite:FireServer(v637.UUID)
                    rawset(vu578, v637.UUID, false)
                end
            end
        end
    })
    function SavePosition(p639)
        local v640 = {
            p639:GetComponents()
        }
        local v641 = vu4
        writefile("AnonHub/FishIt/Position.json", v641:JSONEncode(v640))
    end
    function LoadPosition()
        if isfile("AnonHub/FishIt/Position.json") then
            local v642, v643 = pcall(function()
                return vu4:JSONDecode(readfile("AnonHub/FishIt/Position.json"))
            end)
            if v642 and typeof(v643) == "table" then
                return CFrame.new(unpack(v643))
            end
        end
        return nil
    end
    function TeleportLastPos(_)
        task.spawn(function()
            local v644 = vu5.Character:WaitForChild("HumanoidRootPart")
            local v645 = LoadPosition()
            if v645 then
                task.wait(2)
                v644.CFrame = v645
                vu587:Notify({
                    Title = "Teleported to your last position..."
                })
            end
        end)
    end
    vu5.CharacterAdded:Connect(TeleportLastPos)
    if vu5.Character then
        TeleportLastPos(vu5.Character)
    end
    SPSection = AutomaticTab:Section({
        Title = "Save Position Features"
    })
    SPSection:Paragraph({
        Title = "Guide Teleport",
        Desc = "\r\n<b><font color=\"rgb(0,162,255)\">AUTO TELEPORT?</font></b>\r\nClick <b><font color=\"rgb(0,162,255)\">Save Position</font></b> to save your current position!\r\n\r\n<b><font color=\"rgb(0,162,255)\">HOW TO LOAD?</font></b>\r\nThis feature will auto-sync your last position when executed, so you will teleport automatically!\r\n\r\n<b><font color=\"rgb(0,162,255)\">HOW TO RESET?</font></b>\r\nClick <b><font color=\"rgb(0,162,255)\">Reset Position</font></b> to clear your saved position.\r\n    "
    })
    SPSection:Button({
        Title = "Save Position",
        Callback = function()
            local v646 = vu5.Character
            if v646 then
                v646 = vu5.Character:FindFirstChild("HumanoidRootPart")
            end
            if v646 then
                SavePosition(v646.CFrame)
                vu587:Notify({
                    Title = "Position saved successfully!"
                })
            end
        end
    })
    SPSection:Button({
        Title = "Reset Position",
        Callback = function()
            if isfile("AnonHub/FishIt/Position.json") then
                delfile("AnonHub/FishIt/Position.json")
            end
            vu587:Notify({
                Title = "Last position has been reset!"
            })
        end
    })
    WebhookTab:Section({
        Title = "Webhook Fish Caught"
    })
    vu237:Register("webhookURLInput", (WebhookTab:Input({
        Title = "Webhook URL",
        Value = "",
        Placeholder = "Input Here",
        Callback = function(p647)
            vu135.URL = p647
        end
    })))
    WebhookTab:Dropdown({
        Title = "Tier Filter",
        Values = {
            "Common",
            "Uncommon",
            "Rare",
            "Epic",
            "Legendary",
            "Mythic",
            "Secret"
        },
        Value = {
            "Legendary",
            "Mythic",
            "Secret"
        },
        Multi = true,
        AllowNone = true,
        Callback = function(p648)
            vu133 = p648
        end
    })
    local vu650 = WebhookTab:Dropdown({
        Title = "Name Filter",
        Values = {
            "No Fish Found"
        },
        Multi = true,
        AllowNone = true,
        Callback = function(p649)
            vu136 = p649
        end
    })
    WebhookTab:Button({
        Title = "Refresh Fish",
        Callback = function()
            vu650:Refresh(vu137)
        end
    })
    vu237:Register("webhookNameInput", (WebhookTab:Input({
        Title = "Hide Identity",
        Value = "",
        Placeholder = "Input Here",
        Callback = function(p651)
            vu134 = p651
        end
    })))
    local vu653 = WebhookTab:Toggle({
        Title = "Send Fish Webhook",
        Value = false,
        Callback = function(p652)
            vu135.Enabled = p652
            vu92 = p652
        end
    })
    vu237:Register("webhookToggle", vu653)
    WebhookTab:Divider()
    WebhookTab:Button({
        Title = "Test Webhook Connection",
        Callback = function()
            local vu654 = vu135.URL
            if vu654 and vu654:match("discord.com/api/webhooks") then
                local vu655 = {
                    content = nil,
                    embeds = {
                        {
                            color = 44543,
                            author = {
                                name = "Webhook is connected :3"
                            },
                            image = {
                                url = "https://i.imgur.com/xl9yLMN.gif"
                            }
                        }
                    },
                    username = "AnonHub Notification!",
                    avatar_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Anonymous_emblem.svg/2048px-Anonymous_emblem.svg.png",
                    attachments = {}
                }
                local function vu658(p656)
                    local v657 = syn and syn.request or (http_request or http and http.request or (fluxus and fluxus.request or request))
                    if v657 then
                        return v657(p656)
                    end
                    warn("Executor kamu tidak support http request")
                    return nil
                end
                task.spawn(function()
                    local v661, v662 = pcall(function()
                        local v659 = vu658
                        local v660 = {
                            Url = vu654,
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = vu4:JSONEncode(vu655)
                        }
                        v659(v660)
                    end)
                    if v661 then
                        vu587:Notify({
                            Title = "? Successfully sent test message!"
                        })
                    else
                        vu587:Notify({
                            Title = "? Failed to send webhook:",
                            v662
                        })
                    end
                end)
            else
                warn("[Webhook Test] ? Invalid or missing webhook URL.")
            end
        end
    })
    local function vu668(p663, p664, p665, p666)
        local v667 = (vu5.Character or vu5.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
        if v667 then
            v667.CFrame = CFrame.new(p663, p664, p665) * (p666 and CFrame.Angles(0, math.rad(p666), 0) or CFrame.new())
        end
    end
    local function vu678(p669)
        local v670 = workspace:FindFirstChild("!!! MENU RINGS")
        if v670 then
            v670 = workspace["!!! MENU RINGS"]:FindFirstChild(p669)
        end
        if not v670 then
            return ""
        end
        local v671 = v670:FindFirstChild("Board") and v670.Board:FindFirstChild("Gui")
        if v671 then
            v671 = v670.Board.Gui:FindFirstChild("Content")
        end
        if not v671 then
            return ""
        end
        local v672, v673, v674 = ipairs(v671:GetChildren())
        local v675 = {}
        local v676 = 1
        while true do
            local v677
            v674, v677 = v672(v673, v674)
            if v674 == nil then
                break
            end
            if v677:IsA("TextLabel") and v677.Name ~= "Header" then
                table.insert(v675, v676 .. ". " .. v677.Text)
                v676 = v676 + 1
            end
        end
        return table.concat(v675, "\n")
    end
    local v679 = QuestTab:Section({
        Title = "Sisyphus State Quest"
    })
    local vu680 = v679:Paragraph({
        Title = "Deep Sea Panel",
        Desc = "Loading..."
    })
    v679:Toggle({
        Title = "Auto Deep Sea Quest",
        Desc = "Automatically complete Deep Sea Quest!",
        Value = false,
        Callback = function(p681)
            vu25 = p681
            task.spawn(function()
                while vu25 do
                    local v682 = vu678("Deep Sea Tracker"):lower()
                    if v682 ~= "" then
                        if string.find(v682, "100%%") then
                            vu668(- 3763, - 135, - 995, 180)
                        else
                            vu668(- 3599, - 276, - 1641)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    })
    v679:Button({
        Title = "Treasure Room",
        Callback = function()
            vu668(- 3601, - 283, - 1611)
        end
    })
    v679:Button({
        Title = "Sisyphus Statue",
        Callback = function()
            vu668(- 3698, - 135, - 1008)
        end
    })
    local v683 = QuestTab:Section({
        Title = "Element Quest"
    })
    local vu684 = v683:Paragraph({
        Title = "Element Panel",
        Desc = "Loading..."
    })
    v683:Toggle({
        Title = "Auto Element Quest",
        Desc = "Automatically teleport through Element Quest Stages!",
        Value = false,
        Callback = function(p685)
            vu26 = p685
            task.spawn(function()
                local v686 = false
                while vu26 and not v686 do
                    local v687, v688, v689 = vu678("Element Tracker"):gmatch("[^\n]+")
                    local v690 = {}
                    while true do
                        v689 = v687(v688, v689)
                        if v689 == nil then
                            break
                        end
                        table.insert(v690, v689:lower())
                    end
                    local v691 = vu5.Character
                    if v691 then
                        v691 = vu5.Character:FindFirstChild("HumanoidRootPart")
                    end
                    if v691 and # v690 >= 4 then
                        local v692 = v690[2]
                        local v693 = v690[4]
                        if string.find(v693, "100%%") then
                            if string.find(v693, "100%%") and not string.find(v692, "100%%") then
                                vu668(1453, - 22, - 636)
                            elseif string.find(v692, "100%%") then
                                vu668(1480, 128, - 593)
                                v686 = true
                                vu26 = false
                                vu684:SetDesc("Element Quest Completed!")
                            end
                        else
                            vu668(1484, 3, - 336, 180)
                        end
                    end
                    task.wait(2)
                end
            end)
        end
    })
    v683:Button({
        Title = "Secred Tample",
        Callback = function()
            vu668(1453, - 22, - 636)
        end
    })
    v683:Button({
        Title = "Underground Cellar",
        Callback = function()
            vu668(2136, - 91, - 701)
        end
    })
    v683:Button({
        Title = "Transcended Stones",
        Callback = function()
            vu668(1480, 128, - 593)
        end
    })
    task.spawn(function()
        while task.wait(2) do
            vu680:SetDesc(vu678("Deep Sea Tracker"))
            vu684:SetDesc(vu678("Element Tracker"))
        end
    end)
    UtilitiesTab:Section({
        Title = "Gift Skin"
    })
    UtilitiesTab:Button({
        Title = "Eclipse Katana",
        Callback = function()
            require(vu84:WaitForChild("Controllers"):WaitForChild("GiftingController")):Open("Eclipse Katana")
        end
    })
    UtilitiesTab:Button({
        Title = "Princess Parasol",
        Callback = function()
            require(vu84:WaitForChild("Controllers"):WaitForChild("GiftingController")):Open("Princess Parasol")
        end
    })
    UtilitiesTab:Section({
        Title = "Server Utility"
    })
    local vu701 = UtilitiesTab:Toggle({
        Title = "Anti Staff",
        Desc = "Auto kick if staff/developer joins the server",
        Value = false,
        Callback = function(p694)
            vu32 = p694
            local vu695 = 35102746
            local vu696 = {
                [2] = "OG",
                [3] = "Tester",
                [4] = "Moderator",
                [75] = "Community Staff",
                [79] = "Analytics",
                [145] = "Divers / Artist",
                [250] = "Devs",
                [252] = "Partner",
                [254] = "Talon",
                [255] = "Wildes",
                [55] = "Swimmer",
                [30] = "Contrib",
                [35] = "Contrib 2",
                [100] = "Scuba",
                [76] = "CC"
            }
            if p694 then
                task.spawn(function()
                    while vu32 do
                        local v697, v698, v699 = ipairs(game.Players:GetPlayers())
                        while true do
                            local v700
                            v699, v700 = v697(v698, v699)
                            if v699 == nil then
                                break
                            end
                            if v700 ~= game.Players.LocalPlayer and vu696[v700:GetRankInGroup(vu695)] then
                                game.Players.LocalPlayer:Kick("AnonHub Detected Staff, Automatically Kicked!")
                                return
                            end
                        end
                        task.wait(1)
                    end
                end)
            end
        end
    })
    vu237:Register("antiStaffToggle", vu701)
    local vu702 = {
        CurrencyCounter = vu8:WaitForChild("Events"):WaitForChild("Frame"):WaitForChild("CurrencyCounter"):WaitForChild("Counter").Text,
        Location = vu8:WaitForChild("Events"):WaitForChild("Frame"):WaitForChild("Location"):WaitForChild("Label").Text
    }
    local v703, v704, v705 = ipairs(vu5.Character:GetDescendants())
    local vu706 = {}
    while true do
        local v707, v708 = v703(v704, v705)
        if v707 == nil then
            break
        end
        v705 = v707
        if v708:IsA("BasePart") then
            vu706[v708] = v708.Transparency
        end
    end
    local vu718 = UtilitiesTab:Toggle({
        Title = "Streamer Mode",
        Desc = "This will hide the location, character, and coins.",
        Value = false,
        Callback = function(p709)
            if p709 then
                vu8:WaitForChild("Events"):WaitForChild("Frame").CurrencyCounter.Counter.Text = "SENSORED"
                vu8:WaitForChild("Events"):WaitForChild("Frame").Location.Label.Text = "SENSORED"
                local v710, v711, v712 = pairs(vu706)
                while true do
                    local v713
                    v712, v713 = v710(v711, v712)
                    if v712 == nil then
                        break
                    end
                    v712.Transparency = 1
                end
            else
                vu8:WaitForChild("Events"):WaitForChild("Frame").CurrencyCounter.Counter.Text = vu702.CurrencyCounter
                vu8:WaitForChild("Events"):WaitForChild("Frame").Location.Label.Text = vu702.Location
                local v714, v715, v716 = pairs(vu706)
                while true do
                    local v717
                    v716, v717 = v714(v715, v716)
                    if v716 == nil then
                        break
                    end
                    v716.Transparency = v717
                end
            end
        end
    })
    vu237:Register("streamerModeToggle", vu718)
    UtilitiesTab:Divider()
    local vu720 = UtilitiesTab:Toggle({
        Title = "Bypass Radar",
        Value = false,
        Callback = function(pu719)
            pcall(function()
                vu13.RF_Radar:InvokeServer(pu719)
            end)
        end
    })
    vu237:Register("radarToggle", vu720)
    local vu723 = UtilitiesTab:Toggle({
        Title = "Bypass Diving Gear",
        Value = false,
        Callback = function(p721)
            if p721 then
                local v722 = vu14.Client:GetReplion("Data")
                if v722 then
                    if v722:Get("EquippedOxygenTankId") ~= vu21.Data.Id then
                        vu13.RF_EquipDiving:InvokeServer(vu21.Data.Id)
                        print("Diving Gear: ON")
                    else
                        vu13.RF_UnequipDiving:InvokeServer()
                        print("Diving Gear: OFF")
                    end
                else
                    warn("Data Replion tidak ditemukan")
                end
            else
                print("Diving Gear Disabled (manual unequip)")
                vu13.RF_UnequipDiving:InvokeServer()
                return
            end
        end
    })
    vu237:Register("divingGearToggle", vu723)
    ShopTab:Section({
        Title = "Merchant Shop"
    })
    local vu724 = ShopTab:Paragraph({
        Title = "MERCHANT STOK PANEL",
        Desc = "Loading..."
    })
    ShopTab:Button({
        Title = "Open/Close Merchant",
        Callback = function()
            local v725 = vu8:FindFirstChild("Merchant")
            if v725 then
                if v725:IsA("ScreenGui") then
                    v725.Enabled = not v725.Enabled
                    return
                elseif v725:IsA("Frame") then
                    v725.Visible = not v725.Visible
                else
                    local v726 = v725:FindFirstChild("Main")
                    if v726 and v726:IsA("Frame") then
                        v726.Visible = not v726.Visible
                    end
                end
            else
                return
            end
        end
    })
    function UPX()
        local v727, v728, v729 = ipairs(vu11.ItemsFrame:GetChildren())
        local v730 = {}
        while true do
            local v731
            v729, v731 = v727(v728, v729)
            if v729 == nil then
                break
            end
            if v731:IsA("ImageLabel") and v731.Name ~= "Frame" then
                local v732 = v731:FindFirstChild("Frame")
                if v732 and v732:FindFirstChild("ItemName") then
                    local v733 = v732.ItemName.Text
                    if not string.find(v733, "Mystery") then
                        table.insert(v730, "- " .. v733)
                    end
                end
            end
        end
        if # v730 ~= 0 then
            vu724:SetDesc(table.concat(v730, "\n") .. "\n\n" .. vu11.RefreshMerchant.Text)
        else
            vu724:SetDesc("No items found\n" .. vu11.RefreshMerchant.Text)
        end
    end
    task.spawn(function()
        while task.wait(1) do
            pcall(UPX)
        end
    end)
    ShopTab:Button({
        Title = "Teleport To Merchant",
        Callback = function()
            local v734 = game.Players.LocalPlayer
            local v735 = (v734.Character or v734.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
            if v735 then
                v735.CFrame = CFrame.new(- 135.96412658691406, 3.143953323364258, 2766.11083984375)
            end
        end
    })
    ShopTab:Section({
        Title = "Purchase Rod"
    })
    ShopTab:Dropdown({
        Title = "Select Rod",
        Values = v85.Rod or {},
        Callback = function(p736)
            vu68 = p736
        end
    })
    ShopTab:Button({
        Title = "Purchase",
        Callback = function()
            if vu68 then
                local vu737 = RodLookupList[vu68]
                if vu737 then
                    pcall(function()
                        vu13.RF_PurchaseRod:InvokeServer(vu737)
                    end)
                else
                    vu587:Notify({
                        Title = "Error",
                        Content = "Rod ID Not Found!",
                        Duration = 2.5,
                        Icon = "circle-x"
                    })
                end
            else
                vu587:Notify({
                    Title = "Error",
                    Content = "Select Rod First!",
                    Duration = 2.5,
                    Icon = "circle-x"
                })
                return
            end
        end
    })
    ShopTab:Section({
        Title = "Purchase Bait"
    })
    ShopTab:Dropdown({
        Title = "Select Bait",
        Values = v85.Bait or {},
        Callback = function(p738)
            vu69 = p738
        end
    })
    ShopTab:Button({
        Title = "Purchase",
        Callback = function()
            if vu69 then
                local vu739 = BaitLookupList[vu69]
                if vu739 then
                    pcall(function()
                        vu13.RF_PurchaseBait:InvokeServer(vu739)
                    end)
                else
                    vu587:Notify({
                        Title = "Error",
                        Content = "Bait ID Not Found!",
                        Duration = 2.5,
                        Icon = "circle-x"
                    })
                end
            else
                vu587:Notify({
                    Title = "Error",
                    Content = "Select Bait First!",
                    Duration = 2.5,
                    Icon = "circle-x"
                })
                return
            end
        end
    })
    ShopTab:Section({
        Title = "Purchase Boat"
    })
    ShopTab:Dropdown({
        Title = "Select Boat",
        Values = v85.Boat,
        Callback = function(p740)
            vu70 = p740
            print("Selected Boat: " .. tostring(p740))
        end
    })
    ShopTab:Button({
        Title = "Purchase",
        Callback = function()
            if vu70 then
                local vu741 = BaitLookupList[vu70]
                if vu741 then
                    pcall(function()
                        vu13.RF_PurchaseBoat:InvokeServer(vu741)
                    end)
                else
                    vu587:Notify({
                        Title = "Error",
                        Content = "Boat ID Not Found!",
                        Duration = 2.5,
                        Icon = "circle-x"
                    })
                end
            else
                vu587:Notify({
                    Title = "Error",
                    Content = "Select Boat First!",
                    Duration = 2.5,
                    Icon = "circle-x"
                })
                return
            end
        end
    })
    TeleportTab:Section({
        Title = "Location"
    })
    vu237:Register("tpLocationDropdown", (TeleportTab:Dropdown({
        Title = "Choose Location",
        Values = v89,
        Value = "Ancient Jungle",
        Callback = function(p742)
            vu72 = p742
        end
    })))
    TeleportTab:Button({
        Title = "Teleport",
        Callback = function()
            if vu72 then
                local v743 = vu88[vu72]
                if v743 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v743) + Vector3.new(0, 3, 0)
                end
            else
                vu587:Notify({
                    Title = "Error",
                    Content = "Select location first!",
                    Duration = 2.5,
                    Icon = "circle-x"
                })
                return
            end
        end
    })
    TeleportTab:Section({
        Title = "Player"
    })
    local vu745 = TeleportTab:Dropdown({
        Title = "Select Player",
        Values = vu80(),
        Callback = function(p744)
            vu71 = p744
        end
    })
    TeleportTab:Button({
        Title = "Refresh",
        Callback = function()
            vu745:Refresh(vu80())
            vu587:Notify({
                Title = "Success",
                Content = "Berhasil me-refresh player list",
                Duration = 2.5,
                Icon = "laptop-minimal-check"
            })
        end
    })
    TeleportTab:Button({
        Title = "Go",
        Callback = function()
            if vu71 then
                local v746 = game.Players:FindFirstChild(vu71)
                if v746 and v746.Character and v746.Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v746.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                else
                    vu587:Notify({
                        Title = "Error",
                        Content = "Invalid player!",
                        Duration = 2.5,
                        Icon = "circle-x"
                    })
                end
            else
                vu587:Notify({
                    Title = "Error",
                    Content = "Select player first!",
                    Duration = 2.5,
                    Icon = "circle-x"
                })
                return
            end
        end
    })
    v579:OnDestroy(function()
        vu237:Save()
        if vu23.TotemActive then
            vu23.TotemActive = false
        end
        if vu584 then
            vu584 = false
        end
        if vu424 then
            vu424:Set(false)
        end
        if vu427 then
            vu427:Set(false)
        end
        if vu436 then
            vu436:Set(false)
        end
        if vu447 then
            vu447:Set(false)
        end
        if vu475 then
            vu475:Set(false)
        end
        if vu653 then
            vu653:Set(false)
        end
        if game.CoreGui:FindFirstChild("ToggleUIButton") then
            game.CoreGui.ToggleUIButton:Destroy()
        end
        if vu701 then
            vu701:Set(false)
        end
        vu720:Set(false)
        vu723:Set(false)
        vu5.Character.Humanoid.WalkSpeed = 16
        vu5.Character.Humanoid.JumpPower = 50
        vu593:Set(16)
        vu583:Set(50)
        vu405:Set(false)
        if vu46 then
            vu46 = false
        end
        vu718:Set(false)
        if vu586 then
            vu586 = false
            SetWalkOnWater(false)
            if vu585 then
                vu5.Character:PivotTo(vu585)
                vu587:Notify({
                    Title = "Auto Event Off",
                    Duration = 2.5
                })
            end
            vu580 = nil
            vu585 = nil
        else
            SetWalkOnWater(false)
        end
        if vu23.autoCountdownUpdate then
            vu23.autoCountdownUpdate = false
        end
        vu5.CameraMaxZoomDistance = 128
        vu5.CameraMinZoomDistance = 0.5
        if vu47 then
            vu47 = false
            local v747 = vu5.Character
            if v747 then
                local v748, v749, v750 = pairs(v747:GetDescendants())
                while true do
                    local v751
                    v750, v751 = v748(v749, v750)
                    if v750 == nil then
                        break
                    end
                    if v751:IsA("BasePart") then
                        v751.CanCollide = true
                    end
                end
            end
        end
        vu582()
        if vu27 then
            vu27 = false
            vu589(vu27)
        end
        local v752 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Small Notification")
        if v752 and v752:FindFirstChild("Display") then
            v752.Display.Visible = true
        end
        vu581 = 1
        vu323:Set(1)
        vu592()
        vu332:Set(false)
        if vu31 then
            vu31 = false
        end
    end)
    vu237:Load()
    print("?? AnonHub Berhasil Dimuat...")
    print("?? Happy Got Sikisss Brotherrrrr...")
else
    game:GetService("Players").LocalPlayer:Kick("AnonHub only works on Fish It brahhhhh!")
end
