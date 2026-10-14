#pragma once 

namespace AGSR::Business::Modes
{
    template <class _Target>
    class Game
    {
    public:
        Game(const _Target target) noexcept;
        Game(const Game& game);
        /**
        * @brief Checks if the hero's guessed
        * @details Just pure in here
        */
        auto IsGuessCorrect(const _Target target) -> bool
        {
            return m_Target == target;
        }
        
        auto operator = (const Game& game) -> Game& = delete;

    private:
        _Target m_Target;
    };
};
