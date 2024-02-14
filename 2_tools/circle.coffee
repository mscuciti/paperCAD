# circle tool
nm = window.nm
tools = nm.tools
tools.circle = new Tool
circle = tools.circle

circle.move = (e,pt0,pt1,sty) ->
  if e 
    d = pt0.getDistance(pt1) / e.data.radius
    e.scale d
    e.data.radius *= d
  tools.ret(e,pt0,pt1,sty)

circle.click = (e,pt0,pt1,sty) ->
  if not e
    pt0.x = pt1.x
    pt0.y = pt1.y
    e = new Path.Circle(pt1,1)
    e.onClick = () ->
      nm.tools.hit(this)
    e.data = 
      radius: 1
      cenX: pt1.x
      cenY: pt1.y
    e.style = sty
  else 
    e = false
  tools.ret(e,pt0,pt1,sty)

circle.rclick = (e,pt0,pt1,sty) ->
  if e 
    e.remove()
    e = false
  tools.ret(e,pt0,pt1,sty)

nm.stringify.circle = (e,pt0,pt1,sty) ->
  if e 
    'circle ' + pt0.x.toFixed(3) + ' ' + pt0.y.toFixed(3) + ' R ' + nm.wrap(e.data.radius.toFixed(3))
  else 
    'circle ' + nm.wrap(pt1.x.toFixed(3)) + ' ' + nm.wrap(pt1.y.toFixed(3))

nm.parse.circle = (str) ->
  string = str.parse(' ')
  alert(string[0]);
