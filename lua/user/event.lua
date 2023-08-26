local definitions = {
	-- Example
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
		{
			"BufEnter,FocusGained,WinEnter,InsertLeave",
			"*",
			[[if &number | set relativenumber | endif]],
		},
		{
			"BufLeave,FocusLost,WinLeave,Insertenter",
			"*",
			[[if &number | set norelativenumber | endif]],
		},
	},
}

return definitions
