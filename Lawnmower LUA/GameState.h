#pragma once
#include "State.h"
#include "World.h"
#include <vector>
#include "Button.h"
#include "ResourceManager.h"
#include <memory>

class GameState: public State
{
private:
    std::shared_ptr<ResourceManager> m_resources;
	World m_world;

    sf::Time m_time;
    sf::Clock m_clock;

public:
    GameState(sf::RenderWindow& window, std::shared_ptr<ResourceManager> resources);
    ~GameState();

    void handleEvents() override;
    void handleInput() override;
    void update() override;
    void draw()const override;

    void pause() override;
    void resume() override;
};

