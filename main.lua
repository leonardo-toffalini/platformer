local Player = require("player")
local Platform = require("platform")

local window_width, window_height = love.graphics.getDimensions()

function love.load()
  -- set the default resizing properties
  love.graphics.setDefaultFilter("nearest", "nearest")

  player = Player()
  platforms = {}
  platforms[1] = Platform(180, window_height - 40, 80, 20, {168, 213, 189})
  platforms[2] = Platform(240, window_height - 120, 80, 20, {168, 213, 189})
end

function love.update(dt)
  player:update(platforms, dt)
end

function love.draw()
  player:draw()
  for _, platform in ipairs(platforms) do
    platform:draw()
  end
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

