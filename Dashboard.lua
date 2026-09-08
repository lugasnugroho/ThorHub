local Dashboard = {}

function Dashboard.Show(Config, GameID, GameName, Modules)

    print("")
    print("╔════════════════════════════════════════╗")
    print("║              ⚡ THORHUB ⚡              ║")
    print("╠════════════════════════════════════════╣")

    print("║ Name    :", Config.Name)
    print("║ Version :", Config.Version)
    print("║ Status  :", Config.Status)
    print("║ Creator :", Config.Creator)

    print("╠════════════════════════════════════════╣")

    print("║ Game    :", GameName)
    print("║ Game ID :", GameID)

    print("╠════════════════════════════════════════╣")
    print("║ Modules                                ║")

    for Name, Status in pairs(Modules) do

        local Icon

        if Status then
            Icon = "✅"
        else
            Icon = "❌"
        end

        print("║ " .. Icon .. " " .. Name)
    end

    print("╚════════════════════════════════════════╝")
    print("")
end

return Dashboard
