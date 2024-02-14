# namespace
nm = window.nm
t = nm.temp
elmt = nm.temp.elmt
pt0 = nm.temp.pt0
pt1 = nm.temp.pt1
style = nm.temp.style

# how fast to zoom
zoomSensitivity = 2.5

# get canvas and scene graph
tbl = document.getElementById 'buttonTable' 
canvas = document.getElementById 'myCanvas' 
#graph = document.getElementById 'sceneGraph' 
# get array of DOM buttons
buttons = []
for row in tbl.rows
  for cell in row.cells
    buttons.push cell.children[0]

# make event listener for all buttons
for button in buttons
  try button.addEventListener 'click', (e) -> buttonEvent(e)

# set up event handlers
canvas.addEventListener 'wheel',        (e) -> nm.wheel(e); nm.updateCMD() # see: cmd.coffee
canvas.addEventListener 'contextmenu',  (e) -> nm.contextmenu(e); nm.updateCMD() 
canvas.addEventListener 'mousedown',    (e) -> nm.mouseDown(e); nm.updateCMD() 
canvas.addEventListener 'mouseup',      (e) -> nm.mouseUp(e); nm.updateCMD()
canvas.addEventListener 'mousemove',    (e) -> nm.mouseMove(e); nm.updateCMD()
document.addEventListener 'keydown', (e) -> nm.typing(e); 

# listener functions
nm.wheel = (e) ->
  nm.fnc.zoom(e,zoomSensitivity)
  try nm.temp = paper.tool.move(nm.temp.elmt,nm.temp.pt0,nm.temp.pt1,nm.temp.style)

resetButtons = () ->
  nm.temp.elmt = false
  for button in buttons
    button.style.backgroundColor = 'blue'

buttonEvent = (e) ->
  id = e.target.id
  buttonTool = nm.tools[id]
  resetButtons()
  buttonTool.activate()
  nm.temp.elmt = false
  e.target.style.backgroundColor = 'red'

nm.contextmenu = (e) ->
  e.preventDefault()
  try nm.temp = paper.tool.rclick(nm.temp.elmt,nm.temp.pt0,nm.temp.pt1,nm.temp.style)

nm.mouseDown = (e) ->
  if e.button == 0
    project.deselectAll()
    try nm.temp = paper.tool.click(nm.temp.elmt,nm.temp.pt0,nm.temp.pt1,nm.temp.style)
  if e.button == 1
    nm.fnc.startPan()

nm.mouseUp = (e) ->
  if e.button == 1
    nm.midPressed = false

nm.mouseMove = (e) ->
  nm.fnc.mve(e)
  try nm.temp = paper.tool.move(nm.temp.elmt,nm.temp.pt0,nm.temp.pt1,nm.temp.style)
  #graphUpdate()

nm.SVG_out = ->
  alert(project.exportSVG({asString:'true'}))
