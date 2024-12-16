local Rectangle = require("rectangle")
local Player = Rectangle:extend()

local window_width, window_height = love.graphics.getDimensions()
local G = 5000  -- this looked good to me
local max_v = 500  -- this looked good to me

function Player:new(x, y, w, h, c)
  Player.super:new(x, y, w, h, c)
  self.vy = 0
  self.vx = 100
  self.a = 0
  self.is_crouching = false
end

function Player:update(platforms, dt)
  self:move(dt)
  self:jump()
  self:crouch()

  if not self:check_platforms(platforms) then
    -- no platform below => gravity applies
    -- Explicit Euler
    self.a = self.a + dt * G
    self.vy = math.min(max_v, self.vy + dt * self.a)
    self.y = self.y + dt * self.vy
  end

  self:check_boundaries()
end

function Player:move(dt)
  -- left-right movement
  if love.keyboard.isDown("left") then
    self.x = self.x - self.vx * dt
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.vx * dt
  end
end

function Player:jump()
  if not love.keyboard.isDown("up") then
    return
  end
  if self.vy == 0 and self.a == 0 then
    self.y = self.y - 1
    self.vy = -500
  end
end

function Player:crouch()
  if love.keyboard.isDown("down") then
    if not self.is_crouching then
      self.is_crouching = true
      self.h = 20
      self.y = self.y + 10
    end
  else
    if self.is_crouching then
      self.is_crouching = false
      self.h = 30
      self.y = self.y - 10
    end
  end
end

function Player:check_boundaries()
  if self.x < 0 then
    self.x = 0
  end
  if self.x + self.w > window_width then
    self.x = window_width - self.w
  end
end

function Player:check_platforms(platforms)
  -- does the collision logic with the platforms
  -- returns true if a platform is below the player
  for _, platform in ipairs(platforms) do
    if self:check_collision(platform) then
      local d = self:check_collision_direction(platform)
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

return Player
