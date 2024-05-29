function Header(element)

  -- if element.level == 2 and re.match(pandoc.utils.stringify(element),"\\(cont.\\)?\\s+(?\\d)?\\s*$")  then
  if element.level == 2 then
    txt = pandoc.utils.stringify(element)
    if txt:match("cont%.%s+%d%s*$") or txt:match("cont%.%s*$") or txt:match("%(%d%)%s*$") then
      return {}
    end
  end
end
