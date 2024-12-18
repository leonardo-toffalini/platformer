local Object = require("libs.classic")
local graphics = require("libs.graphics")
local Rectangle = Object:extend()

function Rectangle:new(x, y, w, h, c)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.c = c
end

function Rectangle:checkCollision(other)
  return self.x + self.w > other.x
    and self.x < other.x + other.w
    and self.y + self.h > other.y
    and self.y < other.y + other.h
end

function Rectangle:checkCollisionDirection(other)
  local xLeft = other.x + other.w - self.x
  local xRight = self.x + self.w - other.x
  local yTop = other.y + other.h - self.y
  local yBot = self.y + self.h - other.y

  local minX = math.min(xLeft, xRight)
  local minY = math.min(yTop, yBot)

  if minX < minY then -- horizontal collision
    if xLeft > xRight then
      return "left"
    else
      return "right"
    end
  else -- vertical collision
    if yTop > yBot then
      return "top"
    else
      return "bot"
    end
  end
end

function Rectangle:draw()
  graphics.setColor3(self.c)
  love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
  graphics.setColor(1, 1, 1)
end

return Rectangle
