--[[
    Lua loader for all the addons made by Kapsulon
--]]

Kapsulon = Kapsulon or {}

Kapsulon.Loader = {}
Kapsulon.Loader.Version = 1
Kapsulon.Loader.AutoUpdate = false
Kapsulon.Loader.SelfUpdate = true

Kapsulon.Addons = {
    "crypto-trade",
    "scp-database",
    "better-noclip"
}

function Kapsulon.kprint(text)
    print("[KAPSULON] "..text)
end

if Kapsulon.Loader.SelfUpdate then
    Kapsulon.kprint("\nChecking if an update is available...")
    
end


Kapsulon.kprint("\nStarting initialization sequence...\n")

for _, i in pairs(Kapsulon.Addons) do
    if file.Exists("addons/"..i.."/manifest.json", "GAME") then
        Kapsulon.kprint("Manifest file found for "..i.." !")

        local manifest = util.JSONToTable(file.Read("addons/"..i.."/manifest.json", "GAME"))

        Kapsulon.kprint("Initializing "..i.."... (Version "..manifest.addon_version..")")
        if SERVER then AddCSLuaFile( manifest.loader_file_location .. "/loader.lua" ) include( manifest.loader_file_location .. "/loader.lua" ) else include( manifest.loader_file_location .. "/loader.lua" ) end
        Kapsulon.kprint("Initialized "..i.." (Version "..manifest.addon_version..") Successfully !")
    else
        Kapsulon.kprint("Manifest file not found for "..i.."...")
    end
end

Kapsulon.kprint("\nInitialization sequence finished !")