require('specs').setup{
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 0,
        inc_ms = 10,
        blend = 10,
        width = 10,
        fader = require('specs').linear_fader,
        resizer = require('specs').shrink_resizer
    }
}
