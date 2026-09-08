--[[
    ⚡ THORHUB
    Modular Remote Loader
    Educational Project
]]

-- =========================================
-- BASE URL
-- =========================================

local BASE_URL =
    "https://raw.githubusercontent.com/lugasnugroho/ThorHub/main/"


-- =========================================
-- REMOTE FILES
-- =========================================

local ConfigURL =
    BASE_URL .. "Config.lua"

local GameListURL =
    BASE_URL .. "GameList.lua"

local UtilsURL =
    BASE_URL .. "Modules/Utils.lua"

local UIURL =
    BASE_URL .. "Modules/UI.lua"

local DashboardURL =
    BASE_URL .. "Modules/Dashboard.lua"


-- =========================================
-- REMOTE LOADER
-- =========================================

local function LoadRemote(URL)

    local Success, Result = pcall(function()

        local Source = game:HttpGet(URL)

        local Chunk = loadstring(Source)

        if not Chunk then
            error("Source bukan Lua yang valid.")
        end

        return Chunk()

    end)

    if not Success then

        warn("❌ Gagal memuat:")
        warn(URL)
        warn(Result)

        return nil
    end

    return Result
end


-- =========================================
-- START
-- =========================================

print("")
print("========================================")
print("          ⚡ THORHUB STARTING")
print("========================================")
print("")


-- =========================================
-- CONFIG
-- =========================================

print("📦 Loading Config...")

local Config = LoadRemote(ConfigURL)

if not Config then
    warn("❌ Config gagal dimuat.")
    return
end

print("✅ Config berhasil dimuat.")
print("")


-- =========================================
-- UTILS
-- =========================================

print("📦 Loading Utils...")

local Utils = LoadRemote(UtilsURL)

if not Utils then
    warn("❌ Utils gagal dimuat.")
    return
end

print("✅ Utils berhasil dimuat.")
print("")


-- =========================================
-- UI
-- =========================================

print("📦 Loading UI...")

local UI = LoadRemote(UIURL)

if not UI then
    warn("❌ UI gagal dimuat.")
    return
end

print("✅ UI berhasil dimuat.")
print("")


-- =========================================
-- DASHBOARD
-- =========================================

print("📦 Loading Dashboard...")

local Dashboard = LoadRemote(DashboardURL)

if not Dashboard then
    warn("❌ Dashboard gagal dimuat.")
    return
end

print("✅ Dashboard berhasil dimuat.")
print("")


-- =========================================
-- HEADER
-- =========================================

Utils.PrintHeader(
    Config.Name,
    Config.Version
)


-- =========================================
-- GAME LIST
-- =========================================

print("📦 Loading GameList...")

local GameList = LoadRemote(GameListURL)

if not GameList then
    warn("❌ GameList gagal dimuat.")
    return
end

print("✅ GameList berhasil dimuat.")
print("")


-- =========================================
-- DETECT GAME
-- =========================================

local GameID = game.GameId

print("🔍 Mendeteksi game...")
print("Game ID:", GameID)
print("")


-- =========================================
-- FIND GAME
-- =========================================

local GameData = GameList[GameID]


-- =========================================
-- UNSUPPORTED GAME
-- =========================================

if not GameData then

    UI.Show(
        "⚡ THORHUB",
        "Game belum didukung."
    )

    Dashboard.Show(
        Config,
        GameID,
        "Unknown",
        {
            Config = true,
            Utils = true,
            UI = true,
            Dashboard = true,
            GameList = true,
            Game = false
        }
    )

    print("❌ Game belum terdaftar.")
    print("Game ID:", GameID)

    return
end


-- =========================================
-- GAME FOUND
-- =========================================

local GameURL
local GameName


-- Support format table:
-- {
--     Name = "Game A",
--     URL = "https://..."
-- }

if type(GameData) == "table" then

    GameURL = GameData.URL
    GameName = GameData.Name or "Unknown"

else

    -- Support format lama:
    -- [GameID] = "URL"

    GameURL = GameData
    GameName = "Supported Game"

end


-- =========================================
-- SHOW GAME INFO
-- =========================================

Utils.PrintGame(
    GameID,
    GameName
)


-- =========================================
-- GAME URL CHECK
-- =========================================

if not GameURL then

    warn("❌ Game ditemukan tetapi URL tidak tersedia.")

    Dashboard.Show(
        Config,
        GameID,
        GameName,
        {
            Config = true,
            Utils = true,
            UI = true,
            Dashboard = true,
            GameList = true,
            Game = false
        }
    )

    return
end


-- =========================================
-- SHOW DASHBOARD
-- =========================================

Dashboard.Show(
    Config,
    GameID,
    GameName,
    {
        Config = true,
        Utils = true,
        UI = true,
        Dashboard = true,
        GameList = true,
        Game = false
    }
)


-- =========================================
-- LOAD GAME MODULE
-- =========================================

print("📦 Loading Game Module...")
print("URL:", GameURL)
print("")


local GameModule = LoadRemote(GameURL)


if not GameModule then

    warn("❌ Game Module gagal dimuat.")

    Dashboard.Show(
        Config,
        GameID,
        GameName,
        {
            Config = true,
            Utils = true,
            UI = true,
            Dashboard = true,
            GameList = true,
            Game = false
        }
    )

    return
end


-- =========================================
-- SUCCESS
-- =========================================

print("")
print("========================================")
print("        ⚡ THORHUB LOADED")
print("========================================")
print("")
print("Name    :", Config.Name)
print("Version :", Config.Version)
print("Status  :", Config.Status)
print("Creator :", Config.Creator)
print("")
print("Game    :", GameName)
print("Game ID :", GameID)
print("")
print("🔥 Semua module berhasil dimuat.")
print("========================================")
print("")


-- =========================================
-- FINAL DASHBOARD
-- =========================================

Dashboard.Show(
    Config,
    GameID,
    GameName,
    {
        Config = true,
        Utils = true,
        UI = true,
        Dashboard = true,
        GameList = true,
        Game = true
    }
)
