-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },

  config = function(_, _)
    local dap = require('dap')
    local dapui = require('dapui')

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" }
    }

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/brycewalker/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    }
    dap.defaults.fallback.external_terminal = {
      command = '/usr/bin/kitty',
      args = { '-e' }
    }

    -- require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F6>', dap.pause, { desc = 'Debug: Pause' })
    vim.keymap.set('n', '<F10>', function()
      dapui.close()
      dap.terminate()
    end
    , { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<F9>', dap.run_last, { desc = 'Debug: Run Last' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F4>', dap.step_back, { desc = 'Debug: Step Back' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          disconnect = "",
          pause = " F6",
          play = " F5",
          run_last = " F9",
          step_back = " F4",
          step_into = " F1",
          step_out = " F3",
          step_over = " F2",
          terminate = " F10"
        }
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = function()
      -- Close Nvim-Tree using api
      vim.cmd('NvimTreeClose')
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.after.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- Install golang specific config
    require('dap-go').setup()

    -- Load Launch JS
    require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })
  end,
}
