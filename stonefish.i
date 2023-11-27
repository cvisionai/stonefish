%module stonefish
%{
#include "btBulletDynamicsCommon.h"
#include "StonefishCommon.h"
#include "tinyxml2.h"
#include "graphics/OpenGLDataStructs.h"
#include "core/NED.h"
#include "core/Robot.h"
#include "core/SimulationApp.h"
#include "core/ConsoleSimulationApp.h"
#include "core/ScenarioParser.h"
#include "core/SimulationManager.h"
#include "core/ParsedSimulationManager.h"
using namespace sf;
%}
%typemap(in) btScalar {
  $1 = PyFloat_AsDouble($input);
}
%typemap(out) btScalar {
  $result = PyFloat_FromDouble($1);
}
%include "std_string.i"
%include "btBulletDynamicsCommon.h"
%include "StonefishCommon.h"
%include "tinyxml2.h"
%include "graphics/OpenGLDataStructs.h"
%include "core/NED.h"
%include "core/Robot.h"
%include "core/SimulationApp.h"
%include "core/ConsoleSimulationApp.h"
%include "core/ScenarioParser.h"
%include "core/SimulationManager.h"
%include "core/ParsedSimulationManager.h"
