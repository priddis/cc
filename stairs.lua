local moving = true
while moving do
    turtle.dig()
    moving = moving and turtle.forward()
    turtle.digUp()
    turtle.digDown()
    moving = moving and turtle.down()
end
