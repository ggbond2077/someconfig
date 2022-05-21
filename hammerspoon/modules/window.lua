-- Hints, list all apps
customKey:bind({}, 'h', nil, function()
    hs.hints.windowHints(getAllValidWindows())
end)

-- Move Screen
customKey:bind({"shift"}, 'left', nil, function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    if ignored(w) then return end

    local s = w:screen():toWest()
    if s then
        undo:addToStack()
        w:moveToScreen(s)
    end
end)

customKey:bind({"shift"}, 'right', nil, function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    if ignored(w) then return end

    local s = w:screen():toEast()
    if s then
        undo:addToStack()
        w:moveToScreen(s)
    end
end)

function getAllValidWindows()
    local allWindows = hs.window.allWindows()
    local windows = {}
    local index = 1
    for i = 1, #allWindows do
        local w = allWindows[i]
        if w:screen() then
            windows[index] = w
            index = index + 1
        end
    end
    return windows
end
