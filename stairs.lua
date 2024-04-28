local moving = true
while moving do
    moving = moving and turtle.dig()
    moving = moving and turtle.forward()
    moving = moving and turtle.digUp()
    moving = moving and turtle.digDown()
    moving = moving and turtle.down()
end
