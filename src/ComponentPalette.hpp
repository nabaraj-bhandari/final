#pragma once
#include <SFML/Graphics.hpp>
#include <optional>
#include <vector>

#include "Gate.hpp"

class ComponentPalette {
   private:
    void setupButtons();
    void setupTexts();
    std::string getGateTypeName(GateType type) const;
    std::vector<sf::RectangleShape> buttons;
    std::vector<GateType> type;
    int selectedIndex = 0;  // input is selected by default so 0
    int hoveredIndex = -1;  // nothing is hovered so -1 (out of index)
    sf::View uiView;
    const sf::Font *currentFont = nullptr;
    std::optional<sf::Text> titleText;
    std::vector<sf::Text> buttonLabels;
    std::vector<sf::Text> instructionTexts;

   public:
    ComponentPalette();
    void setFont(const sf::Font &font);
    void handleEvent(const sf::Event &event, const sf::RenderWindow &window);
    void update();
    void draw(sf::RenderWindow &window);
    GateType getSelectedGateType() const;
};