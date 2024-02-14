import paper from 'paper'

canvas = document.getElementById 'myCanvas' 

# Create empty project and view for canvas:
paper.install window
paper.setup canvas
project = paper.project
project.activate()

# set up global namespace, variables, etc
window.nm = {} # global namespace
nm = window.nm 
nm.tools = {} # actual paperJS tools
nm.stringify = {} # string functions for cmd line
nm.parse = {} # parse functions for cmd line
nm.fnc = {} # other global functions
nm.temp = {} # active elements, pts etc.
nm.midPressed = false
nm.temp.elmt = false # current element drawn to
nm.temp.pt0 = new Point # temp anchor pt
nm.temp.pt1 = new Point # live mouse tracking pt
nm.temp.ptPAN = new Point # to keep pan from interfering
nm.temp.style = 0 # see: styles script
