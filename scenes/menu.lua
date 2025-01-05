
local Menu = {
    btn_pos_x = 300;
    btn_play_pos_y = 100;
    btn_credits_pos_y = 200;
    btn_quit_pos_y = 300;
    btn_width = 200;
    btn_height = 60;
};

function Menu.load_datas()
    Menu.font = love.graphics.newFont("fonts/ubuntu.ttf", 32);
end

function Menu.draw_menu_button()
    --Couleur des boutons
    love.graphics.setColor(0.1,0.2,0.1);
    love.graphics.rectangle("fill", Menu.btn_pos_x, Menu.btn_play_pos_y, Menu.btn_width, Menu.btn_height);
    love.graphics.rectangle("fill", Menu.btn_pos_x, Menu.btn_credits_pos_y, Menu.btn_width, Menu.btn_height);
    love.graphics.rectangle("fill", Menu.btn_pos_x, Menu.btn_quit_pos_y, Menu.btn_width, Menu.btn_height);
    --Couleur du texte
    love.graphics.setFont(Menu.font);
    love.graphics.setColor(1,1,1);
    love.graphics.print("PLAY", Menu.btn_pos_x + 60, Menu.btn_play_pos_y + 10);
    love.graphics.print("CREDITS", Menu.btn_pos_x + 40, Menu.btn_credits_pos_y + 10);
    love.graphics.print("QUIT", Menu.btn_pos_x + 60, Menu.btn_quit_pos_y + 10);
    --Reinitialisé la couleur pour eviter d'affecter d'autres formes
    love.graphics.setColor(1,1,1);
end

function Menu.mousepressed(x, y,button, is_touch, presses)
    if button == 1 then --clic gauche de la souris
        if x > Menu.btn_pos_x and x < Menu.btn_pos_x + Menu.btn_width then
            if y > Menu.btn_play_pos_y and y < Menu.btn_play_pos_y + Menu.btn_height then
                Menu.current_scene = "level1";
            elseif y > Menu.btn_credits_pos_y and y < Menu.btn_credits_pos_y + Menu.btn_height then
                Menu.current_scene = "credits";
            elseif y > Menu.btn_quit_pos_y and y < Menu.btn_quit_pos_y + Menu.btn_height then
                love.event.quit();
            end
        end
    end   
end

return Menu;



