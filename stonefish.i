%module stonefish
%{
#include "btBulletDynamicsCommon.h"
#include "StonefishCommon.h"
#include "tinyxml2.h"
#include "graphics/OpenGLDataStructs.h"
#include "core/NED.h"
#include "core/Robot.h"
#include "core/SimulationApp.h"
#include "core/GraphicalSimulationApp.h"
#include "core/ConsoleSimulationApp.h"
#include "core/ScenarioParser.h"
#include "core/SimulationManager.h"
#include "core/ParsedSimulationManager.h"
#include "actuators/Actuator.h"
#include "actuators/LinkActuator.h"
#include "actuators/Thruster.h"
#include "sensors/Sensor.h"
using namespace sf;
%}
%typemap(in) btScalar {
  $1 = PyFloat_AsDouble($input);
}
%typemap(out) btScalar {
  $result = PyFloat_FromDouble($1);
}
%typemap(out) sf::Actuator * {
  const sf::ActuatorType actuator_type = $1->getType();
  std::string tname = "sf::Actuator *";
  switch (actuator_type) {
    case sf::ActuatorType::MOTOR:
      tname = "sf::Motor *";
      break;
    case sf::ActuatorType::SERVO:
      tname = "sf::Servo *";
      break;
    case sf::ActuatorType::PROPELLER:
      tname = "sf::Propeller *";
      break;
    case sf::ActuatorType::THRUSTER:
      tname = "sf::Thruster *";
      break;
    case sf::ActuatorType::VBS:
      tname = "sf::VariableBuoyancy *";
      break;
    case sf::ActuatorType::LIGHT:
      tname = "sf::Light *";
      break;
    case sf::ActuatorType::RUDDER:
      tname = "sf::Rudder *";
      break;
    case sf::ActuatorType::SUCTION_CUP:
      tname = "sf::SuctionCup *";
      break;
    case sf::ActuatorType::PUSH:
      tname = "sf::Push *";
      break;
  }
  swig_type_info * const outtype = SWIG_TypeQuery(tname.c_str());
  $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), outtype, $owner);
}
%typemap(out) btTransform {
  PyObject* py_list = PyList_New(12);
  btTransformData data;
  $1.serialize(data);
  if (!py_list) return NULL;
  int idx = 0;
  for (int el = 0; el < 3; el++) {
    for (int fl = 0; fl < 3; fl++) {
      PyList_SetItem(py_list, idx, PyFloat_FromDouble(data.m_basis.m_el[el].m_floats[fl]));
      idx++;
    }
  }
  for (int tr = 0; tr < 3; tr++) {
    PyList_SetItem(py_list, idx, PyFloat_FromDouble(data.m_origin.m_floats[tr]));
    idx++;
  }
  $result = py_list;
}
%typemap(in) btVector3 {
    PyObject *obj = $input;
    if (PySequence_Check(obj) && PySequence_Size(obj) == 3) {
        PyObject *item0 = PySequence_GetItem(obj, 0);
        PyObject *item1 = PySequence_GetItem(obj, 1);
        PyObject *item2 = PySequence_GetItem(obj, 2);

        if (item0 && item1 && item2) {
            double x = PyFloat_AsDouble(item0);
            double y = PyFloat_AsDouble(item1);
            double z = PyFloat_AsDouble(item2);

            Py_DECREF(item0);
            Py_DECREF(item1);
            Py_DECREF(item2);

            if (PyErr_Occurred()) {
                SWIG_fail;
            }

            $1 = btVector3(btScalar(x), btScalar(y), btScalar(z));
        } else {
            Py_XDECREF(item0);
            Py_XDECREF(item1);
            Py_XDECREF(item2);
            SWIG_exception_fail(SWIG_TypeError, "Error extracting items from sequence");
        }
    } else {
        SWIG_exception_fail(SWIG_TypeError, "Expected a sequence of length 3");
    }
}

%include "stdint.i"
%include "std_string.i"
%include "std_vector.i"
%template(VectorU8) std::vector<uint8_t>;
%include "btBulletDynamicsCommon.h"
%include "StonefishCommon.h"
%include "tinyxml2.h"
%include "graphics/OpenGLDataStructs.h"
%include "core/NED.h"
%include "core/Robot.h"
%include "core/SimulationApp.h"
%include "core/GraphicalSimulationApp.h"
%include "core/ConsoleSimulationApp.h"
%include "core/ScenarioParser.h"
%include "core/SimulationManager.h"
%include "core/ParsedSimulationManager.h"
%include "actuators/Actuator.h"
%include "actuators/LinkActuator.h"
%include "actuators/Thruster.h"
%include "sensors/Sensor.h"
