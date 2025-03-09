-- entity_template.lua

-- requires

return function(x_pos, y_pos, id)
    local Entity = {
        id = id,
        type = "",
        x = x_pos,
        y = y_pos,
        actions = {},
        -- sprite = love.graphics.newImage("assets/sprites/box.png")
    }

    Entity.draw = function()

    end



    Entity.update = function(dt)

    end


    return Entity
end
