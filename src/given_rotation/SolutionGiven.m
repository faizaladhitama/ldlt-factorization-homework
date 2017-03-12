A = [170 1;165 1;167 1;160 1]

[Q,R] = givenRotation(A)

b = [75;67;78;50]
p = length(b)
[m,n] = size(A)

% Ax = b
% Q^t*R*x = Q^t*b

R_ = transpose(Q)*A
c = transpose(Q)*b

[u,v] = size(z)

% karena terjadi peng-0-lan pada n baris maka
% c = nilai b setelah di transformasi
% z = nilai A

c2 = c([1:n],:)
p2 = length(c2)

x = zeros(p2,1)

x(p2) = c2(p2)/R(p2,p2) 

for i=p2-1:1
    sum=0;
    for j=p2:i+1
        sum = sum+R(i,j)*x(j);
    end
    x(i) = (c2(i)-sum)/R(i,i);
end

x