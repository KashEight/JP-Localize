Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_JPLocalize_Menu", function(lang)
	for _, filename in pairs(file.GetFiles(JPLocalize._path .. "lang/")) do
		local str = filename:match('^(.*).json$')
		local langid = JPLocalize:GetOption("language")
		if str == JPLocalize._language[langid] then
			lang:load_localization_file(JPLocalize._path .. "lang/" .. filename)
			log("[JPLocalize Info] Selected language: " .. filename)
			break
		end
	end
	
	lang:load_localization_file(JPLocalize._path .. "lang/english.json", false)
	
end)

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_JPLocalize", function(menu_manager)
	MenuCallbackHandler.callback_jplocalize_language = function(self, item)
		JPLocalize._data.language = item:value()
		JPLocalize:Save()
	end

	JPLocalize:Load()
	JPLocalize:InitAllMenus()
end)
