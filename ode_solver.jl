# using Pkg
# Pkg.add("DifferentialEquations")
using DifferentialEquations
using Plots
using BenchmarkTools

function lorenz!(dy, y, k, t)
    y1, y2, y3 = y;
    ka, kd = k;
    dy[1] = 0;
    dy[2] = -ka*y1*y2 + kd*y3;
    dy[3] = ka*y1*y2 - kd*y3;
    nothing
end

C = 1e-9;
Rmax = 500;
k = [1e7 1e-3];

y0Asso = [C; Rmax; 0];
tspanAsso = [0.0, 200.0];
probAsso = ODEProblem(lorenz!, y0Asso, tspanAsso, k);
solAsso = solve(probAsso, saveat=0.01);

y0Disso = [0; 0; solAsso[3, end]];
tspanDisso = (201.0, 500);
probDisso = ODEProblem(lorenz!, y0Disso, tspanDisso, k);
solDisso = solve(probDisso, saveat=0.01);

t = [solAsso.t; solDisso.t];
r = [solAsso[3, :]; solDisso[3, :]];

plot(t, r)