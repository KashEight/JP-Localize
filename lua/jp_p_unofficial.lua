local _play_original = PlayerSound._play
local sound_callback_original = PlayerSound.sound_callback

function PlayerSound:_play(sound_name, source_name)
	if source_name then
		source = Idstring(source_name)
	end
	if source then
		log(sound_name .. ", " .. source)
	end
	log(tostring(self._unit))
	if sound_name == "dsp_radio_checking_1" then
		self._counter = 0
		function self.sound_callback(...) -- ここで関数再定義することで引数を使用する必要がなくなる
			self._counter = self._counter + 1
			if self._counter == 2 then
				local args = {...}
				local dur = tostring(args[5])
				log("duration: " .. dur) -- debug
				local subtitles = {}
				subtitles.russian = {["1.5005897283554"] = "n_pr_russian_a01", ["2.8662133216858"] = "n_pr_russian_a02", ["2.1580047607422"] = "n_pr_russian_a03", ["3.0011794567108"] = "n_pr_russian_a04", ["1.5862132310867"] = "n_pr_russian_a05", ["2.4772789478302"] = "n_pr_russian_a06", ["3.2362813949585"] = "n_pr_russian_a07", ["3.2783675193787"] = "n_pr_russian_a08", ["3.2580499649048"] = "n_pr_russian_a09", ["1.684898018837"] = "n_pr_russian_a10", ["2.2784581184387"] = "n_pr_russian_a11", ["6.7439460754395"] = "n_pr_russian_a12", ["1.4265760183334"] = "n_pr_russian_a13", ["4.1026759147644"] = "n_pr_russian_a14", ["2.1725172996521"] = "n_pr_russian_a15", ["4.1679821014404"] = "n_pr_russian_a16", ["4.1955556869507"] = "n_pr_russian_a17", ["3.4452610015869"] = "n_pr_russian_a18", ["2.1667120456696"] = "n_pr_russian_a19", ["6.9892067909241"] = "n_pr_russian_a20", ["5.0837187767029"] = "n_pr_russian_a21", ["2.5672564506531"] = "n_pr_russian_a22", ["1.5571882724762"] = "n_pr_russian_a23", ["3.3770523071289"] = "n_pr_russian_a24", ["2.1246259212494"] = "n_pr_russian_a25", ["3.1361451148987"] = "n_pr_russian_a26", ["4.6091613769531"] = "n_pr_russian_a27", ["2.5353288650513"] = "n_pr_russian_a28", ["1.5992745161057"] = "n_pr_russian_a29", ["4.6846261024475"] = "n_pr_russian_a30", ["5.5147395133972"] = "n_pr_russian_a31", ["2.1101133823395"] = "n_pr_russian_a32", ["2.4511566162109"] = "n_pr_russian_a33", ["5.1867575645447"] = "n_pr_russian_a34", ["1.4889796972275"] = "n_pr_russian_a35", ["2.1130158901215"] = "n_pr_russian_a36"}
				subtitles.american = {["2.9953744411469"] = "n_pr_american_a01", ["1.1247166395187"] = "n_pr_american_a02", ["3.494603395462"] = "n_pr_american_a03", ["3.5439457893372"] = "n_pr_american_a04", ["1.5528345108032"] = "n_pr_american_a05", ["2.6122450828552"] = "n_pr_american_a06", ["4.8631296157837"] = "n_pr_american_a07", ["3.0679366588593"] = "n_pr_american_a08", ["2.0273923873901"] = "n_pr_american_a09", ["2.5309751033783"] = "n_pr_american_a10", ["1.4106123447418"] = "n_pr_american_a11", ["2.0215873718262"] = "n_pr_american_a12", ["1.5136507749557"] = "n_pr_american_a13", ["4.1853971481323"] = "n_pr_american_a14", ["1.1740590333939"] = "n_pr_american_a15", ["2.6572337150574"] = "n_pr_american_a16", ["1.3627210855484"] = "n_pr_american_a17", ["1.754557967186"] = "n_pr_american_a18", ["1.0057142972946"] = "n_pr_american_a19", ["2.372789144516"] = "n_pr_american_a20", ["2.6151475906372"] = "n_pr_american_a21", ["1.5600907802582"] = "n_pr_american_a22", ["3.108571767807"] = "n_pr_american_a23", ["3.2638552188873"] = "n_pr_american_a24", ["1.223401427269"] = "n_pr_american_a25", ["2.7268934249878"] = "n_pr_american_a26", ["2.503401517868"] = "n_pr_american_a27", ["3.2986850738525"] = "n_pr_american_a28", ["4.597550868988"] = "n_pr_american_a29", ["4.2753744125366"] = "n_pr_american_a30", ["2.3248980045319"] = "n_pr_american_a31", ["2.1246259212494"] = "n_pr_american_a32", ["3.2711112499237"] = "n_pr_american_a33", ["3.7485716342926"] = "n_pr_american_a34", ["3.957551240921"] = "n_pr_american_a35", ["4.9327893257141"] = "n_pr_american_a36", ["3.5686168670654"] = "n_pr_american_a37", ["2.2334694862366"] = "n_pr_american_a38", ["4.24054479599"] = "n_pr_american_a39", ["2.5643539428711"] = "n_pr_american_a40", ["2.8662133216858"] = "n_pr_american_a41", ["0.82575970888138"] = "n_pr_american_a42", ["1.9606349468231"] = "n_pr_american_a43"}
				subtitles.spanish = {["1.5992745161057"] = "n_pr_spanish_a01", ["1.8488889932632"] = "n_pr_spanish_a02", ["1.8546938896179"] = "n_pr_spanish_a03", ["4.6193199157715"] = "n_pr_spanish_a04", ["0.85623586177826"] = "n_pr_spanish_a05", ["1.0550566911697"] = "n_pr_spanish_a06", ["0.90993201732635"] = "n_pr_spanish_a07", ["2.1362359523773"] = "n_pr_spanish_a08", ["1.6994104385376"] = "n_pr_spanish_a09", ["1.8053514957428"] = "n_pr_spanish_a10", ["2.1739683151245"] = "n_pr_spanish_a11", ["2.7776870727539"] = "n_pr_spanish_a12", ["0.96798193454742"] = "n_pr_spanish_a13"}
				subtitles.german = {["5.8456239700317"] = "n_pr_german_a01", ["5.3318824768066"] = "n_pr_german_a02", ["10.550566673279"] = "n_pr_german_a03", ["7.8628573417664"] = "n_pr_german_a04", ["5.3710660934448"] = "n_pr_german_a05", ["5.7803177833557"] = "n_pr_german_a06", ["4.3711566925049"] = "n_pr_german_a07", ["2.4322903156281"] = "n_pr_german_a08", ["4.5757822990417"] = "n_pr_german_a09", ["4.2652153968811"] = "n_pr_german_a10", ["4.7092971801758"] = "n_pr_german_a11", ["5.0314745903015"] = "n_pr_german_a12", ["3.3886623382568"] = "n_pr_german_a13", ["4.4045352935791"] = "n_pr_german_a14", ["5.2128801345825"] = "n_pr_german_a15", ["2.9895691871643"] = "n_pr_german_a16", ["4.5177326202393"] = "n_pr_german_a17", ["2.2189571857452"] = "n_pr_german_a18", ["8.0979595184326"] = "n_pr_german_a19", ["3.7645354270935"] = "n_pr_german_a20", ["9.7770519256592"] = "n_pr_german_a21", ["5.0343766212463"] = "n_pr_german_a22", ["6.4406352043152"] = "n_pr_german_a23", ["5.0430841445923"] = "n_pr_german_a24", ["6.1648983955383"] = "n_pr_german_a25", ["5.339138507843"] = "n_pr_german_a26", ["1.7081179618835"] = "n_pr_german_a27", ["7.1053066253662"] = "n_pr_german_a28", ["7.4913382530212"] = "n_pr_german_a29", ["6.9746942520142"] = "n_pr_german_a30", ["7.0458054542542"] = "n_pr_german_a31", ["4.424852848053"] = "n_pr_german_a32", ["5.3507490158081"] = "n_pr_german_a33", ["4.6643090248108"] = "n_pr_german_a34"}
				subtitles.old_hoxton = {}
				subtitles.jowi = {}
				subtitles.female_1 = {}
				subtitles.dragan = {}
				subtitles.jacket = {}
				subtitles.bonnie = {}
				subtitles.sokol = {}
				subtitles.dragon = {}
				subtitles.bodhi = {}
				subtitles.jimmy = {}
				subtitles.sydney = {}
				subtitles.wild = {}
				subtitles.chico = {}
				subtitles.max = {}
				local char = managers.criminals:character_name_by_unit(self._unit)
				if char and subtitles[tostring(char)] then
					local subtitle = subtitles[tostring(char)][dur]
				end
				if subtitle then
					managers.subtitle:set_visible(true)
					managers.subtitle:set_enabled(true)
					managers.subtitle:clear_subtitle()
					managers.subtitle:show_subtitle(subtitle, args[5]) -- TODO: avoid crashing and error
				end
			end
			log("clbk: " .. tostring(instance) .. ", " .. tostring(event_type) .. ", " .. tostring(unit))
			sound_callback_original(...)
		end
	end
	log("event_b: " .. tostring(self._unit:sound_source(source):post_event(sound_name, self.sound_callback, self._unit, "marker", "end_of_event")))
	local event = self._unit:sound_source(source):post_event(sound_name, self.sound_callback, self._unit, "marker", "duration", "end_of_event")
	log("event_a: " .. tostring(event))
	return event
end

--[[
function PlayerSound:sound_callback(instance, event_type, unit, sound_source, label, identifier, position)
	log("clbk: " .. tostring(instance) .. ", " .. tostring(event_type) .. ", " .. tostring(unit))
	sound_callback_original(self, instance, event_type, unit, sound_source, label, identifier, position)
end
--]]