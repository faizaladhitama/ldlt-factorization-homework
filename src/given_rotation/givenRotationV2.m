function [Q,R] = givenRotationV2(A)
%GivenRotation melakukan dekomposisi matrix A
%   Input  = matrix A mxn
%   Output = matrix Q mxm
%            matrix R mxn
%   V2 mempercepat perhitungan karena hanya baris
%   yang melakukan rotasi saja yang mendapatkan operasi
%   perhitungan (berlaku untuk matrix besar)
%   contoh : di matriks 10x10 mulai terlihat bedanya
%   Lebih cepat dibandingkan householder tapi akurasi lebih rendah
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
            temp3 = temp;
            for k=1:n
                temp3(j,k) = identitas(j,:)*temp(:,k);
                temp3(j-1,k) = identitas(j-1,:)*temp(:,k);
            end
            temp = temp3;
            temp2 = temp2*transpose(identitas);
            identitas = eye(m);
        end
        a = a + 1;
    end
    R = temp;
    Q = temp2;
    toc
end
