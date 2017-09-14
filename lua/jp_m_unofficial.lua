local lang = {}
local lua_file = {}
local content = {}
for k, l in ipairs(JPLocalize._language) do
	for _, filename in pairs(file.GetFiles(JPLocalize._lang_path)) do
		local str = filename:match('^(.*).lua$')
		if str == l then
			lang[k] = l
			table.insert(lua_file, filename)
		end
	end
end
local langid = JPLocalize:GetOption("language")
local lang_file = io.open(JPLocalize._lang_path .. lua_file[langid], "r")
if lang_file then
	local text = lang_file:read("*a")
	lang_file:close()
	local data = assert(loadstring("local func_text = {\n" .. text .. "\n}return func_text"))()
	for id, name in pairs(data) do
		if name ~= "" then
			content[id] = name
		end
	end
	LocalizationManager:add_localized_strings(content)
end

function LocalizationManager:text(str, macros)
	if self._custom_localizations[str] then
		local return_str = self._custom_localizations[str]
		self._macro_context = macros
		return_str = self:_localizer_post_process(return_str)
		self._macro_context = nil
		if macros and type(macros) == "table" then
			for k,v in pairs(macros) do
				return_str = return_str:gsub("$" .. k, v)
			end
		end
		return return_str
	end
	return self.orig.text(self, str, macros)
end