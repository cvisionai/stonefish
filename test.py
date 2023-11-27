import stonefish
sim = stonefish.ParsedSimulationManager(5.0)
app = stonefish.ConsoleSimulationApp("Console Test", "../Tests/Data/", sim);
app.Init()
sim.StartSimulation()
sim.setRealtimeFactor(100)
while True:
    sim.AdvanceSimulation()
