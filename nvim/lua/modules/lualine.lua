local function lsp_message()
  if vim.tbl_count(vim.lsp.buf_get_clients()) < 1 then
    return ''
  end

  local lsp_status = require'utils'.prequire('lsp-status')
  if not lsp_status then
    return ''
  end

  return lsp_status.status_progress()
end

local function gps_status()
  local gps = require'utils'.prequire('nvim-gps')
  if not gps or not gps.is_available() then
    return ''
  end
  return gps.get_location()
end

local function attached_lsp()
  local servers = {}
  for _, v in pairs(vim.lsp.buf_get_clients()) do
    table.insert(servers, v.name)
  end
  return table.concat(servers, ", ")
end

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'rose-pine',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {{'filename', path = 1 , file_status = true, shorting_path = 100 }, { 'diagnostics', sources = { 'coc' }}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
tabline = {
  lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'fugitive', 'nvim-tree'}
}
