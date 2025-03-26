local toggle_background = function()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end 


vim.api.nvim_create_user_command("ToggleBackground", toggle_background, {})
