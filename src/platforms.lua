
Platforms = {
    { x = 100, y = 300, width = 200, height = 32 },
    { x = 400, y = 250, width = 150, height = 32 },
    { x = 600, y = 400, width = 100, height = 32 },
    { x = 200, y = 500, width = 250, height = 32 }
}

--Load datas
function Platforms.load_datas()
    Platforms.sprites = love.graphics.newImage("img/blue_block.png");
end

function Platforms.draw_platforms()
    local sprite_width = Platforms.sprites:getWidth();
    local sprite_height = Platforms.sprites:getHeight();


    for _, platform in ipairs(Platforms) do
        local number_sprite_x = math.ceil(platform.width / sprite_width);
        local number_sprite_y = math.ceil(platform.height / sprite_height);

        for i = 0, number_sprite_x - 1 do
            for j = 0, number_sprite_y - 1 do
                love.graphics.draw(Platforms.sprites, platform.x + i * sprite_width, platform.y + j * sprite_height);     
            end
        end
    end
end

return Platforms