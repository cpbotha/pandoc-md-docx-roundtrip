local fenced = '```%s\n%s\n```\n'

function CodeBlock(cb)
    -- Extract the language from cb.text if it starts with "# lang-<language>"
    local lang = cb.text:match('^# lang%-(%w+)')
    if lang then
        -- Remove the language specifier from cb.text
        local code = cb.text:gsub('^# lang%-(%w+)\n', '')
        return pandoc.RawBlock('markdown', fenced:format(lang, code))
    else
        -- Fallback to default code block, i.e. indented
        return nil
    end
end
