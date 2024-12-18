local Player = require("libs.player")
local Platform = require("libs.platform")
-- local Background = require("libs.background")
local sti = require("libs.sti")

local scale = 2

function love.load()
  -- set the default resizing properties
  love.graphics.setDefaultFilter("nearest", "nearest")

  platforms = {}
  gameMap = sti("maps/gameMap.lua")

  -- local windowWidth = gameMap.width * gameMap.tilewidth
  -- local windowHeight = gameMap.height * gameMap.tileheight
  love.window.setMode(960, 640)

  if gameMap.layers["platforms"] then
    for _, obj in pairs(gameMap.layers["platforms"].objects) do
      platforms[#platforms+1] = Platform(scale * obj.x, scale * obj.y, scale * obj.width, scale * obj.height, {255, 0, 0})
    end
  end

  player = Player()
  -- background = Background()
end

function love.update(dt)
  player:update(platforms, dt)
end

function love.draw()
  -- background:draw()
  love.graphics.setColor(1, 1, 1)
  gameMap:draw(0, 0, scale, scale)
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

