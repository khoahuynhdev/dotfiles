local _M = {}
local c = require("null-ls.config")
local nclient = require("null-ls.client")
local u = require("null-ls.utils")
local log = require("null-ls.logger")
local loop = require("null-ls.loop")
local methods = require("null-ls.methods")

function _M.replace_buf(params)
  local output = params.action_output
  vim.lsp.util.apply_text_edits(
    {{
      range = u.range.to_lsp({
        row = 1,
        col = 1,
        end_row = vim.tbl_count(params.content) +  1,
        end_col = 1,
      }),
      newText = output:gsub("[\r\n]$", ""),
    }},
    params.bufnr,
    nclient.get_offset_encoding()
  )
end

-- @param opt (table)
--    name      (string):   generator name
--    filetypes (table):    filetypes to support. Default {}
--    save_on_return (bool): save buffer on return
--    action_fn (function): function that return a list of action
--      @param:
--        params (table): null-ls generator params
--      @return: []action (table)
--        title   (string): action title
--        stdin   (bool): provide file content via stdin
--        command (string): command to execute
--        args    (table):  list of args to perform
--        timeout (number): cli tool execute timeout. Default to null-ls config timeout
--        dynamic_action (function): provide function to execute action. If provided, can skip (command, args, timeout, stdin)
--        on_output (function): provide function to handle execution output.
-- @return null_ls generator
function _M.make_code_action(opts)
  local name = opts.name
  local filetypes = opts.filetypes or {}
  local action_fn = opts.action_fn
  local save_on_return = opts.save_on_return or true

  return {
    name = name,
    method = methods.internal.CODE_ACTION,
    filetypes = filetypes,
    generator = {
      fn = function(params)
        -- cli callback handler
        local make_cli_handler = function(action)
          return function(error_output, output)
            log:debug("error output: " .. (error_output or "nil"))
            log:debug("output: " .. (output or "nil"))

            if not output then
              return
            end

            -- perform output processing
            params.action_output = output
            action.on_output(params)

            if save_on_return then
              vim.schedule(function()
                vim.cmd(params.bufnr .. "bufdo! silent keepjumps noautocmd update")
              end)
            end
          end
        end

        -- function to invoke cli
        local invoke_cli = function(action)
          local command = action.command
          local args = action.args
          local timeout = action.timeout or c.get().default_timeout
          local stdin = action.stdin or false
          assert(
            vim.fn.executable(command) > 0,
            string.format("command %s is not executable (make sure it's installed and on your $PATH)", command)
          )

          local client = vim.lsp.get_client_by_id(params.client_id)
          local spawn_opts = {
            cwd = client and client.config.root_dir or vim.fn.getcwd(),
            input = nil,
            handler = make_cli_handler(action),
            timeout = timeout,
          }
          if stdin then
            local content = table.concat(params.content, "\n")
            spawn_opts["input"] = content
          end

          log:debug("spawning command " .. command .. " with args:")
          log:debug(args)
          loop.spawn(command, args, spawn_opts)
        end

        local action_list = action_fn(params)
        if not action_list then
          return
        end

        local actions = {}
        for _, action in pairs(action_list) do
          table.insert(actions, {
            title = action.title,
            action = function()
              if action.dynamic_action then
                action.dynamic_action(invoke_cli)
              else
                invoke_cli(action)
              end
            end,
          })
        end

        return actions
      end
    },
  }
end

return _M