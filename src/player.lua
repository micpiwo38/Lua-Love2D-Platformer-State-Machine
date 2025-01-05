--Un tableau

local Player = {
    posX = 20,
    posY = 400,
    width = 32,
    height = 32,
    speed = 200,
    gravity = 500, 
    velocity_y = 0, --Vitesse de chute verticale
    jump_force = -300,
    is_on_ground = false,
    --Animation
    state = "idle",
    animation_timer = 0,
    animation_frame = 1,
    animation_speed = 0.2, -- Vitesse de l'animation + plus grand = plus lent
    animation_speed_run = 0.1
};

--Load datas
function Player.load_datas()
    --Sprite_sheet IDLE
    Player.sprite_sheet_idle = love.graphics.newImage("img/player_idle.png");
    --Sprite_sheet RUN
    Player.sprite_sheet_run = love.graphics.newImage("img/player_run.png");
    --Tableau de carré pour IDLE
    Player.quads_idle = {
        --Pour idle 4 sprites de 32 * 32
        --start x + start y + sprite width et sprite height
        love.graphics.newQuad(0,0,32,32, Player.sprite_sheet_idle:getDimensions());
        love.graphics.newQuad(32,0,32,32, Player.sprite_sheet_idle:getDimensions());
        love.graphics.newQuad(64,0,32,32, Player.sprite_sheet_idle:getDimensions());
        love.graphics.newQuad(96,0,32,32, Player.sprite_sheet_idle:getDimensions());
    }

    --Tableau de carré pour RUN = 4 spites de 32 *32
    Player.quads_run = {
        --start x + start y + sprite width et sprite height
        love.graphics.newQuad(0,0,32,32, Player.sprite_sheet_run:getDimensions());
        love.graphics.newQuad(32,0,32,32, Player.sprite_sheet_run:getDimensions());
        love.graphics.newQuad(64,0,32,32, Player.sprite_sheet_run:getDimensions());
        love.graphics.newQuad(96,0,32,32, Player.sprite_sheet_run:getDimensions());
    }
end

--Update = Player
function Player.update_player(dt, floor, platforms)
    --le player bouge ?
    local is_moving = false;

    if love.keyboard.isDown("d") then
        Player.posX = Player.posX + Player.speed * dt;
        is_moving = true;
    end
    if love.keyboard.isDown("q") then
        Player.posX = Player.posX - Player.speed * dt;
        is_moving = true;
    end

    --Appliquer la pesanteur
    Player.velocity_y = Player.velocity_y + Player.gravity * dt;
    Player.posY = Player.posY + Player.velocity_y * dt;

    --Collision avec le sol  
    if Player.posY + Player.height > floor.posY then
        Player.posY = floor.posY - Player.height;
        Player.velocity_y = 0;
        Player.is_on_ground = true;
    else
        Player.is_on_ground = false;
    end

    --Collision avec les plateformes
    for _, platform in ipairs(platforms) do
        if Player.posX < platform.x + platform.width and
            Player.posX + Player.width > platform.x and
            Player.posY < platform.y + platform.height and
            Player.posY + Player.height > platform.y then
            Player.posY = platform.y - Player.height;
            Player.velocity_y = 0;
            Player.is_on_ground = true;
        end
    end

    --Le saut
    if love.keyboard.isDown("space") and Player.is_on_ground then
        Player.velocity_y = Player.jump_force;
        Player.is_on_ground = false;
    end

    if Player.posX < 0 then
        Player.posX = 0;
    end

    if Player.posX + Player.width > 800 then
        Player.posX = 800 - Player.width;
    end

    --Si le player bouge
    if is_moving then
        Player.state = "moving";
    else
        Player.state = "idle";
    end

    --Animation 60 fps
    Player.animation_timer = Player.animation_timer + dt;
    --Etat IDLE
    if Player.state == "idle" then
        if Player.animation_timer > Player.animation_speed then
            --Reset le timer
            Player.animation_timer = 0;
            --Passe a la frame suivante
            Player.animation_frame = (Player.animation_frame % #Player.quads_idle) + 1;
        end
    elseif Player.state == "moving" then
        if Player.animation_timer > Player.animation_speed_run then
            Player.animation_timer = 0;
            Player.animation_frame = (Player.animation_frame % #Player.quads_run) + 1;
        end
    end

end

function Player.draw_player()
    if Player.state == "idle" then
        love.graphics.draw(Player.sprite_sheet_idle, Player.quads_idle[Player.animation_frame], Player.posX, Player.posY);
    elseif Player.state == "moving" then
        love.graphics.draw(Player.sprite_sheet_run, Player.quads_run[Player.animation_frame], Player.posX, Player.posY);
    end
end


return Player;