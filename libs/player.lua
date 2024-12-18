local Rectangle = require("libs.rectangle")
local anim8 = require("libs.anim8")
local graphics = require("libs.graphics")
local Player = Rectangle:extend()

-- TODO: dont hardcode the height and width of the window (love.graphics.getDimension() does not work)
local windowWidth, windowHeight = 960, 640
local G = 5000  -- this looked good to me
local maxV = 500  -- this looked good to me
local dashDistance = 50
local movingSpeed = 180
local bigJump = 400
local smallJump = 300
local minAirTimeDoubleJump = 0.3
local dashCooldown = 0.5

function Player:new()
  local x = 100; local y = 100; local w = 30; local h = 39; local c = {255, 0, 0}-- local c = {204, 202, 167}
  Player.super:new(x, y, w, h, c)
  self.vy = 0
  self.vx = 0
  self.a = 0
  self.isCrouching = false
  self.dashTimer = 0

  -- animations
  self.walkSprite = love.graphics.newImage("sprites/player_walk.png")
  self.walkGrid = anim8.newGrid(
    32, 32,
    self.walkSprite:getWidth(), self.walkSprite:getHeight()
  )
  self.animations = {}
  self.animations.right = anim8.newAnimation(self.walkGrid("1-6", 1), 0.1)
  self.animations.left = self.animations.right:clone():flipH()
  self.anim = self.animations.right

  -- debugging
  self.showHitbox = true
end

function Player:update(platforms, dt)
  self:jump()
  self:dash(dt)
  self:doubleJump(dt)
  -- self:crouch()
  local isMoving = self:move(dt)
  if not isMoving then
    self.anim:gotoFrame(6)
  end
  self.anim:update(dt)

  if not self:checkPlatforms(platforms) then
    -- no platform below => gravity applies
    self:applyGravity(dt)
  end

  self:checkBoundaries()
end

function Player:applyGravity(dt)
  -- Explicit Euler
  self.a = self.a + dt * G
  self.vy = math.min(maxV, self.vy + dt * self.a)
  self.y = self.y + dt * self.vy
end

function Player:move(dt)
  -- return true if the player is moving
  self.x = self.x + self.vx * dt
  -- left-right movement
  if love.keyboard.isDown("a") then
    self.vx = -movingSpeed
    self.anim = self.animations.left
    self.direction = "left"
    return true
  elseif love.keyboard.isDown("d") then
    self.vx = movingSpeed
    self.anim = self.animations.right
    self.direction = "right"
    return true
  else
    self.vx = 0
  end
  return false
end

function Player:jump()
  if not love.keyboard.isDown("space") then
    return
  end
  if self.vy == 0 and self.a == 0 then
    self.y = self.y - 1
    self.vy = -bigJump
  end
end

function Player:dash(dt)
  self.dashTimer = math.max(self.dashTimer - dt, 0)
  if self.vy == 0 and self.a == 0 then
    self.isDashAvailable = true
  end
  if self.isDashAvailable and love.keyboard.isDown("lshift") and self.dashTimer == 0 then
    self.dashTimer = dashCooldown
    self.a = 0
    self.vy = 0
    if self.direction == "right" then
      self.x = self.x + dashDistance
      self.isDashAvailable = false
    elseif self.direction == "left" then
      self.x = self.x - dashDistance
      self.isDashAvailable = false
    end
  end
end

function Player:doubleJump(dt)
  if self.vy == 0 and self.a == 0 then
    self.isDoubleJumpAvailable = true
    self.airTime = 0
    return
  end
  self.airTime = self.airTime + dt
  if self.isDoubleJumpAvailable and self.airTime > minAirTimeDoubleJump and love.keyboard.isDown("space") then
    self.vy = -smallJump
    self.a = 0
    self.isDoubleJumpAvailable = false
  end
end

function Player:crouch()
  if love.keyboard.isDown("down") then
    if not self.isCrouching then
      self.isCrouching = true
      self.h = 20
      self.y = self.y + 10
    end
  else
    if self.isCrouching then
      self.isCrouching = false
      self.h = 30
      self.y = self.y - 10
    end
  end
end

function Player:checkBoundaries()
  if self.x < 0 then
    self.x = 0
  end
  if self.x + self.w > windowWidth then
    self.x = windowWidth - self.w
  end
  if self.y > windowHeight then
    self.x = 100
    self.y = 100
  end
end

function Player:checkPlatforms(platforms)
  -- does the collision logic with the platforms
  -- returns true if a platform is below the player
  for _, platform in ipairs(platforms) do
    if self:checkCollision(platform) then
      local d = self:checkCollisionDirection(platform)
      if d == "top" then
        self.y = platform.y - self.h
        self.vy = 0
        self.a = 0
        return true
      elseif d == "bot" then
        self.y = platform.y + platform.h
        self.vy = 0
        self.a = 0
      elseif d == "left" then self.x = platform.x - self.w
      elseif d == "right" then self.x = platform.x + platform.w
      end
    end
  end
  return false
end

function Player:draw()
  if self.showHitbox then
    graphics.setColor3(self.c)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
  end
  love.graphics.setColor(1, 1, 1)
  self.anim:draw(self.walkSprite, self.x, self.y, nil, 1.5, 1.5, 5, 6)
end

return Player
