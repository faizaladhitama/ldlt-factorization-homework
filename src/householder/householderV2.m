% A merupakan matriks persegi
% b merupakan matriks n x 1
% dimana A merupakan mastriks segitiga atas
function [Q, R] = householder(A)
tic
[m,n] = size(A);
x = zeros(m,1);
tempR = A;
tempQ = eye(m);
temporaryH = eye(m)
for i = 1:n
    I = eye(m-i+1);
    zero = zeros(m-i+1,1);
    zero(1,1) = 1;
    x = transpose(tempR([i:m],i));
    x = transpose(x);
    tempSign = 1*sign(x(1,1));
    v = x+(norm(x)*zero*tempSign);
    c = 2/norm(transpose(v)*v);
    H = I - (c*v*transpose(v));
    tempR([i:m],[i:n]) = H*tempR([i:m],[i:n]);
    temporaryH([i:m],[i:m]) = H;
    temporaryI = eye(m);
    temporaryI([i:m],[i:m])= H;
    H = temporaryI;
    tempQ = tempQ*H;
end
Q = tempQ;
R = tempR;
toc