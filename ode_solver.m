tic

absTol = 1e-6;
relTol = 1e-6;
options = odeset('RelTol', relTol, 'AbsTol', absTol);

C = 1e-9;
Rmax = 500;
k = [1e7 1e-3];

y0Asso = [C, Rmax, 0];
tspanAsso = [0.0, 200.0];

[XAsso, YAsso] = ode15s(@(x, y) lorenz (x, y, k), tspanAsso, y0Asso, options);

y0Disso = [0, 0, YAsso(end, 3)];
tspanDisso = [201.0:500];
[XDisso, YDisso] = ode15s(@(x, y) lorenz (x, y, k), tspanDisso, y0Disso, options);

X = []; Y = [];
X = [X; XAsso; XDisso];        
Y = [Y; YAsso; YDisso];   

plot(X, Y(:, 3));

toc


function dy = lorenz(x, y, k, t)

ka = k(1);
kd = k(2);
dy = zeros(3, 1);

dy(1) = 0;
dy(2) = -ka*y(1)*y(2) + kd*y(3);
dy(3) = ka*y(1)*y(2) - kd*y(3);

end