if not Steam then
    return
end

JPLocalize = JPLocalize or {}

if not JPLocalize._setup then
    JPLocalize._language = {
        [1] = English,
        [2] = japanese
    }
    JPLocalize._path = ModPath
    JPLocalize._data = {}
    JPLocalize._menu = {
        "change_language_jp"
    }

    JPLocalize._setup = true
end