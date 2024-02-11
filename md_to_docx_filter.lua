function CodeBlock(block)
    -- Check if there is a language specifier
    local lidx, lang = next(block.classes)

    if lidx then
        -- Prepend the line to the existing code block content
        block.text = string.format("# lang-%s\n%s", lang, block.text)
        -- Return the modified block
        return block
    else
        return nil
    end
end
