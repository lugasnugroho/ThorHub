local ConfigURL = "https://raw.githubusercontent.com/lugasnugroho/ThorHub/main/Config.lua"
local GameListURL = "https://raw.githubusercontent.com/lugasnugroho/ThorHub/main/GameList.lua"
local UtilsURL = "https://raw.githubusercontent.com/lugasnugroho/ThorHub/main/Modules/Utils.lua"

-- CONFIG
local ConfigSource = game:HttpGet(ConfigURL)
local Config = loadstring(ConfigSource)()

-- UTILS
local UtilsSource = game:HttpGet(UtilsURL)
local Utils = loadstring(UtilsSource)()

Utils.PrintHeader(Config.Name, Config.Version)

-- GAME LIST
local GameListSource = game:HttpGet(GameListURL)
local GameList = loadstring(GameListSource)()

local GameID = game.GameId
local GameURL = GameList[GameID]

Utils.PrintGame(GameID, GameURL or "Unknown")

if not GameURL then
    print("❌ Game belum didukung ThorHub.")
    return
end

print("✅ Game ditemukan!")
print("Loading game script...")

local GameSource = game:HttpGet(GameURL)
loadstring(GameSource)()
