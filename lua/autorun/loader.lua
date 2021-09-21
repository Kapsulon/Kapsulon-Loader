--[[
    Lua loader for all the addons made by Kapsulon
--]]

Kapsulon = Kapsulon or {}

Kapsulon.Addons = {
    "crypto-trade",
    "scp-database",
    "better-noclip"
}

for i in pairs(Kapsulon.Addons) do
    print(file.Exists("addons/"..i.."lua/autorun/", path))
--file.Exists("", "GAME")