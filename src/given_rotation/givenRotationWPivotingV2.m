function [Q,R,p] = givenRotationWPivotingV2(A)
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
    zero = zeros(m,1)
    p = eye(m);
    for i=n:-1:1
        zero(a:m,1) = A(a:m,a);
        [c,z] = max(abs(zero))
        if c==0
            quit;
        end
        tmpA = A(a,:);
        tmpp = p(a,:);
        A(a,:) = A(z,:);
        p(a,:) = p(z,:);
        A(z,:) = tmpA;
        p(z,:) = tmpp;
        A
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
        zero = zeros(m,1);
    end
    R = temp;
    Q = temp2;
    p;
    toc
end
