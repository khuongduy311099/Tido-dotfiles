require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- treesitter folding (jsx_element is foldable in tsx/jsx)
local o = vim.o
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = "" -- keep syntax highlighting on the fold line
o.foldlevel = 99 -- start with everything open
o.foldlevelstart = 99
