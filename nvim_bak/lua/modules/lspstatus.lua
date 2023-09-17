local lsp_status = require'lsp-status'
lsp_status.config {
  current_function = false,
  indicator_errors = '⛔️',
  indicator_warnings = '⚠️',
  indicator_info = 'i',
  indicator_hint = '?',
  indicator_ok = 'Ok',
}
lsp_status.register_progress()
