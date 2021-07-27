vim.o.completeopt = "menuone,noselect"

-- Setup of compe
require('compe').setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    };

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        spell = true;
        tags = true;
        snippets_nvim = true;
        treesitter = true;
    };
}

local function replace_termcode(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_backspace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

function CompeComplete()
    if vim.fn.pumvisible() == 1 then
        return replace_termcode "<C-n>"
    elseif check_backspace() then
        return replace_termcode "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

function CompeReverseComplete()
    if vim.fn.pumvisible() == 1 then
        return replace_termcode "<C-p>"
    else
        return replace_termcode "<S-Tab>"
    end
end
