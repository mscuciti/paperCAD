# line tool
tools = window.nm.tools
tools.line = new Tool
line = tools.line

line.move = (e,pt0,pt1,sty) ->
  if e 
    e.lastSegment.point=pt1
  tools.ret(e,pt0,pt1,sty)

line.click = (e,pt0,pt1,sty) ->
  if not e
    e = new Path
    e.onClick = () ->
      nm.tools.hit(this)
    e.style = sty
    # add 2 segments to start
    while e.segments.length < 2 
      e.add pt1
  else 
    e.add pt1
    e = false
  tools.ret(e,pt0,pt1,sty)

line.rclick = (e,pt0,pt1,sty) ->
  if e 
    e.remove()
    e = false
  tools.ret(e,pt0,pt1,sty)


nm.stringify.line = (e,pt0,pt1,sty) ->
    'line ' + nm.wrap(pt1.x) + ' ' + nm.wrap(pt1.y)  
