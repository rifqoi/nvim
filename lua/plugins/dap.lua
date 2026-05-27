return {
	{
		"mfussenegger/nvim-dap",
		recommended = true,
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
        -- stylua: ignore
        keys = {
          { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
          { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
          { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
          { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
          { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
          { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
          { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
          { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
          { "<leader>dj", function() require("dap").down() end, desc = "Down" },
          { "<leader>dl", function() require("dap").step_over() end, desc = "Step Over" },
          { "<leader>dh", function() require("dap").step_back() end, desc = "Step Back" },
          { "<leader>dj", function() require("dap").down() end, desc = "Down" },
          { "<leader>dk", function() require("dap").up() end, desc = "Up" },
          { "<leader>d.", function() require("dap").run_last() end, desc = "Run Last" },
          { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
          { "<leader>dr", function()
                require("dap").repl.toggle()
                vim.cmd("setlocal wrap")
            end, desc = "Toggle REPL" },
          { "<leader>ds", function() require("dap").session() end, desc = "Session" },
          { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
          { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
          { "<leader>dfs", function() require("dapui").float_element("scopes") end, desc = "Float element scopes" },
          { "<leader>df", function() require("dapui").float_element("watches") end, desc = "Float element watches" },
          { "<leader>de", function() require("dapui").eval() end, desc = "Evaluate expression under cursor" },
          { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
        },
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach to running process",
						mode = "remote",
						request = "attach",
					},
				},
			})

			require("nvim-dap-virtual-text").setup({
				-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})

			-- Handled by nvim-dap-go
			-- dap.adapters.go = {
			-- 	type = "server",
			-- 	port = "${port}",
			-- 	executable = {
			-- 		command = "dlv",
			-- 		args = { "dap", "-l", "127.0.0.1:${port}" },
			-- 	},
			-- }

			local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
			if elixir_ls_debugger ~= "" then
				dap.adapters.mix_task = {
					type = "executable",
					command = elixir_ls_debugger,
				}

				dap.configurations.elixir = {
					{
						type = "mix_task",
						name = "phoenix server",
						task = "phx.server",
						request = "launch",
						projectDir = "${workspaceFolder}",
						exitAfterTaskReturns = false,
						debugAutoInterpretAllModules = false,
					},
				}
			end

			-- vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			-- vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			-- vim.keymap.set("n", "<F1>", dap.continue)
			-- vim.keymap.set("n", "<F2>", dap.step_into)
			-- vim.keymap.set("n", "<F3>", dap.step_over)
			-- vim.keymap.set("n", "<F4>", dap.step_out)
			-- vim.keymap.set("n", "<F5>", dap.step_back)
			-- vim.keymap.set("n", "<F13>", dap.restart)

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
