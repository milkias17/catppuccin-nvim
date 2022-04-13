local M = {}

function M.get(cp)
	-- local delimeters = cp.gray2
	local operators = cp.sky
	local cl = cp.mauve -- conditionals, loops
	local keywords = cp.mauve

	local math_logic = cp.peach
	return {
		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.
		TSField = { fg = cp.teal }, -- For fields.
		TSProperty = { fg = cp.teal, style = cnf.styles.properties or "NONE" }, -- Same as TSField.

		TSInclude = { fg = cp.mauve, style = cnf.styles.keywords or "NONE" }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
		TSOperator = { fg = operators, style = cnf.styles.operators or "NONE" }, -- For any operator: +, but also -> and * in cp.
		TSKeywordOperator = { fg = cp.mauve, style = cnf.styles.operators or "NONE" }, -- For new keyword operator
		TSPunctSpecial = { fg = cp.sky, style = cnf.styles.operators or "NONE" }, -- For special punctutation that does not fall in the catagories before.

		TSFloat = { fg = math_logic, style = cnf.styles.numbers or "NONE" }, -- For floats.
		TSNumber = { fg = math_logic, style = cnf.styles.numbers or "NONE" }, -- For all numbers
		TSBoolean = { fg = math_logic, style = cnf.styles.booleans or "NONE" }, -- For booleans.

		TSConstructor = { fg = cp.sapphire }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
		TSConstant = { fg = cp.peach }, -- For constants
		TSConditional = { fg = cl, style = cnf.styles.keywords or "NONE" }, -- For keywords related to conditionnals.
		TSRepeat = { fg = cl, style = cnf.styles.keywords or "NONE" }, -- For keywords related to loops.
		TSException = { fg = cp.mauve, style = cnf.styles.keywords or "NONE" }, -- For exception related keywords.

		-- builtin
		TSConstBuiltin = { fg = cp.peach, style = cnf.styles.keywords or "NONE" }, -- For constant that are built in the language: nil in Lua.
		TSFuncBuiltin = { fg = cp.peach, style = cnf.styles.functions or "NONE" }, -- For builtin functions: table.insert in Lua.

		TSNamespace = { fg = cp.blue, style = "italic" }, -- For identifiers referring to modules and namespaces.
		TSType = { fg = cp.yellow, style = cnf.styles.types or "NONE" }, -- For types.
		TSTypeBuiltin = { fg = cp.yellow, style = cnf.styles.properties or "italic" }, -- For builtin types.
		TSVariableBuiltin = { fg = cp.red }, -- Variable names that are defined by the languages, like this or self.

		TSFunction = { fg = cp.blue, style = cnf.styles.functions or "NONE" }, -- For function (calls and definitions).
		TSFuncMacro = { fg = cp.teal, style = cnf.styles.functions or "NONE" }, -- For macro defined functions (calls and definitions): each macro_rules in Ruscp.
		TSParameter = { fg = cp.maroon, style = "italic" }, -- For parameters of a function.
		TSKeywordFunction = { fg = cp.mauve, style = cnf.styles.keywords or "NONE" }, -- For keywords used to define a fuction.
		TSKeyword = { fg = keywords, style = cnf.styles.keywords or "NONE" }, -- For keywords that don't fall in previous categories.
		TSKeywordReturn = { fg = cp.mauve, style = cnf.styles.keywords or "NONE" },
		-- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSAttribute         = { };    -- (unstable) TODO: docs
		-- TSCharacter         = { };    -- For characters.
		-- TSgray0           = { };    -- For gray0 blocks.
		TSNote = { fg = cp.black2, bg = cp.blue },
		TSWarning = { fg = cp.black2, bg = cp.yellow },
		TSDanger = { fg = cp.black2, bg = cp.red },
		TSConstMacro = { fg = cp.mauve };    -- For constants that are defined by macros: NULL in cp.
		-- TSError = { fg = cp.red }, -- For syntax/parser errors.
		-- rustTSField = { fg = cp.black4 }, -- For fields.
		TSLabel = { fg = cp.sapphire }, -- For labels: label: in C and :label: in Lua.
		TSMethod = { fg = cp.blue, style = cnf.styles.functions or "NONE" }, -- For method calls and definitions.
		-- TSNone              = { };    -- TODO: docs
		-- TSParameterReference= { };    -- For references to parameters of a function.
		tomlTSProperty = { fg = cp.blue }, -- Differentiates between string and properties
		TSPunctDelimiter = { fg = cp.gray2 }, -- For delimiters ie: .
		-- TSPunctBracket = { fg = delimeters }, -- For brackets and parenthesis.
		TSPunctBracket = { fg = cp.gray2 }, -- For brackets and parenthesis.
		TSString = { fg = cp.green, style = cnf.styles.strings or "NONE" }, -- For strings.
		TSStringRegex = { fg = cp.peach, style = cnf.styles.strings or "NONE" }, -- For regexes.
		-- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
		TSVariable = { fg = cp.white, style = cnf.styles.variables or "NONE" }, -- Any variable name that does not have another highlighcp.
		TSTagAttribute = { fg = cp.teal, style = "italic" }, -- Tags like html tag names.
		TSTag = { fg = cp.mauve }, -- Tags like html tag names.
		TSTagDelimiter = { fg = cp.sky }, -- Tag delimiter like < > /
		TSText = { fg = cp.white }, -- For strings considerated text in a markup language.
		-- TSEmphasis          = { };    -- For text to be represented with emphasis.
		-- TSUnderline         = { };    -- For text to be represented with an underline.
		-- TSStrike            = { };    -- For strikethrough texcp.
		-- TSTitle             = { };    -- Text that is part of a title.
		-- TSLiteral           = { };    -- Literal texcp.
		-- TSURI               = { };    -- Any URI like a link or email.
		--
		-- Markdown tresitter parser support
		TSURI = { fg = cp.rosewater, style = "italic,underline" }, -- urls, links and emails
		TSLiteral = { fg = cp.teal, style = "italic" }, -- used for inline code in markdown and for doc in python (""")
		TSTextReference = { fg = cp.lavender, style = "bold" }, -- references
		TSTitle = { fg = cp.blue, style = "bold" }, -- titles like: # Example
		TSEmphasis = { fg = cp.maroon, style = "italic" }, -- bold
		TSStrong = { fg = cp.maroon, style = "bold" }, -- italic
		TSStringEscape = { fg = cp.pink, style = cnf.styles.strings }, -- For escape characters within a string.

		-- bash
		-- bashTSFuncBuiltin = { fg = cp.red, style = "italic" },
		-- bashTSParameter = { fg = cp.yellow, style = "italic" },

		-- lua

		jsonTSLabel = { fg = cp.blue }, -- For labels: label: in C and :label: in Lua.
		-- luaTSField = { fg = cp.rosewater },
		luaTSConstructor = { fg = cp.lavender }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
		-- luaTSFuncBuiltin = { fg = cp.teal, style = "italic" }, -- For builtin functions: table.insert in Lua.

		-- java
		-- javaTSField = { fg = cp.red },
		-- javaTSType = { fg = cp.yellow }, -- current Java TS parser doesn't distinguish types properly
		-- javaTSConstant = { fg = cp.teal },

		-- typescript

    -- typescript
		typescriptTSProperty = { fg = cp.lavender, style = "italic" }, -- Same as TSField.
		typescriptTSConstructor = { fg = cp.lavender },
		typescriptTSTagProperty = { fg = cp.cotton },

    -- TSX (React with Typescript)
		tsxTSConstructor = { fg = cp.lavender },
		tsxTSTagDelimiter = { fg = cp.maroon },
		tsxTSTagAttribute = { fg = cp.mauve },
		tsxTSTagProperty = { fg = cp.cotton },


		-- css
		-- cssTSType = { fg = cp.lavender },
		cssTSProperty = { fg = cp.cotton, style = "italic" }, -- Same as TSField.

		-- cpp
		cppTSProperty = { fg = cp.white },

		-- yaml
		yamlTSField = { fg = cp.blue }, -- For fields.
	}
end

return M
