
--Launch Ctrl + Alt + L

--Load = Charger les données
function love.load()
    --Import des fichiers distants
    Menu = require("scenes/menu");
    Player = require("src/player");
    Floor = require("src/floor");
    Platforms = require("src/platforms");
    Background = require("src/background");
    Coins = require("src/coins");

    Menu.load_datas();
    --Scene de depart
    Menu.current_scene = "menu";
    --Load datas
    Background.load_data();
    Floor.load_datas();
    Platforms.load_datas();
    Coins.load_datas();
    Player.load_datas();
    
end

--Update = Game Loop
function love.update(dt)
    if Menu.current_scene == "level1" then
        Player.update_player(dt, Floor, Platforms);
        Coins.update_coins(dt);
    end
end

--Render = Afficher a l'ecran
function love.draw()
    if Menu.current_scene == "menu" then
        Menu.draw_menu_button();
    elseif Menu.current_scene == "level1" then
        --Dessiner dans l'ordre pour gerer le z-index
        --Background
        Background.draw_bg();
        --Le sol
        Floor.draw_floor();
        --Les platformes
        Platforms.draw_platforms();
        --Coins
        Coins.draw_animated_coins();
        --Le player
        Player.draw_player();
    end
end

--Clic event
function love.mousepressed(x, y, button, is_touch, presses)
    if Menu.current_scene == "menu" then
        Menu.mousepressed(x,y,button,is_touch,presses)
    elseif Menu.current_scene == "level1" and button == 1 then
        Player.shoot();
    end
end