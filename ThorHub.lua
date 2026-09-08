local ConfigURL = "https://raw.githubusercontent.com/lugasnugroho/ThorHub/main/Config.lua"
local GameListURL = "https://raw.githubusercontent.com/lugasnugroho/ThorHub/main/GameList.lua"

-- Ambil Config
local ConfigSource = game:HttpGet(ConfigURL)
local Config = loadstring(ConfigSource)()

print("================================")
print("        ⚡ " .. Config.Name)
print("================================")
print("Version :", Config.Version)
print("Status  :", Config.Status)

-- Ambil GameList
local GameListSource = game:HttpGet(GameListURL)
local GameList = loadstring(GameListSource)()

-- Cari game yang sedang dimainkan
local GameID = game.GameId
local GameURL = GameList[GameID]

print("Game ID :", GameID)

if not GameURL then
    print("ThorHub Not Support")
    return
end

print("Wait Bos")
print("Loading game script...")

local GameSource = game:HttpGet(GameURL)
loadstring(GameSource)()
