return {
	"stevearc/oil.nvim", -- an awesome file manager
	enabled = true,
	config = function()
		local oil = require("oil")
		oil.setup({
			-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
			-- Set to false if you still want to use netrw.
			default_file_explorer = true,
			watch_for_changes = true,
			-- Buffer-local options to use for oil buffers
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			opts = {},
			-- Optional dependencies
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
			columns = {
				"icon",
			},
			-- Window-local options to use for oil buffers
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
				foldcolumn = "0",
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = "nvic",
				number = false,
			},
			-- Restore window options to previous values when leaving an oil buffer
			restore_win_options = true,
			-- Skip the confirmation popup for simple operations
			skip_confirm_for_simple_edits = true,
			use_default_keymaps = false,
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
				natural_order = false,
				sort = {
					-- sort order can be "asc" or "desc"
					-- see :help oil-columns to see which columns are sortable
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
			-- Configuration for the floating window in oil.open_float
			float = {
				-- Padding around the floating window
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "none",
				win_options = {
					winblend = 10, -- transparency
				},
			},
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
			-- Id is automatically added at the beginning, and name at the end
			-- See :help oil-columns
			keymaps = {
				-- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
				-- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
				-- Additionally, if it is a string that matches "actions.<name>",
				-- it will use the mapping at require("oil.actions").<name>
				-- Set to `false` to remove a keymap
				-- See :help oil-actions for a list of all available actions
				-- Template:
				-- [""] = { callback = "actions.", mode = "n" },

				-- get out
				["q"] = { callback = "actions.close", mode = "n" },
				["<ESC>"] = { callback = "actions.close", mode = "n" },

				-- refresh
				["<C-r>"] = { callback = "actions.refresh", mode = "n" },

				-- interact
				["<CR>"] = { callback = "actions.select", mode = "n" },
				["L"] = { callback = "actions.select", mode = "n" },

				["<BS>"] = { callback = "actions.parent", mode = "n" },
				["-"] = { callback = "actions.parent", mode = "n" },
				["H"] = { callback = "actions.parent", mode = "n" },

				-- preview
				["<C-p>"] = { callback = "actions.preview", mode = "n" },

				-- splits and tabs
				["<leader>v"] = {
					"actions.select",
					opts = { vertical = true },
					desc = "Open the entry in a vertical split",
				},
				["<leader>s"] = {
					"actions.select",
					opts = { horizontal = true },
					desc = "Open the entry in a horizontal split",
				},
				[",t"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },

				-- set things
				["`"] = { callback = "actions.cd", mode = "n" },
				["~"] = { callback = "actions.tcd", mode = "n" },

				-- open external programm
				["go"] = "actions.open_external",
				["gx"] = "actions.open_external",

				-- more stuff
				["g."] = "actions.toggle_hidden",
				["gs"] = "actions.change_sort",
				["g?"] = { callback = "actions.show_help", mode = "n" },
			},
		})
	end,
}
