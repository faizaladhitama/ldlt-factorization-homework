function [x] = BackwardGiven(Q,R,b)
    % Qt*A = R
    % A = Q*R -> Qt = inv(Q) karena Q orthogonal
    % Ax = b
    % (Q*R)*x = Q^t*b
    % b dikalikan dengan Q transpose karena
    % terjadi perubahan baris sehingga b perlu
    % di transformasi juga (sama seperti pivoting)
    
    [m,n] = size(R);
    
    c = transpose(Q)*b;
    % karena terjadi peng-0-lan pada n baris maka
    % c = nilai b setelah di transformasi

    % c2 = matrix yang barisnya dikurangi agar menjadi matrix persegi
    % karena terjadi peng-0-lan baris
    c2 = c([1:n],:);
    p2 = length(c2);

    x = zeros(p2,1);
    x(p2) = c2(p2)/R(p2,p2);
    for i=p2-1:-1:1
        sum=0;
        for j=p2:i+1;
            sum = sum+R(i,j)*x(j);
        end
        x(i) = (c2(i)-sum)/R(i,i);
    end
end