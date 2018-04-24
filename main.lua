-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Sebastian N
-- Created on: April 23
--
-- This program moves an object to four sides and has gravity
-----------------------------------------------------------------------------------------
-- Addition of physics
local physics = require('physics')
physics.start()
physics.setGravity(0, 25)
--physics.setDrawMode('hybrid')

-- The land from the top
local topLand = display.newImageRect('./Assets/Sprites/land.png', 1000, 200)
topLand.x = display.contentCenterX + 800
topLand.y = display.contentCenterY
topLand.id = 'Top land'
physics.addBody(topLand, 'static', {
	friction = 0.5,
	bounce = 0.3
	})

-- The land
local theLand = display.newImageRect('./Assets/Sprites/land.png', 2000, 400)
theLand.x = display.contentCenterX + 500
theLand.y = display.contentHeight
theLand.id = 'The land'
-- Addition of physics for the land
physics.addBody(theLand, 'static', {
	friction = 0.5,
	bounce = 0.3
	})

-- The character
local theSnowMan = display.newImageRect('./Assets/Sprites/SnowMan.png', 350, 400)
theSnowMan.x = display.contentCenterX + 500
theSnowMan.y = display.contentCenterY - 500
theSnowMan.id = 'Snow Man'
-- Addition of physics for the snow man
physics.addBody(theSnowMan, 'dynamic', {
	density = 3.0,
	friction = 0.5,
	bounce = 0.3
	})

-- D-pad
local thedPad = display.newImage('./Assets/Sprites/d-pad.png')
thedPad.x = 160
thedPad.y = display.contentHeight - 160
thedPad.id = 'The d-pad'
thedPad.alpha = 0.5

-- Up arrow
local upArrow = display.newImage('./Assets/Sprites/upArrow.png')
upArrow.x = 160
upArrow.y = display.contentHeight - 268.7
upArrow.id = 'Up arrow'

-- Down arrow
local downArrow = display.newImage('./Assets/Sprites/downArrow.png')
downArrow.x = 160
downArrow.y = display.contentHeight - 52.3
downArrow.id = 'Down arrow'

-- Left arrow
local leftArrow = display.newImage('./Assets/Sprites/leftArrow.png')
leftArrow.x = 52
leftArrow.y = display.contentHeight - 160
leftArrow.id = 'Left arrow'

-- Right arrow
local rightArrow = display.newImage('./Assets/Sprites/rightArrow.png')
rightArrow.x = 268.7
rightArrow.y = display.contentHeight - 160
rightArrow.id = 'Right arrow'

-- Up Arrow Functions
function upArrow:touch(event)
	if (event.phase == 'ended') then
		-- Movement function
		transition.moveBy(theSnowMan, { 
			x = 0,
			y = -50,
			time = 100
			})
	end
end

-- Down Arrow Functions
function downArrow:touch(event)
	if (event.phase == 'ended') then
		-- Movement function
		transition.moveBy(theSnowMan, { 
			x = 0,
			y = 50,
			time = 100
			})
	end
end

-- Left Arrow Functions
function leftArrow:touch(event)
	if (event.phase == 'ended') then
		-- Movement function
		transition.moveBy(theSnowMan, { 
			x = -50,
			y = 0,
			time = 100
			})
	end
end

-- Right Arrow Functions
function rightArrow:touch(event)
	if (event.phase == 'ended') then
		-- Movement function
		transition.moveBy(theSnowMan, { 
			x = 50,
			y = 0,
			time = 100
			})
	end
end

-- Event Listeners
upArrow:addEventListener('touch', upArrow)
downArrow:addEventListener('touch', downArrow)
leftArrow:addEventListener('touch', leftArrow)
rightArrow:addEventListener('touch', rightArrow)