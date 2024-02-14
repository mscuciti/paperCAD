# pline
tools = window.nm.tools
tools.pline = new Tool
pline = tools.pline

# pline tool
pline.move = (e,pt0,pt1,sty) ->
  if e 
    e.lastSegment.point=pt1
  tools.ret(e,pt0,pt1,sty)

pline.click = (e,pt0,pt1,sty) ->
  if not e
    e = new Path
    e.onClick = () ->
      nm.tools.hit(this)
    e.style = nm.sty
    # add 2 segments to start
    while e.segments.length < 2 
      e.add pt1
  else e.add pt1
  tools.ret(e,pt0,pt1,sty)

pline.rclick = (e,pt0,pt1,sty) ->
  if e 
    e.lastSegment.remove()
    if e.segments.length == 1
      e.remove()
    e = false
  tools.ret(e,pt0,pt1,sty)

nm.stringify.pline = (e,pt0,pt1,sty) ->
  'pline ' + nm.wrap(pt1.x.toFixed(3)) + ' ' + nm.wrap(pt1.y.toFixed(3))

nm.parse.pline = (str) ->
  alert(str)
