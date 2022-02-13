-- this script periodically deactivates xscreensaver
-- when video playback is active

local function heartbeat()
    if mp.get_property_native("pause") or
       mp.get_property_native("idle")  or
       not mp.get_property_native("vo-configured") then
        return
    end

    mp.command_native_async(
        {
          name           = "subprocess",
          args           = { "xscreensaver-command", "-deactivate" },
          capture_stdout = true,
        },
        function () end)
end

mp.add_periodic_timer(60, heartbeat)

for _, prop in ipairs({"pause", "idle", "vo-configured"}) do
    mp.observe_property(prop, nil, heartbeat)
end
