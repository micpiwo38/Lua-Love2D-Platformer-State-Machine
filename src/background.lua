local Background = {
    posX = 0,
    posY = 0,
    width = 800,
    height = 568,
    sprite_size = 32,
}

--Load data
function Background.load_data()
    Background.sprites = love.graphics.newImage("img/background.png");
end

--Draw
function Background.draw_bg()
    local sprite_width = Background.sprites:getWidth();
    local sprite_height = Background.sprites:getHeight();
    local number_sprite_x = math.ceil(Background.width / sprite_width);
    local number_sprite_y = math.ceil(Background.height / sprite_height);

    for i = 0, number_sprite_x - 1 do
        for j = 0, number_sprite_y - 1 do
            love.graphics.draw(Background.sprites, Background.posX + i * sprite_width, Background.posY + j * sprite_height);
        end
    end
end

return Background;