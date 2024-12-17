local Object = require("classic")
local Background = Object:extend()

function Background:new()
  self.images = {}
  self.images[1] = love.graphics.newImage("sprites/background/1.png")
  self.images[2] = love.graphics.newImage("sprites/background/2.png")
  self.images[3] = love.graphics.newImage("sprites/background/3.png")
  self.images[4] = love.graphics.newImage("sprites/background/4.png")

  local window_width, window_height = love.graphics.getDimensions()
  local image_width, image_height = self.images[1]:getDimensions()
  local x_scale = window_width / image_width
  local y_scale = window_height / image_height
  self.scale = math.max(x_scale, y_scale)
end

function Background:draw()
  love.graphics.setColor(1, 1, 1)
  for _, image in ipairs(self.images) do
    love.graphics.draw(image, 0, 0, nil, self.scale, self.scale)
  end
end

return Background
