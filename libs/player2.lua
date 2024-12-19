local Object = require("libs/classic")
local Player2 = Object:extend()

function Player2:new(world)
  self.model = world:newRectangleCollider(200, 200, 40, 52)
  self.model:setCollisionClass("Player")
  self.model:setObject(self)
  self.model:setFixedRotation(true)
  self.model:setLinearDamping(0.9)

  self.onPlatform = false
end

function Player2:update()
  if self.model:enter("Platform") then
    self.onPlatform = true
  end

  local vx, vy = self.model:getLinearVelocity()
  if love.keyboard.isDown("left") and vx > -300 then
    self.model:applyForce(-5000, 0)
  end
  if love.keyboard.isDown("right") and vx < 300 then
    self.model:applyForce(5000, 0)
  end
end

function Player2:jump()
  if self.onPlatform then
    self.model:applyLinearImpulse(0, -4000)
    self.onPlatform = false
  end
end

return Player2
