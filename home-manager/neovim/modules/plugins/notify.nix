{
  programs.nvf.settings.vim = {
    notify.nvim-notify.enable = true;
    keymaps = [
      {
        desc = "Find Notification";
        key = "<leader>fn";
        mode = "n";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
                require("noice").cmd("fzf")
            end
          '';
      }
      {
        desc = "Last Notification";
        key = "<leader>nl";
        mode = "n";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
                require("noice").cmd("last")
            end
          '';
      }
    ];

    luaConfigRC.macro-notify =
      # lua
      ''
        local notify = require("notify")

        local ns = vim.api.nvim_create_namespace("macro_notify")
        local group = vim.api.nvim_create_augroup("MacroNotify", { clear = true })

        local rec_notif -- the live notification record
        local keys = {} -- keys typed during the recording
        local reg       -- register being recorded

        local function render(final)
          local text = table.concat(keys)
          local title = final and ("Recorded @" .. reg) or ("Recording @" .. reg)
          rec_notif = notify(text ~= "" and text or "...", vim.log.levels.INFO, {
            title = title,
            icon = final and "✔" or "⏺",
            replace = rec_notif,
            timeout = final and 3000 or false,
            hide_from_history = not final,
          })
        end

        vim.api.nvim_create_autocmd("RecordingEnter", {
          group = group,
          callback = function()
            reg = vim.fn.reg_recording()
            keys = {}
            rec_notif = nil
            render(false)

            vim.on_key(function(_, typed)
              if typed == nil or typed == "" then return end
              table.insert(keys, vim.fn.keytrans(typed))
              vim.schedule(function() render(false) end)
            end, ns)
          end,
        })

        vim.api.nvim_create_autocmd("RecordingLeave", {
          group = group,
          callback = function()
            vim.on_key(nil, ns)
            if keys[#keys] == "q" then table.remove(keys) end
            vim.schedule(function()
              render(true)
              rec_notif = nil
            end)
          end,
        })
      '';
  };
}
