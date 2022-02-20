local patterns = require('nrpattern.default')

patterns[{ 'yes', 'no' }] = { priority = 5 }
patterns[{ 'true', 'false' }] = { priority = 5 }

require('nrpattern').setup(patterns)
