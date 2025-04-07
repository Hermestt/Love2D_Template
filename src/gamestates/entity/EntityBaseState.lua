--[[
    File: EntityBaseState.lua
    Description: Entities base state class
    Created: 2025-04-07
    Author: Pedro Oliveira
    Notes: Use this as a base class for all entities states. So there's no need to define empty methods in each one of them.
]]

local EntityBaseState = {}

function EntityBaseState:new()
    print("New base state created")
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function EntityBaseState:init(entity)
    self.entity = entity
end

function EntityBaseState:enter()
    -- Default behaviour (optional)
end

function EntityBaseState:update()
    -- Default behaviour (optional)
end

function EntityBaseState:exit()
    -- Default behaviour (optional)
end

function EntityBaseState:render()
    love.graphics.rectangle("fill", (self.entity.render_x - 1) * GRID_TILE_SIZE,
        (self.entity.render_y - 1) * GRID_TILE_SIZE,
        GRID_TILE_SIZE,
        GRID_TILE_SIZE)
    if self.entity.moving then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle("fill", (self.entity.render_x - 1) * GRID_TILE_SIZE,
            (self.entity.render_y - 1) * GRID_TILE_SIZE,
            GRID_TILE_SIZE,
            GRID_TILE_SIZE)
        love.graphics.setColor(1, 1, 1, 1)
    end
end

return EntityBaseState
