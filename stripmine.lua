t = turtle
local wanted = {
    "minecraft:diamond_ores",
    "minecraft:iron_ores",
    "minecraft:redstone_ores",
    "minecraft:coal_ores",
    "minecraft:gold_ores"
}
if arg[1] == nil then 
    print("input branches")
    return
end 

if arg[2] == nil then 
    print("input length of each branch")
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
        search();
        turtle.dig();
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

function search() 
    local is_block, block_data = t.inspect();
    -- forward
    if is_wanted(block_data, wanted) then
        t.dig();
        t.forward();
        search();
        t.back();
    end

    -- left
    t.turnLeft();
    local is_block, block_data = t.inspect();
    if is_wanted(block_data, wanted) then
        t.dig();
        t.forward();
        search();
        t.back();
    end

    --right
    t.turnRight();
    t.turnRight();
    local is_block, block_data = t.inspect();
    if is_wanted(block_data, wanted) then
        t.dig();
        t.forward();
        search();
        t.back();
    end
    t.turnLeft();

    --up
    local is_block, block_data = t.inspectUp();
    if is_wanted(block_data, wanted) then
        t.digUp();
        t.up();
        search();
        t.down();
    end

    --down
    local is_block, block_data = t.inspectDown();
    if is_wanted(block_data, wanted) then
        t.digDown();
        t.down();
        search();
        t.up();
    end
end


function is_wanted(block_data, wanted) 
    for i, tag in ipairs(wanted) do
        print(block_data.tags)
        print(tag)
        if block_data.tags[tag] then
            return true
        end
    end
    return false
end



trunk(arg[1], arg[2])


