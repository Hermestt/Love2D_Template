--[[
    File: Room.lua
    Description: Define the behaviour of a room
    Created: 2025-04-05
    Author: Pedro Oliveira
    Notes: I'm using the FSM pattern to toggle states on the entities
]]

local Entity = {}

function Entity:new(name)
    local obj = {
        name = name or "Noname",
        state = "idle",
        states = {},
        x = 1,
        y = 1,
        target_x = 1,
        target_y = 1,
        render_x = 1,
        render_y = 1,
        moving = false,
        movement_elapsed_time = 0,
        move_time = 0.35
        -- direction = nil - this will be needed to make the sprite face a direction
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Entity:init(x, y)
    print("Hi, my name is " .. self.name)
    self.x = x
    self.y = y
    self.render_x = x
    self.render_y = y
    self.target_x = x
    self.target_y = y
end

function Entity:update(dt)
    local stateDefinition = self.states[self.state]
    if stateDefinition and stateDefinition.update then
        stateDefinition:update(dt) -- Here we are calling the update function of the state! Not this entity. That why we don't send self, it already has self from the state:init. And using : means that self is already being passed in the args.
    end
end

function Entity:changeState(newState)
    if self.state == newState then return end

    if self.states[self.state] and self.states[self.state].exit then
        self.states[self.state]:exit()
    end

    self.state = newState

    if self.states[self.state] and self.states[self.state].enter then
        self.states[self.state]:enter()
    end
end

function Entity:render()
    local stateDefinition = self.states[self.state]
    if stateDefinition and stateDefinition.render then
        stateDefinition:render()
    end
end

return Entity
