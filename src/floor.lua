--Un tableau

local Floor = {
    posX = 0,
    posY = 568,
    width = 800,
    height = 32,
    sprite_size = 32
};

--Load
function Floor.load_datas()
    --Charger l'image du sprite
    Floor.sprites = love.graphics.newImage("img/floor.png");
end


function Floor.draw_floor()
    --Données du sprite
    local sprite_width = Floor.sprites:getWidth();
    local sprite_height = Floor.sprites:getHeight();
    local number_sprite_x = math.ceil(Floor.width / sprite_width);
    local number_sprite_y = math.ceil(Floor.height / sprite_height);

    for i = 0, number_sprite_x - 1 do
        for j = 0, number_sprite_y - 1 do
            love.graphics.draw(Floor.sprites, Floor.posX + i * sprite_width, Floor.posY + j * sprite_height);
        end
    end
end


return Floor;