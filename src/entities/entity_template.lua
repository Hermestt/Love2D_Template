-- entity/box.lua

-- requires

return function(x_pos, y_pos, id)
    local entity = {
        id = id,
        type = "",
        x = x_pos,
        y = y_pos,
        actions = {},
        -- sprite = love.graphics.newImage("assets/sprites/box.png")
    }

    entity.draw = function()

    end



    entity.update = function(dt)

    end


    return entity
end
