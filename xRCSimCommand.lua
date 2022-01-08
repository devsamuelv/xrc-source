obs = obslua
settings = {}

-- Script hook for defining the script description
function script_description()
	return [[
Send an xRCSim client chat command whenever a scene is activated.
]]
end

-- Script hook for defining the settings that can be configured for the script
function script_properties()
	local props = obs.obs_properties_create()

	obs.obs_properties_add_text(props, "xRCSim_SCORE_FILE", "File to output commands to (e.g. \\tmp\\xrcSim\\execute.txt)", obs.OBS_TEXT_DEFAULT)


	local scenes = obs.obs_frontend_get_scenes()
	
	if scenes ~= nil then
		for _, scene in ipairs(scenes) do
			local scene_name = obs.obs_source_get_name(scene)
			obs.obs_properties_add_bool(props, "scene_enabled_" .. scene_name, "Execute when '" .. scene_name .. "' is activated")
			obs.obs_properties_add_text(props, "scene_value_" .. scene_name, scene_name .. " value", obs.OBS_TEXT_DEFAULT)
		end
	end
	
	obs.source_list_release(scenes)
	
	return props
end

-- Script hook that is called whenver the script settings change
function script_update(_settings)	
	settings = _settings
end

-- Script hook that is called when the script is loaded
function script_load(settings)
	obs.obs_frontend_add_event_callback(handle_event)
end

function handle_event(event)
	if event == obs.OBS_FRONTEND_EVENT_SCENE_CHANGED then
		handle_scene_change()	
	end
end

function handle_scene_change()
	local scene = obs.obs_frontend_get_current_scene()
	local scene_name = obs.obs_source_get_name(scene)
	local scene_enabled = obs.obs_data_get_bool(settings, "scene_enabled_" .. scene_name)
	local xRCSim_SCORE_FILE = obs.obs_data_get_string(settings, "xRCSim_SCORE_FILE");
	if scene_enabled then
		file = io.open(xRCSim_SCORE_FILE, "w")
		io.output(file);
		local scene_value = obs.obs_data_get_string(settings, "scene_value_" .. scene_name)
		-- Replace \n strings with actual newlines
		scene_value = string.gsub(scene_value, "\\n", "\n")
		io.write(scene_value)
		io.close(file)
			
		-- os.execute(scene_value)
	end
	obs.obs_source_release(scene);
end
