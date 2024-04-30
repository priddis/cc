if arg[1] == nil then 
    print("input branches")
    return
end 

if arg[2] == nil then 
    print("input length of each branch")
    return
end 

local x = 0;
local y = 0;

function trunk(branches, length) 
    for i=1, branches do
        turtle.turnRight();

        turtle.dig();
        turtle.digUp();
        turtle.forward();

        turtle.dig();
        turtle.digUp();
        turtle.forward();

        turtle.dig();
        turtle.digUp();
        turtle.forward();
        
        turtle.turnLeft();
        branch(length);
    end
    turtle.turnLeft();
    for i=1, branches do
        while turtle.detect() do
            turtle.dig();
        end
        turtle.forward();
        while turtle.detect() do
            turtle.dig();
        end
        turtle.forward();
        while turtle.detect() do
            turtle.dig();
        end
        turtle.forward();
    end
end

function branch(length)  
    for i=1, length do
        turtle.dig()
        turtle.digUp();
        turtle.forward();
    end
    turtle.turnLeft();
    turtle.turnLeft();


    for i=1, length do
        while turtle.detect() do
            turtle.dig();
        end
        turtle.forward();
    end
    turtle.turnLeft();
    turtle.turnLeft();
end

trunk(arg[1], arg[2])
