local present, toggle_term = pcall(require, "toggleterm")
if not present then
    return
end

toggle_term.setup {
  size = vim.o.columns * 0.35,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "vertical",
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    border = "curved",
    width = 120,
    height = 120,
    winblend = 3,
    highlights = {
      border = "curved",
      background = "Normal",
    }
  }
}
