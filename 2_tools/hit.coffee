# hit
nm.tools.hit = (objSelected) ->
  if paper.tool._index == nm.tools.sel._index
    if objSelected.selected == false
      objSelected.selected = true
    else
      objSelected.selected = false
  if paper.tool._index == nm.tools.del._index
    objSelected.remove()
