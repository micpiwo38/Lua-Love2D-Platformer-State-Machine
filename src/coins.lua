
local Coins = {
    { x = 200, y = 250, width = 32, height = 32 },
    { x = 450, y = 200, width = 32, height = 32 },
    { x = 650, y = 350, width = 32, height = 32 },
    { x = 300, y = 450, width = 32, height = 32 },
}

function Coins.load_datas()
    Coins.sprites = love.graphics.newImage("img/coins.png");
    Coins.quads = {
        love.graphics.newQuad(0,0,32,32, Coins.sprites:getDimensions());
        love.graphics.newQuad(32,0,32,32, Coins.sprites:getDimensions());
        love.graphics.newQuad(64,0,32,32, Coins.sprites:getDimensions());
    }
    Coins.animation_timer = 0;
    Coins.animation_frame = 1;
    Coins.animation_speed = 0.2;
end

--Update
function Coins.update_coins(dt)
    Coins.animation_timer = Coins.animation_timer + dt;

    if Coins.animation_timer > Coins.animation_speed then
        Coins.animation_timer = 0;
        Coins.animation_frame = (Coins.animation_frame % #Coins.quads) + 1;
    end
end


--Draw
function Coins.draw_animated_coins()

    for _, coin in ipairs(Coins) do
        love.graphics.draw(Coins.sprites, Coins.quads[Coins.animation_frame], coin.x, coin.y);  
    end
end

return Coins;