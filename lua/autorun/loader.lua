--[[
    Lua loader for all the addons made by Kapsulon
--]]

Kapsulon = Kapsulon or {}

Kapsulon.Loader = {}
Kapsulon.Loader.Version = "0.1"

Kapsulon.Addons = {
    "crypto-trade",
    "scp-database",
    "better-noclip"
}

function kprint(text)
    print("[KAPSULON] "..text)
end

kprint("\nStarting initialization sequence...\n")

for _, i in pairs(Kapsulon.Addons) do
    if file.Exists("addons/"..i.."/manifest.json", "GAME") then
        kprint("Manifest file found for "..i.." !")

        local manifest = util.JSONToTable(file.Read("addons/"..i.."/manifest.json", "GAME"))

        kprint("Initializing "..i.."... (Version "..manifest.addon_version..")")
        if SERVER then AddCSLuaFile( manifest.loader_file_location .. "/loader.lua" ) include( manifest.loader_file_location .. "/loader.lua" ) else include( manifest.loader_file_location .. "/loader.lua" ) end
        kprint("Initialized "..i.." (Version "..manifest.addon_version..") Successfully !")
    else
        kprint("Manifest file not found for "..i.."...")
    end
end

kprint("\nInitialization sequence finished !")