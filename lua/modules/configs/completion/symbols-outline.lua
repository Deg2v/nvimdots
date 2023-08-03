return function()
	local icons = {
		kind = require("modules.utils.icons").get("kind", true),
		type = require("modules.utils.icons").get("type", true),
		ui = require("modules.utils.icons").get("ui", true),
	}

	require("symbols-outline").setup({
		highlight_hovered_item = true,
		show_guides = true,
		auto_preview = false,
		position = "right",
		relative_width = true,
		width = 18,
		auto_close = true,
		show_numbers = false,
		show_symbol_details = true,
		autofold_depth = 5,
		auto_unfold_hover = true,
		fold_markers = { icons.ui.ArrowClosed, icons.ui.ArrowOpen },
		wrap = false,
		keymaps = {
			close = { "<Esc>", "q" },
			goto_location = "<CR>",
			focus_location = "o",
			hover_symbol = "gs",
			toggle_preview = "K",
			rename_symbol = "r",
			code_actions = "ca",
			fold = "c",
			unfold = "o",
			fold_all = "C",
			unfold_all = "O",
			fold_reset = "R",
		},
		symbols = {
			-- Kind
			Class = { icon = icons.kind.Class, hl = "LspKindClass" },
			Constant = { icon = icons.kind.Constant, hl = "LspKindConstant" },
			Constructor = { icon = icons.kind.Constructor, hl = "LspKindConstructor" },
			Component = { icon = icons.kind.Snippet, hl = "LspKindSnippet" },
			Enum = { icon = icons.kind.Enum, hl = "LspKindEnum" },
			EnumMember = { icon = icons.kind.EnumMember, hl = "LspKindEnumMember" },
			Event = { icon = icons.kind.Event, hl = "LspKindEvent" },
			Field = { icon = icons.kind.Field, hl = "LspKindField" },
			File = { icon = icons.kind.File, hl = "LspKindFile" },
			Fragment = { icon = icons.kind.Fragment, hl = "LspKindKey" },
			Function = { icon = icons.kind.Function, hl = "LspKindFunction" },
			Interface = { icon = icons.kind.Interface, hl = "LspKindInterface" },
			Key = { icon = icons.kind.Keyword, hl = "LspKindKey" },
			Method = { icon = icons.kind.Method, hl = "LspKindMethod" },
			Module = { icon = icons.kind.Module, hl = "LspKindModule" },
			Namespace = { icon = icons.kind.Namespace, hl = "LspKindNamespace" },
			Number = { icon = icons.kind.Number, hl = "LspKindNumber" },
			Operator = { icon = icons.kind.Operator, hl = "LspKindOperator" },
			Package = { icon = icons.kind.Package, hl = "LspKindPackage" },
			Property = { icon = icons.kind.Property, hl = "LspKindProperty" },
			Struct = { icon = icons.kind.Struct, hl = "LspKindStruct" },
			TypeParameter = { icon = icons.kind.TypeParameter, hl = "LspKindTypeParameter" },
			Variable = { icon = icons.kind.Variable, hl = "LspKindVariable" },
			-- Type
			Array = { icon = icons.type.Array, hl = "LspKindArray" },
			Boolean = { icon = icons.type.Boolean, hl = "LspKindBoolean" },
			Null = { icon = icons.type.Null, hl = "LspKindNull" },
			Object = { icon = icons.type.Object, hl = "LspKindObject" },
			String = { icon = icons.type.String, hl = "LspKindString" },
		},
	})
end
