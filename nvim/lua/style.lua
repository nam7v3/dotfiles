local api = vim.api

api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
api.nvim_set_hl(0, 'FloatBorder', { link = 'GruvboxFg0' })
api.nvim_set_hl(0, 'DiagnosticError', { link = 'GruvboxRedBold' })
api.nvim_set_hl(0, 'DiagnosticWarn', { link =  'GruvboxYellowBold'})
api.nvim_set_hl(0, 'DiagnosticInfo', { link = 'GruvboxAquaBold' })
api.nvim_set_hl(0, 'DiagnosticHint', { link = 'GruvboxBlueBold' })
api.nvim_set_hl(0, 'Pmenu', { link = 'NormalFloat' })
