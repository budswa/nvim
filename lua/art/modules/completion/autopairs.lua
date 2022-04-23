local npairs = require('nvim-autopairs')
local rule = require('nvim-autopairs.rule')

npairs.setup({})

npairs.add_rule(rule('$', '$', 'tex'))
