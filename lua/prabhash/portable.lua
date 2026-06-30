local M = {}

function M.has_any_executable(names)
  for _, name in ipairs(names) do
    if vim.fn.executable(name) == 1 then
      return true
    end
  end
  return false
end

function M.has_clipboard_provider()
  if vim.fn.has("mac") == 1 then
    return M.has_any_executable({ "pbcopy", "pbpaste" })
  end

  if vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
    return M.has_any_executable({ "win32yank.exe", "clip.exe" })
  end

  return M.has_any_executable({ "wl-copy", "wl-paste", "xclip", "xsel" })
end

function M.is_headless()
  return #vim.api.nvim_list_uis() == 0
end

function M.supports_kitty_graphics()
  if M.is_headless() then
    return false
  end

  if vim.env.KITTY_WINDOW_ID or vim.env.KITTY_PID then
    return true
  end

  local term = string.lower(vim.env.TERM or "")
  return term:find("kitty", 1, true) ~= nil
end

function M.supports_image_nvim()
  return M.supports_kitty_graphics() and vim.fn.executable("magick") == 1
end

return M
