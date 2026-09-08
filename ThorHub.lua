local ConfigURL = "https://raw.githubusercontent.com/lugasnugroho/ThorHub/main/Config.lua"

local Source = game:HttpGet(ConfigURL)
local Config = loadstring(Source)()

print("================================")
print("        ⚡ THORHUB ⚡")
print("================================")
print("Name    :", Config.Name)
print("Version :", Config.Version)
print("Status  :", Config.Status)
print("Creator :", Config.Creator)
print("--------------------------------")
print(Config.Message)
print("================================")
