local name = avatar:getEntityName()
local gradient = {
    from = vectors.hexToRGB("#00AAAA"),
    to = vectors.hexToRGB("#00AA00"),
}

local name_length = #name
local chars = {}
for i = 1, name_length do
    local colour = math.lerp(gradient.from, gradient.to, (i - 1) / (name_length - 1))
    local char = string.sub(name, i, i)
    local hex = string.format("#%02x%02x%02x", colour.x * 255, colour.y * 255, colour.z * 255)
    chars[i] = { text = char, color = hex }
end

local prefix = ""
local suffix = "${badges}"
nameplate.ALL:setText(toJson{prefix, chars, suffix})
