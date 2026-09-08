--[[
    ⚡ THORHUB
    Modular Remote Loader
    Educational Project
]]

-- =========================================
-- URL CONFIGURATION
-- =========================================

local BASE_URL = "https://raw.githubusercontent.com/lugasnugroho/ThorHub/main/"

local ConfigURL = BASE_URL .. "Config.lua"
local GameListURL = BASE_URL .. "GameList.lua"
local UtilsURL = BASE_URL .. "Modules/Utils.lua"
local UIURL = BASE_URL .. "Modules/UI.lua"


-- =========================================
-- HELPER
-- =========================================

local function LoadRemote(URL)
    local Success, Result = pcall(function()
        local Source = game:HttpGet(URL)
        return loadstring(Source)()
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
-- LOAD CONFIG
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
-- LOAD UTILS
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
-- LOAD UI
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
-- HEADER
-- =========================================

Utils.PrintHeader(
    Config.Name,
    Config.Version
)


-- =========================================
-- LOAD GAME LIST
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
-- DETECT CURRENT GAME
-- =========================================

local GameID = game.GameId

print("🔍 Mendeteksi game...")
print("Game ID:", GameID)
print("")


-- =========================================
-- FIND GAME
-- =========================================

local GameURL = GameList[GameID]


if not GameURL then

    UI.Show(
        "⚡ THORHUB",
        "Game belum didukung."
    )

    print("❌ Game belum terdaftar di ThorHub.")
    print("Game ID:", GameID)

    return
end


-- =========================================
-- GAME FOUND
-- =========================================

UI.Show(
    "⚡ THORHUB",
    "Game berhasil ditemukan!"
)

print("✅ GAME FOUND")
print("----------------------------------------")
print("Game ID :", GameID)
print("URL     :", GameURL)
print("----------------------------------------")
print("")


-- =========================================
-- LOAD GAME MODULE
-- =========================================

print("📦 Loading Game Module...")

local GameModule = LoadRemote(GameURL)

if not GameModule then
    warn("❌ Game Module gagal dimuat.")
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
print("Game ID :", GameID)
print("========================================")


-- =========================================
-- FINAL UI
-- =========================================

UI.Show(
    "⚡ " .. Config.Name,
    "System berhasil dimuat!"
)

print("")
print("🔥 ThorHub siap digunakan.")
print("")
