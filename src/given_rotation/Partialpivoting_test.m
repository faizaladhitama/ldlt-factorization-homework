function [E,p] = Partialpivoting(A)
[m,n] = size(A);
p = 1:m;
for k=1:n-1
    [c,m] = max(abs(A(k:n,k)))
    if c==0
        quit;
    end
    tmpA = A(k,:)
    tmpp = p(k)
    A(k,:) = A(m,:)
    p(k) = p(m)
    A(m,:) = tmpA
    p(m) = tmpp
end
E = A
    