-- scene.lua

local Scene_Manager = {}

Scene_Manager.current = nil
Scene_Manager.scenes = {}

---
---Registers a scene onto Scene_Manager
---
---This will allow this file to be reusable in different projects and only load scenes when we want
---
---@param name string # The name of the scene to register.
---@param sceneTable table # The table of the scene to register.
function Scene_Manager.register(name, sceneTable)
    sceneTable.name = name
    Scene_Manager.scenes[name] = sceneTable
end

function Scene_Manager.switch(name, ...)
    if Scene_Manager.scenes[name] then
        if Scene_Manager.current and Scene_Manager.current.exit then
            print("exiting " .. Scene_Manager.current.name)
            Scene_Manager.current.exit()
        end

        Scene_Manager.current = Scene_Manager.scenes[name]
        if Scene_Manager.current.load then
            print("loading " .. Scene_Manager.current.name)
            Scene_Manager.current.load(...)
        end
        return
    end
    print("Scene " .. name .. " does not exist")
end

function Scene_Manager.update(dt)
    if Scene_Manager.current and Scene_Manager.current.update then
        Scene_Manager.current.update(dt)
    end
end

function Scene_Manager.draw()
    if Scene_Manager.current and Scene_Manager.current.draw then
        Scene_Manager.current.draw()
    end
end

function Scene_Manager.keypressed(key_pressed)
    if Scene_Manager.current and Scene_Manager.current.keypressed then
        Scene_Manager.current.keypressed(key_pressed)
    end
end

function Scene_Manager.keyreleased(key_released)
    if Scene_Manager.current and Scene_Manager.current.keyreleased then
        Scene_Manager.current.keyreleased(key_released)
    end
end

return Scene_Manager
