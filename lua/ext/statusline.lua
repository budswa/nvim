require('nvim-gps').setup()

local gps = require('nvim-gps')
local gl = require('galaxyline')
local condition = require('galaxyline.condition')

local gls = gl.section

local colors = {
  bg = '#23272e',
  fg = '#bbc2cf',
	purple = '#a9a1e1',
	blue = '#50abea',
	green = '#98be65',
	orange = '#da8548',
	red = '#ff6c6b'
}

-- Standard statusline
gls.left[1] = {
   FirstElement = {
      provider = function()
         return "▌"
      end,
      highlight = {colors.blue,colors.bg},
   },
}

gls.left[2] = {
	ViMode = {
		provider = function()
      local mode = {
        n = "NORMAL",
				i = "INSERT",
				v = "VISUAL",
      }
			return mode[vim.fn.mode()]
		end,
		highlight = {colors.blue, colors.bg,'bold'},
    separator_highlight = {colors.blue, colors.bg,'bold'},
		separator = ' ',
	}
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}
gls.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}
gls.left[5] = {
	nvimGPS = {
		provider = function()
			return gps.get_location()
		end,
		condition = function()
			return gps.is_available()
		end,
    highlight = {colors.fg,colors.bg,'bold'},
	}
}

gls.right[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}
gls.right[2] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.fg,colors.bg,'bold'},
    separator_highlight = {colors.blue, colors.bg,'bold'},
		separator = ' ',
  }
}
gls.right[3] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = ' +',
    highlight = {colors.green,colors.bg},
  }
}
gls.right[4] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' ~',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[5] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = ' -',
    highlight = {colors.red,colors.bg},
  }
}
gls.right[6] = {
  LastElement = {
    provider = function()
       return "▐"
    end,
    highlight = {colors.blue,colors.bg},
 },
}

-- Short statusline
gl.short_line_list = {'NvimTree', 'packer'}

gls.short_line_left[1] = {}

