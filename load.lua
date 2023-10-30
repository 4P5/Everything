local function loadDir(directory)
    local files = listFiles(directory, true)
    for i = 1, #files do
        require(files[i])
    end
end

local immediate = {
    "startup",
    "libraries",
}

local entity_init = {
    "modules",
}

for i = 1, #immediate do
    loadDir(immediate[i])
end

function events.ENTITY_INIT()
    for i = 1, #entity_init do
        loadDir(entity_init[i])
    end
end