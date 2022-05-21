-- Custom key modal, f16 map by karabiner
customKey = hs.hotkey.modal.new({}, "F17")
local pressedF16 = function()
	customKey:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
local releasedF16 = function()
	customKey:exit()
end

-- karabiner left_ctrl = F16
hs.hotkey.bind({}, 'F16', pressedF16, releasedF16)

-- reload
customKey:bind({}, "r", function()
	hs.reload()
end)

require "modules.inputSwitch"
require "modules.autoInputSwitch"
require "modules.wifi"
require "modules.window"
require "modules.media"
