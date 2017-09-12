if not TimerGui.jpmod_init then
	TimerGui.jpmod_init = TimerGui.init
end
function TimerGui:init(unit)
	local res = self:jpmod_init(unit)
	local timer_header_text = managers.localization:text("prop_timer_gui_estimated_time")
	self._gui_script.time_header_text:set_text(timer_header_text)
	return res
end