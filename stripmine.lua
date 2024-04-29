if arg[1] == nil then 
    print("please input a length paramter")
    return
end 

if arg[2] == nil then 
    print("please input the number of branches")
    return
end 

function trunk(branches, length) 
    for i=1, branches do
        turtle.turnRight();

        turtle.dig();
        turtle.digUp();
        turtle.forward();

        turtle.dig();
        turtle.digUp();
        turtle.forward();
        
        turtle.turnLeft();
        branch(length);
    end
end

function branch(length)  
    for i=1, length do
        turtle.dig()
        turtle.digUp();
        turtle.forward();
    end

    for i=1, length do
        turtle.back();
    end
end

trunk(arg[1], arg[2])
