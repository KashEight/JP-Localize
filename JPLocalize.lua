if not Steam then
    return
end

JPLocalize = JPLocalize or {}

if not JPLocalize._setup then
    JPLocalize._language = {
        [1] = "english",
        [2] = "japanese"
    }
    JPLocalize._path = ModPath
    JPLocalize._lang_path = ModPath .. "lua/lang"
    JPLocalize._data = {}
    JPLocalize._data_path = SavePath .. "JPLocalize.json"
    JPLocalize._menus = {
        "jplocalize_option"
    }
    JPLocalize._hook_files = {
        ["lib/managers/localizationmanager"] = "jp_m_unofficial.lua",
        ["lib/units/beings/player/playersound"] = "jp_p_unofficial.lua",
        ["lib/managers/menumanager"] = "jp_mn_unofficial.lua",
        ["lib/units/props/timergui"] = "jp_tg_unofficial.lua"
    }

    function JPLocalize:Save()
        local file = io.open(self._data_path, "w+")
        if file then
            file:write(json.encode(self._data))
            file:close()
        end
    end

    function JPLocalize:Load()
        self:LoadDefault()
        local file = io.open(self._data_path, "r")
        if file then
            local config = json.decode(file:read("*a"))
            file:close()
            for k, v in pairs(config) do
                self._data[k] = v
            end
        end
        self:Save()
    end

    function JPLocalize:LoadDefault()
        local default_file = io.open(self._path .. "menu/jplocalize_default.json")
        self._data = json.decode(default_file:read("*a"))
        default_file:close()
    end

    function JPLocalize:InitAllMenus()
	    for _, menu in pairs(self._menus) do
	        MenuHelper:LoadFromJsonFile(self._path .. "menu/" .. menu .. ".json", self, self._data)
	    end
	end

    function JPLocalize:GetOption(id)
        return self._data[id]
    end

    JPLocalize:Load()
    JPLocalize._setup = true
    log("[JPLocalize Info] JPLocalize was successfully loaded!")

end

function doScript(script)
    local base_script = script:lower()
    if JPLocalize._hook_files[base_script] then
        local file_name = JPLocalize._path .. "lua/" .. JPLocalize._hook_files[base_script]
        if io.file_is_readable(file_name) then
            dofile(file_name)
        else
            log("[JPLocalize Error] BLT could not open script '" .. file_name .. "'.")
        end
    else
        log("[JPLocalize Error] Unregistered script called: " .. baseScript)
    end
end

if RequiredScript then
    doScript(RequiredScript)
end