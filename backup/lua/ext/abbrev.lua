local abbrev_man = require("abbrev-man")

abbrev_man.setup({
	load_natural_dictionaries_at_startup = false,
	load_programming_dictionaries_at_startup = false,
	natural_dictionaries = {
		["nt_en"] = {}
	},
	programming_dictionaries = {
		["pr_py"] = {}
	}

})