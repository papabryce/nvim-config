local keymaps = {

  basic = function()
    -- [[ Basic Keymaps ]]
    -- Keymaps for better default experience
    -- See `:help vim.keymap.set()`
    vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
    vim.keymap.set('n', '<leader>sa', '<cmd>:wa<CR>', { desc = '[S]ave [A]ll buffers' })
    vim.keymap.set('n', '<Esc>', '<cmd> noh <CR>', { desc = 'Clear highlighting' })

    -- Remap for dealing with word wrap
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

    -- Move between windows
    vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
    vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
    vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
    vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
  end,

  telescope = function()
    -- [[ Telescope Keymaps ]]
    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    local function telescope_live_grep_open_files()
      require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end
    vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
  end,

  debug = function()
    -- [[ Debug Keymaps ]]
    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F6>', require('dap').pause, { desc = 'Debug: Pause' })
    vim.keymap.set('n', '<F10>', function()
      require('dapui').close()
      require('dap').terminate()
    end
    , { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<F9>', require('dap').run_last, { desc = 'Debug: Run Last' })
    vim.keymap.set('n', '<F1>', require('dap').step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', require('dap').step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', require('dap').step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F4>', require('dap').step_back, { desc = 'Debug: Step Back' })
    vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', require('dapui').toggle, { desc = 'Debug: See last session result.' })
  end,

  neogen = function()
    -- [[ Neogen Keymaps ]]
    vim.keymap.set('n', '<leader>dc', require('neogen').generate,
      { desc = '[D]ocument [C]ode' })
  end,

  filetree = function()
    -- [[ Filetree Keymaps ]]
    vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Filetree' })
  end,

  tabline = function()
    -- [[ Tabline Keymaps ]]
    vim.keymap.set('n', '<Tab>', function() require('bufferline').cycle(1) end,
      { desc = 'Move to next buffer on bufferline' })
    vim.keymap.set('n', '<S-Tab>', function() require('bufferline').cycle(-1) end,
      { desc = 'Move to previous buffer on bufferline' })
    vim.keymap.set('n', '<leader>x', '<cmd>:bdelete<CR>',
      { desc = 'Close current buffer' })
  end
}

return keymaps
