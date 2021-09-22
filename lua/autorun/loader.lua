--[[
    Lua loader for all the addons made by Kapsulon
--]]

Kapsulon = Kapsulon or {}

Kapsulon.Loader = {}
Kapsulon.Loader.Version = 1

Kapsulon.Addons = {
    "crypto-trade",
    "scp-database",
    "better-noclip"
}

function Kapsulon.kprint(text)
    print("[KAPSULON] "..text)
end

function Kapsulon.kprintcolor(color, text)
    MsgC(color, "[KAPSULON] "..text)
end

print("")
Kapsulon.kprint("Starting initialization sequence...\n")

for _, i in pairs(Kapsulon.Addons) do
    if file.Exists("addons/"..i.."/manifest.json", "GAME") then
        Kapsulon.kprintcolor(Color(0, 255, 0), "Manifest file found for "..i.." !\n")

        local manifest = util.JSONToTable(file.Read("addons/"..i.."/manifest.json", "GAME"))

        Kapsulon.kprint("Initializing "..i.."... (Version "..manifest.addon_version..")")
        --if SERVER then AddCSLuaFile( manifest.loader_file_location .. "/loader.lua" ) include( manifest.loader_file_location .. "/loader.lua" ) else include( manifest.loader_file_location .. "/loader.lua" ) end
        Kapsulon.kprint("Initialized "..i.." (Version "..manifest.addon_version..") Successfully !")
    else
        Kapsulon.kprintcolor(Color(255, 0, 0), "Manifest file not found for "..i.."...\n")
    end
end

print("")
Kapsulon.kprint("Initialization sequence finished !")