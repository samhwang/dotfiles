return {
  "alexpasmantier/tv.nvim",
  config = function()
    local h = require("tv").handlers

    require("tv").setup({
      window = {
        width = 0.8,
        height = 0.8,
        border = "none",
        title = " tv.nvim ",
        title_pos = "center",
      },
      channels = {
        files = {
          keybinding = "<C-p>",
          handlers = {
            ["<CR>"] = h.open_as_files,
            ["<C-q>"] = h.send_to_quickfix,
            ["<C-s>"] = h.open_in_split,
            ["<C-v>"] = h.open_in_vsplit,
            ["<C-y>"] = h.copy_to_clipboard,
          },
        },
        text = {
          keybinding = "<leader><leader>",
          handlers = {
            ["<CR>"] = h.open_at_line,
            ["<C-q>"] = h.send_to_quickfix,
            ["<C-s>"] = h.open_in_split,
            ["<C-v>"] = h.open_in_vsplit,
            ["<C-y>"] = h.copy_to_clipboard,
          },
        },
        ["git-log"] = {
          keybinding = "<leader>gl",
          handlers = {
            ["<CR>"] = function(entries, config)
              if #entries > 0 then
                vim.cmd("enew | setlocal buftype=nofile bufhidden=wipe")
                vim.cmd("silent 0read !git show " .. vim.fn.shellescape(entries[1]))
                vim.cmd("1delete _ | setlocal filetype=git nomodifiable")
                vim.cmd("normal! gg")
              end
            end,
            ["<C-y>"] = h.copy_to_clipboard,
          },
        },
        ["git-branch"] = {
          keybinding = "<leader>gb",
          handlers = {
            ["<CR>"] = h.execute_shell_command("git checkout {}"),
            ["<C-y>"] = h.copy_to_clipboard,
          },
        },
        ["docker-images"] = {
          keybinding = "<leader>di",
          window = { title = " Docker Images " },
          handlers = {
            ["<CR>"] = function(entries, config)
              if #entries > 0 then
                vim.ui.input({
                  prompt = "Container name: ",
                  default = "my-container",
                }, function(name)
                  if name and name ~= "" then
                    local cmd = string.format("docker run -it --name %s %s", name, entries[1])
                    vim.cmd("!" .. cmd)
                  end
                end)
              end
            end,
            ["<C-y>"] = h.copy_to_clipboard,
          },
        },
        env = {
          keybinding = "<leader>ev",
          handlers = {
            ["<CR>"] = h.insert_at_cursor,
            ["<C-l>"] = h.insert_on_new_line,
            ["<C-y>"] = h.copy_to_clipboard,
          },
        },
        alias = {
          keybinding = "<leader>al",
          handlers = {
            ["<CR>"] = h.insert_at_cursor,
            ["<C-y>"] = h.copy_to_clipboard,
          },
        },
      },
      tv_binary = "tv",
      global_keybindings = {
        channels = "<leader>tv",
      },
      quickfix = {
        auto_open = true,
      },
    })
  end,
}
