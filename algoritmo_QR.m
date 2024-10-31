%Los vectores columnas han de ser linealmente independientes

clear
clc
A = [10 1 2 ; 4 6 -1 ; -2 3 8];
tol = 0.0001;
[R] = alg_QR(A,tol);
disp(R)

function [R] = alg_QR(A,tol)

    while true

        [n,m] = size(A);
        Q = zeros(n,m);
        Q(:,1) = A(:,1);

        for i = 2 : m

            sumatorio = 0;

            for j = 1 : i-1

                sumatorio = sumatorio + (((A(:,i)' * Q(:,j)) / (norm(Q(:,j))^2)) * Q(:,j));

            end

            Q(:,i) = A(:,i) - sumatorio;

        end

        for i = 1 : m

            Q(:,i) = Q(:,i) / norm(Q(:,i));

        end

        R = zeros(n,m);

        for i = 1 : n

            for j = i : m

                R(i,j) = Q(:,i)' * A(:,j);

            end

        end

        [n] = size(R);

        for i = 2 : n

            for j = 1 : i-1

                if R(i,j) < tol

                    check = true;

                else 

                    check = false;
                    break

                end

            end

            if check == false

                A = R * Q;
                break

            end

        end

        if check == true

            break

        end

    end

end
