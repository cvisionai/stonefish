/*    
    This file is a part of Stonefish.

    Stonefish is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Stonefish is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

//
//  ParsedSimulationManager.cpp
//  Stonefish
//
//  Created by Patryk Cieslak on 04/03/2014.
//  Copyright(c) 2014-2023 Patryk Cieslak. All rights reserved.
//

#include "core/ParsedSimulationManager.h"
#include <core/ScenarioParser.h>
#include <utils/SystemUtil.hpp>
#include <iostream>

ParsedSimulationManager::ParsedSimulationManager(sf::Scalar stepsPerSecond)
: SimulationManager(stepsPerSecond, sf::SolverType::SOLVER_SI, sf::CollisionFilteringType::COLLISION_EXCLUSIVE)
{
}

void ParsedSimulationManager::BuildScenario()
{
    std::cout << "MAKING PARSER!" << std::endl;
    sf::ScenarioParser parser(this);
    //std::cout << "PARSING " << sf::GetDataPath() << std::endl;
    bool success = parser.Parse(sf::GetDataPath() + "default.scn");
    std::cout << "SUCCESS? " << success << std::endl;
    if(!success)
        cCritical("Scenario parser: Parsing failed!");
}
