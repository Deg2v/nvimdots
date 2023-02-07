return {
	-- need generate .clang-format in home or dictionary
	-- formatCommand = "clang-format -style='{BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 100, PointerAlignment: Left}'",
	formatCommand = "clang-format -style=file",
	formatStdin = true,
}
