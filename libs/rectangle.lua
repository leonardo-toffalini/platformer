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

function Rectangle:check_collision(other)
  return self.x + self.w > other.x
    and self.x < other.x + other.w
    and self.y + self.h > other.y
    and self.y < other.y + other.h
end

function Rectangle:check_collision_direction(other)
  local x_left = other.x + other.w - self.x
  local x_right = self.x + self.w - other.x
  local y_top = other.y + other.h - self.y
  local y_bot = self.y + self.h - other.y

  local min_x = math.min(x_left, x_right)
  local min_y = math.min(y_top, y_bot)

  if min_x < min_y then -- horizontal collision
    if x_left > x_right then
      return "left"
    else
      return "right"
    end
  else -- vertical collision
    if y_top > y_bot then
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
