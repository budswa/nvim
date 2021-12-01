require('fine-cmdline').setup({
	hooks = {
		before_mount = function(input)
			input.input_props.prompt = ':'
		end,
	},
})
