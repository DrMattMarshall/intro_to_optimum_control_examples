clear all

k = 1;
M1 = 1;
M2 = M1;

A = [0 1 0 0;
     -k/M1, 0, k/M1, 0;
     0 0 0 1;
     k/M2, 0, -k/M2, 0];
B = [0; 0; 0; 1/M2];
C = [1 0 -1 0];

q = 1;
r = 1;

Q = [1+q^2, 0, 1-q^2, 0;
     0 0 0 0;
     1-q^2, 0, 1+q^2, 0;
     0 0 0 0];
R = r^2;

%fun = @gainsTrains;

options=optimoptions(@fsolve,'MaxFunctionEvaluations', 1e5, 'MaxIterations', 1e4);

p = 1;

while (p ~= 0)
  rand_int = randi(3,1);
  rand_int = 2;
  m0 = rand_int*(rand(1,10)-.5);
  
  rand_int = randi(5,1);
  m0 = rand_int*rand(1,10)

%  m = fsolve(fun, m0, A, B, Q, R, options);
  m = fsolve(@(m) gainsTrains(m, A, B, Q, R), m0, options);

  MHat = [m(1) m(2) m(3) m(4);
	  m(2) m(5) m(6) m(7);
	  m(3) m(6) m(8) m(9);
	  m(4) m(7) m(9) m(10)];

  [~, p] = chol(MHat)
end

K = inv(R) * B' * MHat

AC = A - B * K;

e = eig(AC)
