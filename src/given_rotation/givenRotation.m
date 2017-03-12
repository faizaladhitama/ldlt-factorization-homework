function [Q,R] = givenRotation(A)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [m,n] = size(A);
    identitas = eye(m);
    a = 1;
    temp = A;
    temp2 = identitas;
    for i=n:-1:1
        for j=m:-1:m-i
            e1 = temp(j,a);
            e2 = temp(j-1,a);
            r = sqrt(e1^2+e2^2);
            c = e2/r;
            s = e1/r;
            identitas(j,j) = c;
            identitas(j-1,j-1) = c;
            identitas(j-1,j) = s;
            identitas(j,j-1) = -s;
            temp = identitas*temp;
            temp2 = temp2*transpose(identitas);
            identitas = eye(m);
        end
        a = a + 1;
    end
    
    R = temp;
    Q = temp2;
end
