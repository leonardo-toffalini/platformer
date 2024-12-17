local graphics = {}

function graphics.setColor(r, g, b)
  love.graphics.setColor(r/255, g/255, b/255)
end

function graphics.setColor3(c)
  graphics.setColor(c[1], c[2], c[3])
end

return graphics
