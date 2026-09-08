local Utils = {}

function Utils.PrintHeader(name, version)
    print("================================")
    print("          ⚡ " .. name)
    print("================================")
    print("Version :", version)
    print("--------------------------------")
end

function Utils.PrintGame(gameId, gameName)
    print("Game ID :", gameId)
    print("Game    :", gameName)
end

return Utils
