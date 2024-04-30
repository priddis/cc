t = turtle
local wanted = {
    "minecraft:oak_log"
}

function search() 
    local is_block, block_data = t.inspect();
    -- forward
    if is_wanted(block_data.name, wanted) then
        t.dig();
        t.forward();
        search();
        t.back();
    end

    -- left
    t.turnLeft();
    local is_block, block_data = t.inspect();
    if is_wanted(block_data.name, wanted) then
        t.dig();
        t.forward();
        search();
        t.back();
    end

    --right
    t.turnRight();
    t.turnRight();
    local is_block, block_data = t.inspect();
    if is_wanted(block_data.name, wanted) then
        t.dig();
        t.forward();
        search();
        t.back();
    end
    t.turnLeft();

    --up
    local is_block, block_data = t.inspectUp();
    if is_wanted(block_data.name, wanted) then
        t.digUp();
        t.up();
        search();
        t.down();
    end

    --down
    local is_block, block_data = t.inspectDown();
    if is_wanted(block_data.name, wanted) then
        t.digDown();
        t.down();
        search();
        t.up();
    end
end


function is_wanted(name, wanted) 
    for i, wanted_name in ipairs(wanted) do
        if wanted_name == name then
            return true
        end
    end
    return false
end
search();
