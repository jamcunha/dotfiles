local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then return end

saga.init_lsp_saga {
    border_style = "rounded",
    code_action_num_shortcut = true,
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
}

