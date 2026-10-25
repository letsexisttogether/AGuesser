#pragma once

#include "Sessions/Session.hpp"
#include "Business/Modes/Traits/Game.hpp"
#include "Business/Royal/Providers/Traits/Provider.hpp"

namespace AGSR::Sessions::Royal
{
    using TraitsSession = Session<Business::Modes::Traits::Game,
        Business::Modes::Traits::Result,
        Business::Royal::Providers::TraitsProvider>;
};
