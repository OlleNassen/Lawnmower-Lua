#pragma once
#include "State.h"
#include "lua.hpp"
#include <fstream>

class EditorState :public State
{
private:
    std::shared_ptr<ResourceManager> m_resources;
	std::vector<std::vector<sf::Sprite>> m_tiles;
	lua_State* L;

	void changeSprite(int type, sf::Vector2i index);
	void loadLuaScript();
	void loadGrid();
public:
    EditorState(sf::RenderWindow& window, std::shared_ptr<ResourceManager> resources);
    ~EditorState();

    void handleEvents() override;
    void handleInput() override;
    void update() override;
    void draw()const override;

    void pause() override;
    void resume() override;

    void saveToFile()const;
};

