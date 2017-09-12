local function loadcustommenu(menu)
	MenuCallbackHandler.change_language_jp = function(self, item)
		local value = item.value and type(item.value) == "function" and item:value() or 1
		self._languageoption = value == 2 and "japanese" or "english"
	end
	MenuCallbackHandler.close_change_language_menu = function(self, item)
		if self._languageoption then
			local japaneseRead = io.open("japanese/japanese_language.txt", "w")
			japaneseRead:write(tostring(self._languageoption))
			io.close(japaneseRead)
		end
	end
	local video_node = menu.data._nodes.video
	table.insert(video_node._parameters.back_callback, callback(MenuCallbackHandler, MenuCallbackHandler, "close_change_language_menu"))
	local add_item_params = {
		{
			node = "video",
			insert_pos = 4,
			default_value = managers.localization._jp_mode and 2 or 1, 
			params = {
				name = "change_language_button_change",
				text_id = "LANGUAGE", to_upper = false,
				localize = false,
				callback = "change_language_jp"
			}, 
			data_node = {
				{
					_meta = "option",
					text_id = "ENGLISH",
					localize = false,
					value = 1
				}, 
				{
					_meta = "option",
					text_id = "JAPANESE",
					localize = false,
					value = 2
				};
				type = "MenuItemMultiChoice"
			}
		}
	}
	if not add_item_params then
		for i,data in pairs({}) do
		end
		if data.node then
			local node = menu.data:get_node(data.node)
		end
		if node then
			local params = data.params
			local data_node = data.data_node
			local nt_item = node:item(params.name)
		if params and not nt_item then
			end
			local new_item = node:create_item(data_node, params)
			if data_node and data.default_value then
				new_item:set_value(data.default_value)
			end
			new_item:set_callback_handler(MenuCallbackHandler)
			node:insert_item(new_item, data.insert_pos or 1)
		end
	end
end

Hooks:Add("MenuManagerPostInitialize", "MenuManagerPostInitialize_JPMOD_MENU", function(menu_manager)
	-- upvalues: loadcustommenu
	local menu_names = {"menu_main", "menu_pause"}
	for k,v in pairs(menu_names) do
		local menu = menu_manager._registered_menus[v]
		if menu then
			loadcustommenu(menu)
		end
	end
end
)