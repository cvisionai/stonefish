import stonefish
sim = stonefish.ParsedSimulationManager(5.0)
app = stonefish.ConsoleSimulationApp("Console Test", "../Tests/Data/", sim);
app.Init()
heaveBow = sim.getActuator(2)
heaveStern = sim.getActuator(3)
auv = sim.getRobot(0)
sim.StartSimulation()
sim.setRealtimeFactor(1)
while True:
    heaveBow.setSetpoint(0.5)
    heaveStern.setSetpoint(0.5)
    sim.AdvanceSimulation(True) # passing true will update exactly once per advance, false will use real-time with factor applied (lots of sleeping)
    transform = auv.getTransform()
    print(f"Z-position: {transform[-1]}")
    print(f"Heave Bow Thrust: {heaveBow.getThrust()}")
    print(f"Heave Stern Thrust: {heaveStern.getThrust()}")
