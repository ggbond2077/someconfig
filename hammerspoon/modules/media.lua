-- Next song
f16key:bind({}, "right", function()
    hs.eventtap.event.newSystemKeyEvent('NEXT', true):post()
    hs.eventtap.event.newSystemKeyEvent('NEXT', false):post()
end)

-- Prev song
f16key:bind({}, "left", function()
    hs.eventtap.event.newSystemKeyEvent('PREVIOUS', true):post()
    hs.eventtap.event.newSystemKeyEvent('PREVIOUS', false):post()
end)

-- Play / Pause
f16key:bind({}, "/", function()
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

f16key:bind({}, 'Down', changeVolume(-1))
f16key:bind({}, 'Up', changeVolume(1))
