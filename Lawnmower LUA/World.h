#pragma once

#include "Tile.h"
#include "Player.h"
#include "lua.hpp"
#include <SFML\Graphics.hpp>
#include <vector>

class World: public sf::Drawable
{
private:
    std::vector<Tile> m_tiles;
    std::vector<Player*> m_players;
	lua_State* m_worldScript;
	sf::Vector2i mapSize;

public:
    World();
    virtual ~World();

	void update();
    void draw(sf::RenderTarget& target, sf::RenderStates states)const override;
    void movePlayer(int player, float deltaTime, const std::string& verticalDir, const std::string& horizontalDir);
};

