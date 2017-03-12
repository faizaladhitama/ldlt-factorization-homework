function [Q,R,p] = givenRotationWPivoting(A)
%GivenRotation melakukan dekomposisi matrix A
%   Input  = matrix A nxn
%   Output = matrix Q mxn
%            matrix R nxn
%   Menggunakan pivoting = menambah akurasi mengurangi kecepatan
    tic
    [m,n] = size(A);
    identitas = eye(m);
    a = 1;
    temp = A;
    temp2 = identitas;
    p = 1:m;
    for i=n:-1:1
        [c,z] = max(abs(A(a:n,a)));
        if c==0
            quit;
        end
        tmpA = A(a,:);
        tmpp = p(a);
        A(a,:) = A(z,:);
        p(a) = p(z);
        A(z,:) = tmpA;
        p(z) = tmpp;
        temp;
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
    p;
    toc
end
