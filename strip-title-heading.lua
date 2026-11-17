-- Drop a leading level-1 heading so it doesn't repeat the page title.
-- Used by pages that include a markdown file from .github/, where the
-- heading is needed for GitHub but the page sets its own title.
function Pandoc(doc)
  local first = doc.blocks[1]
  if first and first.t == "Header" and first.level == 1 then
    doc.blocks:remove(1)
  end
  return doc
end
