return {
  "mfussenegger/nvim-dap",
  dependencies = {
	"rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
	"theHamsta/nvim-dap-virtual-text",
  },
  config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapvt = require("nvim-dap-virtual-text")

		dapui.setup()
		dapvt.setup({
			enabled = true,
			enabled_commands = false,
			highlight_changed_variables = true,
			highlight_new_as_changed = true,
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
  keys = {
       { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = " Toggle Breakpoint" },
       { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
       { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
       { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step Over" },
       { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Step Out" },
       { "<leader>dr", "<cmd>DapToggleRepl<cr>", desc = "Toggle REPL" },
       { "<leader>dl", "<cmd>DapRunLast<cr>", desc = "Run Last" },
    },
}
