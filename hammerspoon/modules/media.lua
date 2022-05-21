-- Next song
customKey:bind({}, "right", function()
    hs.eventtap.event.newSystemKeyEvent('NEXT', true):post()
    hs.eventtap.event.newSystemKeyEvent('NEXT', false):post()
end)

-- Prev song
customKey:bind({}, "left", function()
    hs.eventtap.event.newSystemKeyEvent('PREVIOUS', true):post()
    hs.eventtap.event.newSystemKeyEvent('PREVIOUS', false):post()
end)

-- Play / Pause
customKey:bind({}, "/", function()
    hs.eventtap.event.newSystemKeyEvent('PLAY', true):post()
    hs.eventtap.event.newSystemKeyEvent('PLAY', false):post()
end)

function changeVolume(diff)
    return function()
        local current = hs.audiodevice.defaultOutputDevice():volume()
        if not current then
            return
        end
        local new = math.min(100, math.max(0, math.floor(current + diff)))
        if new > 0 then
            hs.audiodevice.defaultOutputDevice():setMuted(false)
        end
        hs.alert.closeAll(0.0)
        hs.alert.show("Volume " .. new .. "%", {}, 0.5)
        hs.audiodevice.defaultOutputDevice():setVolume(new)
    end
end

customKey:bind({}, 'Down', changeVolume(-1))
customKey:bind({}, 'Up', changeVolume(1))
customKey:bind({}, 'm', function()
    local current = hs.audiodevice.defaultOutputDevice():volume()
    if not current then
        return
    end
    hs.audiodevice.defaultOutputDevice():setMuted(true)
end)
