function F = gainsTrains(m, A, B, Q, R)

MHat = [m(1) m(2) m(3) m(4);
	m(2) m(5) m(6) m(7);
	m(3) m(6) m(8) m(9);
	m(4) m(7) m(9) m(10)];

GHat = inv(R)*B'*MHat;

MHatA = MHat*A;

ATransposeMHat = A'* MHat;

MBRBM = MHat * B * inv(R) * B' * MHat;

zero = MHatA + ATransposeMHat - MBRBM + Q;

if 1==0
  for i = 1:4
    for j = 1:4
      F(4*(i-1)+j) = zero(i, j);
    end
  end

else
  for i = 1:4
    F(i) = zero(i, i);
  end
  F(5) = zero(2, 1);
  F(6) = zero(3, 1);
  F(7) = zero(4, 1);
  F(8) = zero(3, 2);
  F(9) = zero(4, 2);
  F(10) = zero(4, 3);
end
