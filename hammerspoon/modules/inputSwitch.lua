inputHotkey = { "alt" }

local function Chinese()
    hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
end

local function English()
    hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end

hs.hotkey.bind(inputHotkey, 'J', function()
    Chinese()
end)

hs.hotkey.bind(inputHotkey, 'K', function()
    English()
end)

local function cycleInputMethod()
    if hs.keycodes.currentSourceID() == "com.apple.keylayout.ABC" then
        hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
    elseif hs.keycodes.currentSourceID() == "com.apple.inputmethod.SCIM.ITABC" then
        hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
    end
end

hs.hotkey.bind(inputHotkey, '.', cycleInputMethod)
