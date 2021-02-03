clear all

%
% Plant parameters
%
alpha = 1;
beta = 3;


%
% SS rep for plant
%
A = [0 1;
     0 -alpha];
B = [0; beta];
C = [1 0];


%
% Controllability and observability
%
CM = [B A*B];
det(CM);
OM = [C; C*A];
det(OM);


%
% Gains designed via quadratic optimization
%
q1 = 1;
q2 = 10;
c = 1/q2;
%K = [q1, (1/beta)*(sqrt(alpha^2+2*q1*beta)-alpha)]
K = [c*q1, (1/beta)*(sqrt(alpha^2+2*q1*beta*c)-alpha)]


AC = A - B * K;

e = eig(AC)
