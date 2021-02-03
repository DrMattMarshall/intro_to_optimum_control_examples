clear all

k = 1;
M1 = 1;
M2 = M1;

A = [0 1 0 0;
     -k/M1, 0, k/M1, 0;
     0 0 0 1;
     k/M2, 0, -k/M2, 0]
B = [0; 0; 0; 1/M2];
C = [1 0 0 0];

usingSymArray = 1;
if usingSymArray
  mBar = sym('m', [1 10])
  MHat = [mBar(1) mBar(2) mBar(3) mBar(4);
	  mBar(2) mBar(5) mBar(6) mBar(7);
	  mBar(3) mBar(6) mBar(8) mBar(9);
	  mBar(4) mBar(7) mBar(9) mBar(10)]
else
  syms m1 m2 m3 m4 m5 m6 m7 m8 m9 m10
  MHat = [m1 m2 m3 m4;
	  m2 m5 m6 m7;
	  m3 m6 m8 m9;
	  m4 m7 m9 m10]
end

q = .1;
r = .1;

Q = [1+q^2, 0, 1-q^2, 0;
     0 0 0 0;
     1-q^2, 0, 1+q^2, 0;
     0 0 0 0];
R = r^2;

GHat = inv(R)*B'*MHat

MHatA = MHat*A

ATransposeMHat = A'* MHat

MBRBM = MHat * B * inv(R) * B' * MHat

zero = MHatA + ATransposeMHat - MBRBM + Q
