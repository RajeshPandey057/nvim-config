return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      open_mapping = [[<leader>tt]],
      direction = "horizontal",
      shell = "zsh",
      float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

    -- Compile and run current C/C++ file, horizontal terminal, no debug logs
    vim.keymap.set('n', '<leader>rr', function()
      local file = vim.fn.expand('%:p')
      local ext = file:match('%.([^.]+)$')
      local filename = vim.fn.fnamemodify(file, ':r')
      local flags = "-std=c++20 -O2 -Wall -Wextra -Wshadow -Wconversion -Wfloat-equal"
      local input = vim.fn.glob(vim.fn.expand('%:p:h') .. "/input.txt")
      local run_cmd
      if filename:sub(1,1) == "/" then
        run_cmd = string.format('"%s"', filename)
      else
        run_cmd = string.format('./"%s"', filename)
      end
      if input ~= "" then
        run_cmd = run_cmd .. " < input.txt"
      end
      local cmd
      if ext == "cpp" then
        cmd = string.format('g++-15 "%s" -o "%s" %s && %s || echo Compilation failed; rm -f "%s"', file, filename, flags, run_cmd, filename)
      elseif ext == "c" then
        cmd = string.format('gcc-15 "%s" -o "%s" && %s || echo Compilation failed; rm -f "%s"', file, filename, run_cmd, filename)
      else
        return
      end
      local ok, term = pcall(function()
        return require('toggleterm.terminal').Terminal:new({
          cmd = cmd,
          direction = "horizontal",
          close_on_exit = false,
        })
      end)
      if ok and term then
        term:toggle()
      end
    end, {desc = "Compile & Run (C/C++)"})
  end,
}
