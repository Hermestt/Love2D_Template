--[[
    File: Room.lua
    Description: Define the behaviour of a room
    Created: 2025-04-05
    Author: Pedro Oliveira
]]

local Room = {}

function Room:new()
    local obj = {} -- create object if user doesn't provide one
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Room:init(player, room_name)
    self.tiles = {}
    self.player = player
    self.room_name = room_name
end

function Room:GenerateWallsAndFloors()
    for y = 1, GRID_MAX_ROWS do
        table.insert(self.tiles, {})

        for x = 1, GRID_MAX_COLUMNS do
            local id = TILE_EMPTY

            if x == 1 and y == 1 then
                id = TILE_TOP_LEFT_CORNER
            elseif x == 1 and y == GRID_MAX_ROWS then
                id = TILE_BOTTOM_LEFT_CORNER
            elseif x == GRID_MAX_COLUMNS and y == 1 then
                id = TILE_TOP_RIGHT_CORNER
            elseif x == GRID_MAX_COLUMNS and y == GRID_MAX_ROWS then
                id = TILE_BOTTOM_RIGHT_CORNER
            elseif x == 1 then
                id = TILE_LEFT_WALL
            elseif x == GRID_MAX_COLUMNS then
                id = TILE_RIGHT_WALL
            elseif y == 1 then
                id = TILE_TOP_WALL
            elseif y == GRID_MAX_ROWS then
                id = TILE_BOTTOM_WALL
            else
                id = TILE_FLOOR
            end

            table.insert(self.tiles[y], {
                id = id
            })
        end
    end
end

function Room:render()
    for y = 1, GRID_MAX_ROWS do
        for x = 1, GRID_MAX_COLUMNS do
            local tile = self.tiles[y][x]

            -- Corners
            if tile.id == TILE_TOP_LEFT_CORNER then
                love.graphics.setColor(1, 0, 0, 1)
                love.graphics.rectangle("fill", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end

            if tile.id == TILE_TOP_RIGHT_CORNER then
                love.graphics.setColor(1, 1, 0, 1)
                love.graphics.rectangle("fill", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end

            if tile.id == TILE_BOTTOM_RIGHT_CORNER then
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.rectangle("fill", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end

            if tile.id == TILE_BOTTOM_LEFT_CORNER then
                love.graphics.setColor(0, 1, 1, 1)
                love.graphics.rectangle("fill", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end

            -- WALLS
            if tile.id == TILE_TOP_WALL then
                love.graphics.setColor(1, 1, 0, 0.5)
                love.graphics.rectangle("fill", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end

            if tile.id == TILE_BOTTOM_WALL then
                love.graphics.setColor(1, 1, 1, 0.5)
                love.graphics.rectangle("fill", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end

            if tile.id == TILE_LEFT_WALL then
                love.graphics.setColor(0, 1, 0, 0.5)
                love.graphics.rectangle("fill", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end

            if tile.id == TILE_RIGHT_WALL then
                love.graphics.setColor(0, 1, 1, 0.5)
                love.graphics.rectangle("fill", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end

            if tile.id == TILE_FLOOR then
                love.graphics.setColor(1, 1, 1, 0.5)
                love.graphics.rectangle("line", (x - 1) * GRID_TILE_SIZE, (y - 1) * GRID_TILE_SIZE, GRID_TILE_SIZE,
                    GRID_TILE_SIZE)
                love.graphics.setColor(1, 1, 1, 1)
            end
        end
    end
end

return Room
