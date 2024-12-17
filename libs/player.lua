local Rectangle = require("libs.rectangle")
local anim8 = require("libs.anim8")
local graphics = require("libs.graphics")
local Player = Rectangle:extend()

local window_width, window_height = love.graphics.getDimensions()
local G = 5000  -- this looked good to me
local max_v = 500  -- this looked good to me

function Player:new()
  local x = 100; local y = 100; local w = 40; local h = 52; local c = {255, 0, 0}-- local c = {204, 202, 167}
  Player.super:new(x, y, w, h, c)
  self.vy = 0
  self.vx = 150
  self.a = 0
  self.is_crouching = false

  -- animations
  self.walk_sprite = love.graphics.newImage("sprites/player_walk.png")
  self.walk_grid = anim8.newGrid(
    32, 32,
    self.walk_sprite:getWidth(), self.walk_sprite:getHeight()
  )
  self.animations = {}
  self.animations.right = anim8.newAnimation(self.walk_grid("1-6", 1), 0.1)
  self.animations.left = self.animations.right:clone():flipH()
  self.anim = self.animations.right

  -- debugging
  self.show_hitbox = true
end

function Player:update(platforms, dt)
  self:jump()
  -- self:crouch()
  local is_moving = self:move(dt)
  if not is_moving then
    self.anim:gotoFrame(6)
  end
  self.anim:update(dt)

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
  -- return true if the player is moving
  -- left-right movement
  if love.keyboard.isDown("left") then
    self.x = self.x - self.vx * dt
    self.anim = self.animations.left
    return true
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.vx * dt
    self.anim = self.animations.right
    return true
  end
  return false
end

function Player:jump()
  if not love.keyboard.isDown("up") then
    return
  end
  if self.vy == 0 and self.a == 0 then
    self.y = self.y - 1
    self.vy = -400
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

function Player:draw()
  if self.show_hitbox then
    graphics.setColor3(self.c)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
  end
  love.graphics.setColor(1, 1, 1)
  self.anim:draw(self.walk_sprite, self.x, self.y, nil, 2, 2, 5, 6)
end

return Player
