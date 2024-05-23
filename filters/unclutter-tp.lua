function Header(element)

    -- if element.level == 2 and re.match(pandoc.utils.stringify(element),"\\(cont.\\)?\\s+(?\\d)?\\s*$")  then
    if element.level == 2 then
      txt = pandoc.utils.stringify(element)
      quarto.log.debug("Header: " .. txt)
      if txt:match("cont%.%s+%d%s*$") or txt:match("cont%.%s*$") or txt:match("%(%d%)%s*$") then
        quarto.log.debug("Found continuation header")
        return {}
      end
    end
  end

  function Div(element)
    if element.classes[1] == "cell" then
      if element.attr.attributes["tags"] ~= nil and element.attr.attributes["tags"] == "[\"solution\"]" then
        quarto.log.debug("Found cell solution")
        return {}
      end
    elseif element.classes[1] == "solution" then
      quarto.log.debug("Found solution")
      return {}
    end
  end