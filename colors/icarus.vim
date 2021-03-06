" Name:       Icarus
" Version:    0.1.0
" Maintainer: github.com/HicaroD
" License:    The MIT License (MIT)
"
" A simple dark based colorscheme for Vim.
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='icarus'

let s:black           = { "gui": "#000000", "cterm": "232" }
let s:hard_black      = { "gui": "#202020", "cterm": "234" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243" }
let s:white           = { "gui": "#F1F1F1", "cterm": "15"  }
let s:actual_white    = { "gui": "#f9f5d7", "cterm": "231" }
let s:mint_cream      = { "gui": "#F5FFFA", "cterm": "15"  }
let s:subtle_black    = { "gui": "#303030", "cterm": "236" }
let s:light_black     = { "gui": "#262626", "cterm": "235" }
let s:lighter_black   = { "gui": "#4E4E4E", "cterm": "239" }
let s:soft_grey       = { "gui": "#928374", "cterm": "244" }
let s:lighter_gray    = { "gui": "#C6C6C6", "cterm": "251" }
let s:bright_red      = { "gui": "#FF3D23", "cterm": "167" }
let s:scarlet_red     = { "gui": "#eb3400", "cterm": "167" }
let s:light_red       = { "gui": "#EE7777", "cterm": "208" }
let s:bright_orange   = { "gui": "#C88623", "cterm": "208" }
let s:indian_red      = { "gui": "#D75F5F", "cterm": "167" }
let s:dodger_blue     = { "gui": "#1E90FF", "cterm": "26"  }
let s:vivid_sky_blue  = { "gui": "#40BDFF", "cterm": "26"  }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "32"  }
let s:lilac           = { "gui": "#C8A2C8", "cterm": "32"  }
let s:light_green     = { "gui": "#5FD7A7", "cterm": "10"  }
let s:light_purple    = { "gui": "#B19CD9", "cterm": "140" }
let s:yellow          = { "gui": "#DEDD5A", "cterm": "11"  }
let s:boolean         = { "gui": "#4ABAB7", "cterm": "11"  }
let s:dark_yellow     = { "gui": "#A89C14", "cterm": "3"   }
let s:azure_blue      = { "gui": "#00B7EB", "cterm": "26"  }
let s:orange          = { "gui": "#F9A602", "cterm": "208" }

let s:background = &background

let s:bg              = s:hard_black
let s:bg_subtle       = s:lighter_black
let s:bg_very_subtle  = s:subtle_black
let s:norm            = s:lighter_gray
let s:norm_subtle     = s:medium_gray
let s:purple          = s:light_purple
let s:green           = s:light_green
let s:red             = s:light_red
let s:visual          = s:lighter_black

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:actual_white})

if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:purple, "fg": s:norm })
call s:h("Comment",       {"fg": s:soft_grey, "gui": "italic"})

call s:h("String",        {"fg": s:purple})
call s:h("Boolean",       {"fg": s:boolean})
call s:h("Float",         {"fg": s:indian_red})
call s:h("Number",        {"fg": s:red})
call s:h("Character",     {"fg": s:lilac})

" Any variable name
call s:h("Identifier",    {"bg": s:bg, "fg": s:actual_white})
call s:h("Function",      {"fg": s:azure_blue, "cterm": "bold"})
call s:h("Statement",     {"fg": s:bright_red})

" if, then, else, endif, switch, etc.
call s:h("Conditional",   {"fg": s:bright_red})

" case, default, etc.
call s:h("Label",         {"fg": s:bright_red})

" sizeof, +, *, etc.
call s:h("Operator",      {"fg": s:dodger_blue})

call s:h("Keyword",       {"fg": s:bright_red})

" try, catch, throw
call s:h("Expection",     {"fg": s:bright_red})


call s:h("PreProc",     {"fg": s:yellow})
hi! link Include          Statement
hi! link Define           Statement
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:orange})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

" any special symbol (parenthesis, curly braces and more)
call s:h("Special",       {"fg": s:green})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:vivid_sky_blue, "cterm": "bold"})
call s:h("Todo",          {"fg": s:mint_cream})
call s:h("SpecialKey",    {"fg": s:light_green})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:dark_blue})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:light_black})
call s:h("Search",        {"bg": s:light_green, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:purple, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:dark_blue})
call s:h("Visual",        {"fg": s:norm, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:visual})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:dark_blue})
call s:h("SignColumn",    {"fg": s:light_green})

call s:h("Pmenu",         {"fg": s:white, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:actual_white, "bg": s:bright_red})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:bright_orange, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:vivid_sky_blue, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" Python: {{{
hi! link pythonBoolean Boolean
call s:h("pythonClassVar", {"fg": s:dodger_blue})
" }}}
