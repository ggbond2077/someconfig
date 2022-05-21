-- karabiner left_ctrl = F16
f16key = hs.hotkey.modal.new({}, "F16")
-- reload
f16key:bind({}, "r", function()
	hs.reload()
end)

require "modules.inputSwitch"
require "modules.autoInputSwitch"
require "modules.wifi"
require "modules.window"
require "modules.media"
