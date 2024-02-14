nm = window.nm
cmd = document.getElementById("cmd")

###
document.addEventListener 'keydown', (e) -> 
  active = getActive()
  active.focus()
###

getActive = ->
  document.getElementsByClassName("active")[0]

getInactive = ->
  document.getElementsByClassName("inactive")[0]

getTool = (tools,pScope) ->
  for t of tools 
    if tools[t]._index == pScope.tool._index 
      return t

nm.selectActive = ->
  selection = window.getSelection();
  active = document.getElementsByClassName("active")[0];
  if selection.rangeCount > 0 
    selection.removeAllRanges()
  range = document.createRange();
  try range.selectNodeContents(active);
  selection.addRange(range);

nm.updateCMD = ->
  tool = getTool(nm.tools,paper)
  try cmd.innerHTML = nm.stringify[tool](nm.temp.elmt,nm.temp.pt0,nm.temp.pt1,nm.temp.sty)
  active = document.getElementsByClassName("active")[0]
  if !active
    inactive = document.getElementsByClassName("inactive")[0]
    if inactive
      inactive.className='active'
  nm.selectActive()

###
step = ->
  activeEL = document.getElementsByClassName("active")[0]
  window.requestAnimationFrame(step)

window.requestAnimationFrame(step)
###
