local Player = require("libs/player")
local Platform = require("libs/platform")
local Background = require("libs/background")
local wf = require("libs/windfield")

local window_width, window_height = love.graphics.getDimensions()

-- function love.load()
--   -- set the default resizing properties
--   love.graphics.setDefaultFilter("nearest", "nearest")
--
--   player = Player()
--   background = Background()
--   platforms = {}
--   platforms[1] = Platform(180, window_height - 40, 80, 20, {168, 213, 189})
--   platforms[2] = Platform(240, window_height - 120, 80, 20, {168, 213, 189})
-- end
--
-- function love.update(dt)
--   player:update(platforms, dt)
-- end
--
-- function love.draw()
--   background:draw()
--   player:draw()
--   for _, platform in ipairs(platforms) do
--     platform:draw()
--   end
-- end

local player2 = require("libs/player2")

function love.load()
  world = wf.newWorld(0, 512, true)
  world:setGravity(0, 2048)
  world:addCollisionClass('Platform')
  world:addCollisionClass('Player')
  print(world:getGravity())

  ground = Platform(world, 100, 500, 600, 50)
  platform = Platform(world, 350, 400, 100, 20)
  player = player2(world)

  -- player:setPreSolve(function(collider_1, collider_2, contact)
  --   if collider_1.collision_class == 'Player' and collider_2.collision_class == 'Platform' then
  --     local px, py = collider_1:getPosition()
  --     local pw, ph = 20, 40
  --     local tx, ty = collider_2:getPosition()
  --     local tw, th = 100, 20
  --     if py + ph/2 > ty - th/2 then contact:setEnabled(false) end
  --   end
  -- end)
end

function love.update(dt)
  world:update(dt)
  player:update()
end

function love.draw()
  world:draw()
end

function love.keypressed(key)
  if key == 'space' then
    player:applyLinearImpulse(0, -1000)
  end
  if key == "escape" then
    love.event.quit()
  end
end

