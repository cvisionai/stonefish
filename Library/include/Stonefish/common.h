//
//  common.h
//  Stonefish
//
//  Created by Patryk Cieslak on 1/25/13.
//  Copyright (c) 2013 Patryk Cieslak. All rights reserved.
//

#ifndef __Stonefish_common_h__
#define __Stonefish_common_h__

//Framework options
//#define USE_ADVANCED_GUI
//#define BT_USE_DOUBLE_PRECISION

//Headers
//common
#include <string>
#include <vector>
#include <deque>
#include <memory>
#include <math.h>

//macosx
#include <Carbon/Carbon.h>

//opengl
#define GL_GLEXT_PROTOTYPES
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <OpenGL/glu.h>
#include <glm/glm.hpp>
#include <glm/ext.hpp>

//bullet physics
#define BT_EULER_DEFAULT_ZYX
#define CONSTRAINT_ERP 0.2
#define CONSTRAINT_CFM 0.0
#define CONSTRAINT_STOP_ERP 1.0
#define CONSTRAINT_STOP_CFM 0.0

#include <BulletDynamics/btBulletDynamicsCommon.h>
#include <BulletDynamics/ConstraintSolver/btGeneric6DofConstraint.h>
#include <BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h>

#include <BulletCollision/CollisionDispatch/btGhostObject.h>
#include <BulletCollision/CollisionShapes/btHeightfieldTerrainShape.h>
#include <BulletCollision/NarrowPhaseCollision/btRaycastCallback.h>
#include <BulletCollision/btBulletCollisionCommon.h>
#include <BulletCollision/Gimpact/btGImpactCollisionAlgorithm.h>
#include <BulletCollision/Gimpact/btGImpactShape.h>

#include <BulletSoftBody/btSoftRigidDynamicsWorld.h>
#include <BulletSoftBody/btSoftBodyRigidBodyCollisionConfiguration.h>

//framework
#include "UnitSystem.h"

//gui
#ifdef USE_ADVANCED_GUI
#include <CEGUI/CEGUI.h>
#include <CEGUI/RendererModules/OpenGL/GLRenderer.h>
#endif

#endif