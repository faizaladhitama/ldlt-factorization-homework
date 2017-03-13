function [Q,R] = givenRotation(A)
%GivenRotation melakukan dekomposisi matrix A
%   Input  = matrix A nxn
%   Output = matrix Q mxn
%            matrix R nxn
%   Akurasi cukup rendah karena ada fungsi sqrt
    tic
    [m,n] = size(A);
    identitas = eye(m);
    a = 1;
    temp = A;
    temp2 = identitas;
    for i=n:-1:1
        for j=m:-1:(a+1)
            e1 = temp(j,a);
            e2 = temp(j-1,a);
            r = sqrt(e1^2+e2^2);
            c = e2/r;
            s = e1/r;
            identitas(j,j) = c;
            identitas(j-1,j-1) = c;
            identitas(j-1,j) = s;
            identitas(j,j-1) = -s;
            identitas;
            temp = identitas*temp;
            temp2 = temp2*transpose(identitas);
            identitas = eye(m);
        end
        a = a + 1;
    end
    R = temp;
    Q = temp2;
    toc
end
