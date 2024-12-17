local Player = require("libs.player")
local Platform = require("libs.platform")
local Background = require("libs.background")
local sti = require("libs.sti")


function love.load()
  -- set the default resizing properties
  love.graphics.setDefaultFilter("nearest", "nearest")

  platforms = {}
  gameMap = sti("maps/gameMap.lua")

  local window_width = gameMap.width * gameMap.tilewidth
  local window_height = gameMap.height * gameMap.tileheight
  love.window.setMode(window_width, window_height)

  if gameMap.layers["platforms"] then
    for i, obj in pairs(gameMap.layers["platforms"].objects) do
      platforms[#platforms+1] = Platform(obj.x, obj.y, obj.width, obj.height, {255, 0, 0})
    end
  end

  player = Player()
  background = Background()
end

function love.update(dt)
  player:update(platforms, dt)
end

function love.draw()
  -- background:draw()
  love.graphics.setColor(1, 1, 1)
  gameMap:draw()
  -- for _, platform in ipairs(platforms) do
  --   platform:draw()
  -- end
  player:draw()
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

