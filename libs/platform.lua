local Object = require("libs/classic")
local Platform = Object:extend()

function Platform:new(world, x, y, w, h)
  self.model = world:newRectangleCollider(x, y, w, h)
  self.model:setCollisionClass("Platform")
  self.model:setObject(self)
  self.model:setType('static')
end

return Platform
