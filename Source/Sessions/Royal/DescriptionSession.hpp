#pragma once

#include "Sessions/Session.hpp"
#include "Business/Modes/Description/Game.hpp"
#include "Business/Royal/Providers/Description/Provider.hpp"

namespace AGSR::Sessions::Royal
{
    using DescriptionSession = Session<Business::Modes::Description::Game,
        Business::Modes::Description::Result,
        Business::Royal::Providers::DescriptionProvider>;
};
