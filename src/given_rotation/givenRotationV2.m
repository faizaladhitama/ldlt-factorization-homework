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
%   Qt * A = R
    tic
    [m,n] = size(A);
    I = eye(m);
    a = 1;
    tempR = A;
    tempQ = I;
    for i=n:-1:1
        for j=m:-1:(a+1)
            %asumsikan x = e1 dan y = e2
            e1 = tempR(j,a);
            e2 = tempR(j-1,a);
            % r = sqrt(e1^2+e2^2);
            % =============================================================
            % mengurangi kerja sqrt
            % r = sqrt(0+e2^2) = |e2|
            if e1 == 0
                r = abs(e2);
            % r = sqrt(e1^2+0) = |e1|
            elseif e2 == 0
                r = abs(e1);
            %meminimalisir error underflow / overflow pada r karena apabila
            %langsung di sqrt maka bisa underflow/overflow di r
            elseif abs(e1) > abs(e2)
                %menggunakan fungsi trigonometri sin = x/r = e1/sqrt(e1^2 +
                %e2^2) untuk mendapatkan r maka (1/sin)*x csc*x = sqrt(1 +
                %cot^2)*e1 =sqrt(1+(e2/e1)^2)*e1
                r = abs(e1*sqrt(1+(e2/e1)^2));
                %r tidak pernah negatif karena sejatinya merupakan
                %sqrt(e1^2+e2^2)
            else
                %menggunakan fungsi trigonometri cos = y/r = e2/sqrt(e1^2 +
                %e2^2) untuk mendapatkan r maka (1/cos)*y sec*y =
                %sqrt(1+cot^2)*e2 =sqrt(1+(e1/e2)^2)*e2
                r = abs(e2*sqrt(1+(e1/e2)^2));
                %r tidak pernah negatif karena sejatinya merupakan
                %sqrt(e1^2+e2^2)
            end
            % ============================================================
            c = e2/r;
            s = e1/r;
            I(j,j) = c;
            I(j-1,j-1) = c;
            I(j-1,j) = s;
            I(j,j-1) = -s;
            tempR_2row = tempR;
            %hanya mengalikan sejumlah 2xn
            %2 baris dan n kolom yang terkena proses rotasi
            for k=1:n
                tempR_2row(j,k) = I(j,:)*tempR(:,k);
                tempR_2row(j-1,k) = I(j-1,:)*tempR(:,k);
            end
            tempR = tempR_2row
            tempQ = tempQ*transpose(I);
            I = eye(m);
        end
        a = a + 1;
    end
    R = tempR;
    Q = tempQ;
    toc
end
