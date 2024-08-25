function data()
return {
	info = {
		minorVersion = 1,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "waggon", "schuettgut", "deutschland", "germany", "UIC", "gueterwagen", "db" },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

		params = {
			{
				key = "kbs442_fake",
				name = _("Fake_kbs442_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_wagen_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},

	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["442_fake.mdl"] = true,
			["442_2_fake.mdl"] = true,
			["442_mit_fake.mdl"] = true,
			["442_mit_2_fake.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/Kbgs([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["kbs442_fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end

		addModifier( "loadModel", metadataHandler )
	end
	}
end
