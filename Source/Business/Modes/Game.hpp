#pragma once 

namespace AGSR::Business::Modes
{
    template <class _Target>
    class Game
    {
    public:
        Game() = default;
        Game(const Game&) = delete;

        Game(const _Target& target);
        /**
        * @brief Checks if the hero's guessed
        * @details Just pure in here
        */
        auto IsGuessCorrect(const _Target& guess) const noexcept -> bool;

        auto SetTarget(const _Target& target) -> void;
        
        auto operator = (const Game&) -> Game& = delete;

    private:
        _Target m_Target{};
    };

    template <class _Target>
    Game<_Target>::Game(const _Target& target)
        : m_Target{ target } {}

    template <class _Target>
    auto Game<_Target>::IsGuessCorrect(const _Target& guess)
        const noexcept -> bool
    {
        return m_Target == guess;
    }

    template <class _Target>
    auto Game<_Target>::SetTarget(const _Target& target) -> void
    {
        m_Target = target;
    }
};
